import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/colors.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_list_gradient.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_event.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UiBackupRestore extends StatelessWidget {
  final ScrollController controller;
  const UiBackupRestore({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            customButtonIcon(
              backgroundColor: AppPropertyColor.primary,
              icon: Icon(Icons.backup_rounded, color: Colors.white),
              label: Text("Cadangkan", style: lv05TextStyleWhite),
              onPressed: () {
                context.read<SettingsBloc>().add(SettingsBackup());
              },
            ),
            const SizedBox(height: 10),
            Container(height: 1, width: double.infinity, color: Colors.grey),
            Text("Pulihkan", style: titleTextStyle),
            const SizedBox(height: 10),
            Expanded(
              child:
                  BlocSelector<
                    SettingsBloc,
                    SettingsState,
                    List<FileSystemEntity>
                  >(
                    selector: (state) {
                      if (state is SettingsBackupRestoreLoaded) {
                        return state.listFile;
                      }
                      return [];
                    },
                    builder: (context, state) {
                      return customListGradient(
                        controller: controller,
                        data: state,
                        getName: (data) => data.path.split('/').last,
                        selectedData: (selectedData) {
                          context.read<SettingsBloc>().add(
                            SettingsSelectedBackup(fileSelected: selectedData),
                          );
                          context.select<SettingsBloc, Future<dynamic>?>((
                            state,
                          ) {
                            if (state is SettingsBackupRestoreLoaded) {
                              if ((state as SettingsBackupRestoreLoaded)
                                      .selectedFile !=
                                  null) {
                                return showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      "Pilih Opsi",
                                      style: lv2TextStyle,
                                    ),
                                    content: Text(
                                      "Silahkan pilih Opsi Berbagi/Pulihkan",
                                      style: lv1TextStyle,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: Text(
                                          "Batal",
                                          style: lv1TextStyle,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () => context
                                            .read<SettingsBloc>()
                                            .add(SettingsShareBackup()),
                                        child: Text(
                                          "Bagikan",
                                          style: lv1TextStyle,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () => context
                                            .read<SettingsBloc>()
                                            .add(SettingsImport()),
                                        child: Text(
                                          "Pulihkan",
                                          style: lv1TextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              ;
                            }
                            return null;
                          });
                        },
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
