import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_list_gradient.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_state.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class UiBackupRestore extends StatelessWidget {
  final ScrollController controller;
  const UiBackupRestore({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          controller: controller,
          children: [
            customButtonIcon(
              backgroundColor: AppColor.primary,
              icon: Icon(Icons.backup_rounded, color: Colors.white),
              label: Text("Cadangkan", style: lv05TextStyleWhite),
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            Container(height: 1, width: double.infinity, color: Colors.grey),
            Text("Pulihkan", style: titleTextStyle),
            const SizedBox(height: 10),
            BlocSelector<SettingsBloc, SettingsState, List<FileSystemEntity>>(
              selector: (state) {
                if (state is SettingsBackupRestoreLoaded) {
                  return state.listFile;
                }
                return [];
              },
              builder: (context, state) {
                return customListGradient(
                  data: state,
                  getName: (data) => data.path.split('/').last,
                  selectedData: (selectedData) {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
