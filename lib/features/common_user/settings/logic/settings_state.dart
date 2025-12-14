import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_company.dart';
import 'package:flutter_pos/model_data/model_user.dart';

class SettingsState {}

class SettingsInital extends SettingsState {}

class SettingsFeatureLoaded extends SettingsState {
  final bool isFifo;

  SettingsFeatureLoaded({this.isFifo = false});

  SettingsFeatureLoaded copyWith({bool? isFifo}) {
    return SettingsFeatureLoaded(isFifo: isFifo ?? this.isFifo);
  }
}

class SettingsProfileLoaded extends SettingsState with EquatableMixin {
  final ModelUser? dataAccount;
  final ModelCompany? dataCompany;

  SettingsProfileLoaded({this.dataAccount, this.dataCompany});

  SettingsProfileLoaded copyWith({
    ModelUser? dataAccount,
    ModelCompany? dataCompany,
  }) {
    return SettingsProfileLoaded(
      dataAccount: dataAccount ?? this.dataAccount,
      dataCompany: dataCompany ?? this.dataCompany,
    );
  }

  @override
  List<Object?> get props => [dataAccount, dataCompany];
}

class SettingsSyncDataLoaded extends SettingsState with EquatableMixin {
  final Map<SyncData, bool> dataSyncData;
  final double progress;
  final String currentStep;
  final bool isSyncing;
  final bool isCancelled;

  SettingsSyncDataLoaded({
    required this.dataSyncData,
    this.progress = 0,
    this.currentStep = '',
    this.isSyncing = false,
    this.isCancelled = false,
  });

  SettingsSyncDataLoaded copyWith({
    Map<SyncData, bool>? dataSyncData,
    double? progress,
    String? currentStep,
    bool? isSyncing,
    bool? isCancelled,
  }) {
    return SettingsSyncDataLoaded(
      dataSyncData: dataSyncData ?? this.dataSyncData,
      progress: progress ?? this.progress,
      currentStep: currentStep ?? this.currentStep,
      isSyncing: isSyncing ?? this.isSyncing,
      isCancelled: isCancelled ?? this.isCancelled,
    );
  }

  @override
  List<Object?> get props => [
    dataSyncData,
    progress,
    currentStep,
    isSyncing,
    isCancelled,
  ];
}

class SettingsPrinterInitial extends SettingsState {}

class SettingsPrinterScanning extends SettingsState {}

class SettingsPrinterScanResult extends SettingsState {
  final List<BluetoothDevice> devices;
  SettingsPrinterScanResult(this.devices);
}

class SettingsPrinterConnecting extends SettingsState {}

class SettingsPrinterConnected extends SettingsState {
  final BluetoothDevice device;
  SettingsPrinterConnected(this.device);
}

class PrinterDisconnected extends SettingsState {}

class SettingsPrinterPrinting extends SettingsState {}
