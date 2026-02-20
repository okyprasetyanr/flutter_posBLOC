import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pos/enum/enum.dart';

class SettingsEvent {}

class SettingsProfile extends SettingsEvent {}

class SettingsFeature extends SettingsEvent {}

class SettingsFeatureFIFO extends SettingsEvent {}

class SettingsSyncData extends SettingsEvent {}

class SettingsSelectedSyncData extends SettingsEvent {
  final Map<ListForDatabase, bool> selectedData;

  SettingsSelectedSyncData({required this.selectedData});
}

class SettingsChangePaper extends SettingsEvent {
  final PaperWidth paper;
  SettingsChangePaper(this.paper);
}

class SettingPushData extends SettingsEvent {}

class SettingGetData extends SettingsEvent {}

class SettingCancelSync extends SettingsEvent {}

class SettingsLogoHeaderFooterInit extends SettingsEvent {}

class SettingsLogoHeaderFooterUpdate extends SettingsEvent {
  final String header;
  final String footer;

  SettingsLogoHeaderFooterUpdate({required this.header, required this.footer});
}

class SettingsBackupRestoreinit extends SettingsEvent {}

class SettingsBackup extends SettingsEvent {
  BuildContext context;
  String name;
  SettingsBackup({required this.context, required this.name});
}

class SettingsReset extends SettingsEvent {}

class SettingsRestore extends SettingsEvent {}

class SettingsShareBackup extends SettingsEvent {}

class SettingsSelectedBackup extends SettingsEvent {
  final FileSystemEntity fileSelected;

  SettingsSelectedBackup({required this.fileSelected});
}
