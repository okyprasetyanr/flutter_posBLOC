import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_list_gradient.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_event.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_state.dart';
import 'package:flutter_pos/function/bottom_sheet.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

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
              backgroundColor: AppColor.primary,
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
                            SettingsSelectedBackup(),
                          );
                          context.select<SettingsBloc, Future<dynamic>>((
                            state,
                          ) {
                            if (state is SettingsBackupRestoreLoaded) {
                              if ((state as SettingsBackupRestoreLoaded)
                                      .selectedFile !=
                                  null) {
                                return showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (_) {
                                    return Center(
                                      child: customSpinKit(
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    );
                                  },
                                );
                              }
                            }
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
