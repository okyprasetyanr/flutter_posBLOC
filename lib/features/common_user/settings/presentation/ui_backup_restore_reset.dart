import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_list_gradient.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_event.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UiBackupRestore extends StatelessWidget {
  final ScrollController controller;
  final TextEditingController nameBackupController;
  final GlobalKey<FormState> formKey;
  const UiBackupRestore({
    super.key,
    required this.controller,
    required this.nameBackupController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPropertyColor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: customTextBorder("Manajemen Data", lv2TextStyleWhite),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Cadangkan", style: subTitleTextStyleBold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Form(
                    key: formKey,
                    child: customTextField(
                      text: "Nama",
                      controller: nameBackupController,
                      validator: (value) => value!.isEmpty
                          ? "Nama diperlukan untuk Pencadangan"
                          : null,
                      inputType: TextInputType.text,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: customButtonIcon(
                    backgroundColor: AppPropertyColor.primary,
                    icon: const Icon(
                      Icons.backup_rounded,
                      color: AppPropertyColor.white,
                    ),
                    label: Text("Cadangkan", style: lv05TextStyleWhite),
                    onPressed: () {
                      final bloc =
                          context.read<SettingsBloc>().state
                              as SettingsBackupRestoreLoaded;
                      if (formKey.currentState!.validate()) {
                        final listFile = bloc.listFile;
                        final inputName = nameBackupController.text.trim();
                        if (listFile.contains("$inputName.xlsx")) {
                          customSnackBar(context, "Nama sudah digunakan!");
                        } else {
                          context.read<SettingsBloc>().add(
                            SettingsBackup(name: inputName, context: context),
                          );
                        }
                      } else {
                        return;
                      }
                      if (bloc.isCorrect) {
                        customSnackBar(
                          context,
                          "File ini diCadangkan oleh Akun yang bukan anda! Pilih Pencadangan anda!",
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            Text(
              "Disarankan tidak mengubah nama File ketika sudah ditahap memilih Folder!",
              style: lv05TextStyleItalic,
            ),
            const SizedBox(height: 10),
            Container(
              height: 1,
              width: double.infinity,
              color: AppPropertyColor.grey,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text("Reset Data", style: subTitleTextStyleBold),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: customButtonIcon(
                    backgroundColor: AppPropertyColor.white,
                    icon: const Icon(
                      Icons.folder_delete_rounded,
                      color: AppPropertyColor.deleteOrClose,
                    ),
                    label: Text("Reset", style: lv05TextStyleRed),
                    onPressed: () {
                      showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            "Konfirmasi Reset Data",
                            style: lv2TextStyle,
                          ),
                          content: Text(
                            "Anda yakin ingin melakukan Reset Data?",
                            style: lv1TextStyle,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text("Batal", style: lv1TextStyle),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<SettingsBloc>().add(
                                  SettingsReset(),
                                );
                                Navigator.pop(context, true);
                              },
                              child: Text("Reset", style: lv1TextStyle),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Container(
              height: 1,
              width: double.infinity,
              color: AppPropertyColor.grey,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text("Pemulihan", style: subTitleTextStyleBold),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: customButtonIcon(
                    backgroundColor: AppPropertyColor.primary,
                    icon: const Icon(
                      Icons.file_copy_rounded,
                      color: AppPropertyColor.white,
                    ),
                    label: Text("Pulihkan File", style: lv05TextStyleWhite),
                    onPressed: () {},
                  ),
                ),
              ],
            ),

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

                          showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Pilih Opsi", style: lv2TextStyle),
                              content: Text(
                                "Silahkan pilih Opsi Berbagi/Pulihkan",
                                style: lv1TextStyle,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: Text("Batal", style: lv1TextStyle),
                                ),
                                TextButton(
                                  onPressed: () => context
                                      .read<SettingsBloc>()
                                      .add(SettingsShareBackup()),
                                  child: Text("Bagikan", style: lv1TextStyle),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.read<SettingsBloc>().add(
                                      SettingsRestore(),
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: Text("Pulihkan", style: lv1TextStyle),
                                ),
                              ],
                            ),
                          );
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
