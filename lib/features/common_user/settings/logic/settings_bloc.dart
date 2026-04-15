import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/connection/firestore_worker.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_event.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/data_user/isar/action/delete/delete_data_isar_all.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/features/data_user/isar/action/save_update_data_isar.dart';
import 'package:flutter_pos/from_and_to_map/from_map.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_counter.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_item_ordered_batch.dart';
import 'package:flutter_pos/service/backup_restore/excel_backup.dart';
import 'package:flutter_pos/service/backup_restore/excel_restore.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_company.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_split.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/request/update_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final DataUserRepositoryCache repoCache;

  SettingsBloc(this.repoCache) : super(SettingsInital()) {
    on<SettingsProfile>(_onProfile);
    on<SettingsFeature>(_onFeature);
    on<SettingsFeatureFIFO>(_onFeatureFIFO);
    on<SettingsFeatureSelectedStockMode>(_onSelectedStockMode);
    on<SettingsSyncData>(_onSyncData);
    on<SettingsSelectedSyncData>(_onSelectedSyncData);
    on<SettingPushData>(_onPushData);
    on<SettingGetData>(_onGetData);
    on<SettingCancelSync>(_onCancelSync);
    on<SettingsLogoHeaderFooterInit>(_onLogoHeaderFooterInit);
    on<SettingsLogoHeaderFooterUpdate>(_onLogoHeaderFooterUpdate);
    on<SettingsBackupRestoreinit>(_onBackupRestoreInit);
    on<SettingsBackup>(_onBackup);
    on<SettingsRestore>(_onRestore);
    on<SettingsSelectedBackup>(_onSelectedBackup);
    on<SettingsShareBackup>(_onShareBackup);
    on<SettingsReset>(_onReset);
  }

  Future<void> _onProfile(
    SettingsProfile event,
    Emitter<SettingsState> emit,
  ) async {
    final dataCompany = await getAllCompanyIsar();
    final dataAccount = await getAllAccountIsar();
    emit(
      SettingsProfileLoaded(dataAccount: dataAccount, dataCompany: dataCompany),
    );
  }

  Future<void> _onFeature(
    SettingsFeature event,
    Emitter<SettingsState> emit,
  ) async {
    devLog(
      "Log SettingsBloc: selectedMode Init: ${UserSession.getSelectedStockMode()}",
    );
    emit(
      SettingsFeatureLoaded(
        isFifo: UserSession.getStatusFifo(),
        selectedMode: UserSession.getSelectedStockMode(),
      ),
    );
  }

  Future<void> _onFeatureFIFO(
    SettingsFeatureFIFO event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state as SettingsFeatureLoaded;
    final isFifo = currentState.isFifo;

    final pref = await SharedPreferences.getInstance();
    pref.setBool('fifo', !isFifo);
    UserSession.init();

    devLog("Log Settings: Feature Fifo: $isFifo");
    emit(currentState.copyWith(isFifo: !isFifo));
  }

  Future<void> _onSelectedStockMode(
    SettingsFeatureSelectedStockMode event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state as SettingsFeatureLoaded;
    final selectedStockMode = event.stockMode;

    final pref = await SharedPreferences.getInstance();
    pref.setString('stockMode', selectedStockMode.name);
    UserSession.init();

    emit(currentState.copyWith(stockMode: selectedStockMode));
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
          await repoCache.initCategory();
          break;
        case ListForDatabase.Kas:
          await repoCache.initFinancial();
          break;
        case ListForDatabase.Kontak:
          await repoCache.initPartner();
          break;
        case ListForDatabase.Transaksi:
          await Future.wait([
            repoCache.initTransaction(),
            repoCache.initBatch(),
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

  Future<void> _onLogoHeaderFooterInit(
    SettingsLogoHeaderFooterInit event,
    Emitter<SettingsState> emit,
  ) async {
    final company = await getAllCompanyIsar();
    emit(
      SettingsLogoHeaderFooterLoaded(
        footer: company.getFooter,
        header: company.getHeader,
      ),
    );
  }

  Future<void> _onLogoHeaderFooterUpdate(
    SettingsLogoHeaderFooterUpdate event,
    Emitter<SettingsState> emit,
  ) async {
    final company = await getAllCompanyIsar();
    await saveCompany_Isar(
      company.copyWith(footer: event.footer, header: event.header),
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
        .where((element) => element.path.endsWith('.xlsx'))
        .toList();
    emit(SettingsBackupRestoreLoaded(listFile: files));
  }

  Future<void> _onBackup(
    SettingsBackup event,
    Emitter<SettingsState> emit,
  ) async {
    await ExcelBackupService(
      context: event.context,
      repo: repoCache,
      name: event.name,
    ).backupItemsToExcel();

    add(SettingsBackupRestoreinit());
  }

  Future<void> _onRestore(
    SettingsRestore event,
    Emitter<SettingsState> emit,
  ) async {
    final currentState = state as SettingsBackupRestoreLoaded;
    List<ModelItemOrdered> itemsOrdered = [];
    List<ModelItemOrdered> itemCondiment = [];
    List<ModelItemOrderedBatch> itemsOrderedBatch = [];
    List<ModelSplit> splitPayment = [];
    List<ModelItemBatch> itemBatch = [];
    await ExcelRestoreService(
      file: currentState.selectedFile as File,
      handlers: {
        ListDataHeaderExcel.Akun.name: (sheet) async => restoreSheet<ModelUser>(
          sheet: sheet,
          id: FieldDataUser.id_user.name,

          getMap: (data) async {
            final dataAccount = await getAllAccountIsar();
            if (data[FieldDataUser.id_user.name] == dataAccount.idUser) {
              devLog("Log SettingsBloc: Restore aman");
              await deleteAllCommonDataIsar();
              await ExcelRestoreService(
                file: currentState.selectedFile as File,
                handlers: {
                  ListDataHeaderExcel.Riwayat_Penjualan_Item.name.replaceAll(
                    " ",
                    "_",
                  ): (sheet) => restoreSheet<ModelItemOrdered>(
                    sheet: sheet,
                    id: FieldDataItemOrdered.id_ordered.name,

                    getMap: (data) {
                      itemsOrdered.add(
                        fromMapItemOrdered(
                          itemBatch: [],
                          items: data,
                          condiment: [],
                          isCondiment: true,
                          id_ordered:
                              data[FieldDataItemOrdered.id_ordered.name
                                  .replaceAll(" ", "_")],
                        ),
                      );
                    },
                  ),

                  ListDataHeaderExcel.Riwayat_Penjualan_Item_Batch.name
                      .replaceAll(" ", "_"): (sheet) =>
                      restoreSheet<ModelItemOrderedBatch>(
                        sheet: sheet,
                        id: FieldDataItemOrderedBatch.id_ordered.name,
                        getMap: (data) => itemsOrderedBatch.add(
                          fromMapItemOrderedBatch(
                            orderedBatch: data,
                            id_ordered:
                                data[FieldDataItemOrderedBatch.id_ordered.name],
                          ),
                        ),
                      ),

                  ListDataHeaderExcel.Riwayat_Penjualan_Tambahan.name
                      .replaceAll(" ", "_"): (sheet) =>
                      restoreSheet<ModelItemOrdered>(
                        sheet: sheet,
                        id: FieldDataItemOrdered.id_ordered.name,

                        getMap: (data) {
                          itemCondiment.add(
                            fromMapItemOrdered(
                              itemBatch: [],
                              items: data,
                              condiment: [],
                              isCondiment: true,
                              id_ordered:
                                  data[FieldDataItemOrdered.id_ordered.name
                                      .replaceAll(" ", "_")],
                            ),
                          );
                        },
                      ),

                  ListDataHeaderExcel.Batch_Item.name.replaceAll(
                    " ",
                    "_",
                  ): (sheet) => restoreSheet<ModelItemBatch>(
                    sheet: sheet,
                    id: FieldDataItemBatch.invoice.name,
                    getMap: (data) {
                      itemBatch.add(
                        fromMapItembatch(
                          data,
                          data[FieldDataItemBatch.invoice.name.replaceAll(
                            " ",
                            "_",
                          )],
                        ),
                      );
                    },
                  ),

                  ListDataHeaderExcel.Riwayat_Pembayaran_Split.name.replaceAll(
                    " ",
                    "_",
                  ): (sheet) => restoreSheet<ModelSplit>(
                    sheet: sheet,
                    id: FieldDataSplit.invoice.name,

                    getMap: (data) {
                      splitPayment.add(
                        fromMapSplit(
                          data,
                          invoice: data[FieldDataSplit.invoice],
                        ),
                      );
                    },
                  ),

                  ListDataHeaderExcel.Riwayat_Pembelian_Item.name.replaceAll(
                    " ",
                    "_",
                  ): (sheet) => restoreSheet<ModelItemOrdered>(
                    sheet: sheet,
                    id: FieldDataItemOrdered.id_ordered.name,

                    getMap: (data) {
                      itemsOrdered.add(
                        fromMapItemOrdered(
                          itemBatch: [],
                          items: data,
                          condiment: [],
                          isCondiment: true,
                          id_ordered:
                              data[FieldDataItemOrdered.id_ordered.name
                                  .replaceAll(" ", "_")],
                        ),
                      );
                    },
                  ),
                },
              ).restore();

              await ExcelRestoreService(
                file: currentState.selectedFile as File,
                handlers: {
                  // ListDataHeaderExcel.Akun.name: (sheet) =>
                  //     restoreSheet<ModelUser>(
                  //       sheet: sheet,
                  //       id: FieldDataUser.id_user.name,
                  //
                  //       fromMap: (data, id) => fromMapUser(data, id),
                  //     ),
                  ListDataHeaderExcel.Batch.name: (sheet) async =>
                      restoreSheet<ModelCounter>(
                        sheet: sheet,
                        id: FieldDataBatch.invoice.name,
                        fromMap: (data, id) async => await saveBatch_Isar(
                          fromMapBatch(
                            data,
                            data[FieldDataBatch.invoice],
                            dataList: itemBatch,
                          ),
                        ),
                      ),

                  ListDataHeaderExcel.Counter.name: (sheet) async =>
                      restoreSheet<ModelCounter>(
                        sheet: sheet,
                        id: FieldDataCounter.id_branch.name,
                        fromMap: (data, id) async =>
                            await saveCounter_Isar(fromMapCounter(data, id)),
                      ),

                  ListDataHeaderExcel.Usaha.name: (sheet) async =>
                      restoreSheet<ModelCompany>(
                        sheet: sheet,
                        id: FieldDataCompany.id_company.name,
                        fromMap: (data, id) async =>
                            await saveCompany_Isar(fromMapCompany(data, id)),
                      ),

                  ListDataHeaderExcel.Item.name: (sheet) async =>
                      restoreSheet<ModelItem>(
                        sheet: sheet,
                        id: FieldDataItem.id_item.name,

                        fromMap: (data, id) async =>
                            await saveItem_Isar(fromMapItem(data, id)),
                      ),

                  ListDataHeaderExcel.Kategori.name: (sheet) async =>
                      restoreSheet<ModelCategory>(
                        sheet: sheet,
                        id: FieldDataCategory.id_category.name,

                        fromMap: (data, id) async =>
                            await saveCategory_Isar(fromMapCategory(data, id)),
                      ),

                  ListDataHeaderExcel.Pelanggan.name: (sheet) async =>
                      restoreSheet<ModelPartner>(
                        sheet: sheet,
                        id: FieldDataPartner.id_partner.name,

                        fromMap: (data, id) async =>
                            await saveCustomer_Isar(fromMapPartner(data, id)),
                      ),

                  ListDataHeaderExcel.Pemasok.name: (sheet) async =>
                      restoreSheet<ModelPartner>(
                        sheet: sheet,
                        id: FieldDataPartner.id_partner.name,

                        fromMap: (data, id) async =>
                            await saveSupplier_Isar(fromMapPartner(data, id)),
                      ),

                  ListDataHeaderExcel.Pendapatan.name: (sheet) async =>
                      restoreSheet<ModelFinancial>(
                        sheet: sheet,
                        id: FieldDataFinancial.id_financial.name,

                        fromMap: (data, id) async =>
                            await saveIncome_Isar(fromMapFinancial(data, id)),
                      ),

                  ListDataHeaderExcel.Pengeluaran.name: (sheet) async =>
                      restoreSheet<ModelFinancial>(
                        sheet: sheet,
                        id: FieldDataFinancial.id_financial.name,

                        fromMap: (data, id) async =>
                            await saveExpense_Isar(fromMapFinancial(data, id)),
                      ),

                  // ListDataHeaderExcel.Operator.name: (sheet) =>
                  //     restoreSheet<ModelUser>(
                  //       sheet: sheet,
                  //       id: FieldDataUser.id_user.name,
                  //
                  //       fromMap: (data, id) => fromMapUser(data, id),
                  //     ),
                  ListDataHeaderExcel.Riwayat_Penjualan.name.replaceAll(
                    " ",
                    "_",
                  ): (sheet) async => restoreSheet<ModelTransaction>(
                    sheet: sheet,
                    id: FieldDataTransaction.invoice.name,

                    fromMap: (data, id) async => await saveTransactionSell_Isar(
                      fromMapTransaction(
                        data,
                        itemsOrdered
                            .where((element) => element.getinvoice == id)
                            .toList(),
                        splitPayment,
                        id,
                      ),
                    ),
                  ),

                  ListDataHeaderExcel.Riwayat_Pembelian.name.replaceAll(
                    " ",
                    "_",
                  ): (sheet) async => restoreSheet<ModelTransaction>(
                    sheet: sheet,
                    id: FieldDataTransaction.invoice.name,

                    fromMap: (data, id) async => await saveTransactionBuy_Isar(
                      fromMapTransaction(
                        data,
                        itemsOrdered
                            .where((element) => element.getinvoice == id)
                            .toList(),
                        splitPayment,
                        id,
                      ),
                    ),
                  ),

                  ListDataHeaderExcel.Riwayat_Pendapatan.name.replaceAll(
                    " ",
                    "_",
                  ): (sheet) async => restoreSheet<ModelTransactionFinancial>(
                    sheet: sheet,
                    id: FieldDataTransFinancial.id_financial.name,

                    fromMap: (data, id) async =>
                        await saveTransactionFinancialncome_Isar(
                          fromMapTransFinancial(data, id),
                        ),
                  ),

                  ListDataHeaderExcel.Riwayat_Pengeluaran.name.replaceAll(
                    " ",
                    "_",
                  ): (sheet) async => restoreSheet<ModelTransactionFinancial>(
                    sheet: sheet,
                    id: FieldDataTransFinancial.id_financial.name,

                    fromMap: (data, id) async =>
                        await saveTransactionFinancialExpense_Isar(
                          fromMapTransFinancial(data, id),
                        ),
                  ),
                },
              ).restore();
            }
          },
        ),
      },
    ).restore();

    // if (isCorrect)  else {
    //   emit(currentState.copyWith(isCorrent: isCorrect));
    // }
  }

  FutureOr<void> _onSelectedBackup(
    SettingsSelectedBackup event,
    Emitter<SettingsState> emit,
  ) {
    final currentState = state as SettingsBackupRestoreLoaded;
    emit(currentState.copyWith(selectedFile: event.fileSelected));
  }

  FutureOr<void> _onShareBackup(
    SettingsShareBackup event,
    Emitter<SettingsState> emit,
  ) {
    final currentState = state as SettingsBackupRestoreLoaded;
    Share.shareXFiles([
      XFile(currentState.selectedFile!.path),
    ], text: 'Backup data item');
  }

  Future<void> _onReset(
    SettingsReset event,
    Emitter<SettingsState> emit,
  ) async {
    await deleteAllCommonDataIsar();
    final company = await getAllListBranchIsar();
    for (ModelBranch branch in company) {
      await saveCounter_Isar(
        ModelCounter(
          counterSell: 0,
          counterBuy: 0,
          counterIncome: 0,
          counterExpense: 0,
          idBranch: branch.getidBranch,
        ),
      );
    }
    // repoCache.notifyChanged();
  }
}
