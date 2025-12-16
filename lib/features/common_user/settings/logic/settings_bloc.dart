import 'dart:async';
import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/connection/firestore_worker.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_event.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/excel_backup.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/function/service_dart.dart';
import 'package:flutter_pos/request/update_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final DataUserRepositoryCache repoCache;
  final ServicePrinter service;
  StreamSubscription<List<BluetoothDevice>>? _scanSub;

  SettingsBloc(this.service, this.repoCache) : super(SettingsInital()) {
    on<SettingsProfile>(_onProfile);
    on<SettingsFeature>(_onFeature);
    on<SettingsFeatureFIFO>(_onFeatureFiFO);
    on<SettingsSyncData>(_onSyncData);
    on<SettingsSelectedSyncData>(_onSelectedSyncData);
    on<SettingPushData>(_onPushData);
    on<SettingGetData>(_onGetData);
    on<SettingCancelSync>(_onCancelSync);
    on<SettingsStartScanEvent>(_onScan);
    on<SettingsSelectPrinterEvent>(_onSelectPrinter);
    on<SettingsPrintTestEvent>(_onPrintTest);
    on<SettingsDisconnectPrinterEvent>(_onDisconnect);
    on<SettingsPrinterInit>(_onPrinterInit);
    on<SettingsPrinterAutoConnect>(_onPrinterAutoConnect);
    on<SettingsLogoHeaderFooterInit>(_onLogoHeaderFooterInit);
    on<SettingsLogoHeaderFooterUpdate>(_onLogoHeaderFooterUpdate);
    on<SettingsBackupRestoreinit>(_onBackupRestoreInit);
    on<SettingsBackup>(_onBackup);
  }

  FutureOr<void> _onProfile(
    SettingsProfile event,
    Emitter<SettingsState> emit,
  ) {
    final dataCompany = repoCache.getCompany();
    final dataAccount = repoCache.getAccount();
    emit(
      SettingsProfileLoaded(dataAccount: dataAccount, dataCompany: dataCompany),
    );
  }

  Future<void> _onFeature(
    SettingsFeature event,
    Emitter<SettingsState> emit,
  ) async {
    final pref = await SharedPreferences.getInstance();
    final isFifo = pref.getBool('fifo') ?? false;

    emit(SettingsFeatureLoaded(isFifo: isFifo));
  }

  Future<void> _onFeatureFiFO(
    SettingsFeatureFIFO event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state as SettingsFeatureLoaded;
    final isFifo = currentState.isFifo;

    final pref = await SharedPreferences.getInstance();
    pref.setBool('fifo', !isFifo);
    UserSession.init(repoCache);

    debugPrint("Log Settings: Feature Fifo: $isFifo");
    emit(currentState.copyWith(isFifo: !isFifo));
  }

  FutureOr<void> _onSyncData(
    SettingsSyncData event,
    Emitter<SettingsState> emit,
  ) {
    final syncData = {for (final data in ListForDatabase.values) data: false};
    emit(SettingsSyncDataLoaded(dataSyncData: syncData));
  }

  FutureOr<void> _onSelectedSyncData(
    SettingsSelectedSyncData event,
    Emitter<SettingsState> emit,
  ) {
    final currentState = state as SettingsSyncDataLoaded;

    emit(currentState.copyWith(dataSyncData: event.selectedData));
  }

  Future<void> _onPushData(
    SettingPushData event,
    Emitter<SettingsState> emit,
  ) async {
    await FirestoreWorker.processQueueHive();
  }

  Future<void> _onGetData(
    SettingGetData event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state as SettingsSyncDataLoaded;

    final selectedMap = currentState.dataSyncData.entries
        .where((e) => e.value)
        .map((e) => e.key)
        .toList();

    if (selectedMap.isEmpty) return;

    emit(
      currentState.copyWith(isSyncing: true, progress: 0, isCancelled: false),
    );

    int done = 0;
    final total = selectedMap.length;

    for (final key in selectedMap) {
      final latestState = state as SettingsSyncDataLoaded;
      if (latestState.isCancelled) break;

      emit(latestState.copyWith(currentStep: key.name));

      switch (key) {
        case ListForDatabase.Item:
          await repoCache.initItem();
          break;
        case ListForDatabase.Kas:
          await repoCache.initFinancial();
          break;
        case ListForDatabase.Kontak:
          await repoCache.initPartner();
          break;
        case ListForDatabase.Transaksi:
          await Future.wait([
            repoCache.initTransactionBuy(),
            repoCache.initTransactionSell(),
            repoCache.initTransIncome(),
            repoCache.initTransExpense(),
          ]);
          break;
        case ListForDatabase.Operator:
          await repoCache.initUser();
          break;
      }

      done++;
      emit((state as SettingsSyncDataLoaded).copyWith(progress: done / total));
    }

    emit(
      (state as SettingsSyncDataLoaded).copyWith(
        isSyncing: false,
        currentStep: '',
      ),
    );
  }

  void _onCancelSync(SettingCancelSync event, Emitter<SettingsState> emit) {
    final currentState = state as SettingsSyncDataLoaded;
    emit(currentState.copyWith(isCancelled: true));
  }

  Future<void> _onScan(SettingsStartScanEvent event, Emitter emit) async {
    if (state is SettingsPrinterScanning) return;

    emit(SettingsPrinterScanning());

    await _scanSub?.cancel();
    _scanSub = null;

    await service.startScan();

    _scanSub = service.uniqueScanResults.listen((devices) {
      emit(SettingsPrinterScanResult(devices));
    });

    await Future.delayed(const Duration(seconds: 4));
    await service.stopScan();
    await _scanSub?.cancel();
    _scanSub = null;
  }

  Future<void> _onSelectPrinter(
    SettingsSelectPrinterEvent event,
    Emitter emit,
  ) async {
    emit(SettingsPrinterConnecting());
    await service.connect(event.device);
    emit(SettingsPrinterConnected(event.device));
  }

  Future<void> _onPrintTest(SettingsPrintTestEvent event, Emitter emit) async {
    emit(SettingsPrinterPrinting());
    await service.printTest();

    final connected = state is SettingsPrinterConnected
        ? (state as SettingsPrinterConnected).device
        : null;

    if (connected != null) {
      emit(SettingsPrinterConnected(connected));
    }
  }

  Future<void> _onDisconnect(
    SettingsDisconnectPrinterEvent event,
    Emitter emit,
  ) async {
    await service.disconnect();
    emit(SettingsPrinterDisconnected());
  }

  FutureOr<void> _onPrinterInit(
    SettingsPrinterInit event,
    Emitter<SettingsState> emit,
  ) {
    emit(SettingsPrinterInitial());
  }

  Future<void> _onPrinterAutoConnect(
    SettingsPrinterAutoConnect event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      await service.autoConnectSavedPrinter();
    } catch (_) {}
  }

  FutureOr<void> _onLogoHeaderFooterInit(
    SettingsLogoHeaderFooterInit event,
    Emitter<SettingsState> emit,
  ) {
    emit(
      SettingsLogoHeaderFooterLoaded(
        footer: repoCache.dataCompany!.getFooter,
        header: repoCache.dataCompany!.getHeader,
      ),
    );
  }

  FutureOr<void> _onLogoHeaderFooterUpdate(
    SettingsLogoHeaderFooterUpdate event,
    Emitter<SettingsState> emit,
  ) {
    repoCache.dataCompany = repoCache.dataCompany!.copyWith(
      footer: event.footer,
      header: event.header,
    );
    updateLogoHeaderFoter(header: event.header, footer: event.footer);
    add(SettingsLogoHeaderFooterInit());
  }

  Future<void> _onBackupRestoreInit(
    SettingsBackupRestoreinit event,
    Emitter<SettingsState> emit,
  ) async {
    final dir = await getApplicationDocumentsDirectory();
    final files = dir
        .listSync()
        .where((f) => f.path.endsWith('.xlsx'))
        .toList();
    emit(SettingsBackupRestoreLoaded(listFile: files));
  }

  FutureOr<void> _onBackup(SettingsBackup event, Emitter<SettingsState> emit) {
    backupItemsToExcel(repo: repoCache);
  }
}
