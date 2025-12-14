import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter_pos/function/function.dart';

class SettingsEvent {}

class SettingsProfile extends SettingsEvent {}

class SettingsFeature extends SettingsEvent {}

class SettingsFeatureFIFO extends SettingsEvent {}

class SettingsSyncData extends SettingsEvent {}

class SettingsSelectedSyncData extends SettingsEvent {
  final Map<SyncData, bool> selectedData;

  SettingsSelectedSyncData({required this.selectedData});
}

class SettingPushData extends SettingsEvent {}

class SettingGetData extends SettingsEvent {}

class SettingCancelSync extends SettingsEvent {}

class SettingsPrinterInit extends SettingsEvent {}

class SettingsStartScanEvent extends SettingsEvent {}

class SettingsSelectPrinterEvent extends SettingsEvent {
  final BluetoothDevice device;
  SettingsSelectPrinterEvent(this.device);
}

class SettingsPrintTestEvent extends SettingsEvent {}

class SettingsDisconnectPrinterEvent extends SettingsEvent {}

class SettingsPrinterAutoConnect extends SettingsEvent {}
