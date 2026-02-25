import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_menu.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_event.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/ui_backup_restore_reset.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/ui_logo_header_footer.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/ui_profil.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/ui_feature.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/ui_sync_data.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/common_widget/widget_custom_bottom_sheet.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/ui_print.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition_text/transition_navigator/transition_up_down.dart';

class UISettings extends StatefulWidget {
  const UISettings({super.key});

  @override
  State<UISettings> createState() => _UISettingsState();
}

class _UISettingsState extends State<UISettings> {
  final footerController = TextEditingController();
  final headerController = TextEditingController();
  final nameBackupController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    footerController.dispose();
    headerController.dispose();
    nameBackupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPropertyColor.white,
        toolbarHeight: 44,
        leadingWidth: 250,
        leading: Row(
          children: [
            IconButton(
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
              ),
              icon: const Icon(Icons.arrow_back_ios_new, size: 25),
              constraints: const BoxConstraints(),
              onPressed: () => Navigator.pop(context),
            ),
            customTextBorder("Pengaturan", titleTextStyleWhite),
          ],
        ),
      ),
      backgroundColor: AppPropertyColor.white,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    WidgetCustomTextMenu(
                      icon: Icon(
                        Icons.person_search_rounded,
                        color: AppPropertyColor.white,
                      ),
                      text2: "Cek perijinan Pengguna & informasi Pengguna",
                      text1: "Profil",
                      onTap: () async {
                        context.read<SettingsBloc>().add(SettingsProfile());
                        customBottomSheet(
                          context: context,
                          resetItemForm: null,
                          content: (scrollController) {
                            return UIProfile(controller: scrollController);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    WidgetCustomTextMenu(
                      icon: Icon(
                        Icons.menu_rounded,
                        color: AppPropertyColor.white,
                      ),
                      text2: "Mengontrol fitur Ringkas POS",
                      text1: "Fitur",
                      onTap: () async {
                        context.read<SettingsBloc>().add(SettingsFeature());
                        customBottomSheet(
                          context: context,
                          resetItemForm: null,
                          content: (scrollController) {
                            return UiFeature(controller: scrollController);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    WidgetCustomTextMenu(
                      icon: Icon(
                        Icons.sync_rounded,
                        color: AppPropertyColor.white,
                      ),
                      text2: "Komunikasi Data lokal dan server",
                      text1: "Sinkron Data",
                      onTap: () async {
                        context.read<SettingsBloc>().add(SettingsSyncData());
                        customBottomSheet(
                          context: context,
                          resetItemForm: null,
                          content: (scrollController) {
                            return UiSyncData(controller: scrollController);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    WidgetCustomTextMenu(
                      icon: Icon(
                        Icons.local_printshop_rounded,
                        color: AppPropertyColor.white,
                      ),
                      text2: "Mengatur Printer & ubah ukuran kertas",
                      text1: "Printer",
                      onTap: () async {
                        customBottomSheet(
                          context: context,
                          resetItemForm: null,
                          content: (scrollController) {
                            return UIPrint(scrollController: scrollController);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    WidgetCustomTextMenu(
                      icon: Icon(
                        Icons.photo_filter_rounded,
                        color: AppPropertyColor.white,
                      ),
                      text2: "Ubah Logo, sambutan dan penutup",
                      text1: "Branding",
                      onTap: () async {
                        context.read<SettingsBloc>().add(
                          SettingsLogoHeaderFooterInit(),
                        );
                        customBottomSheet(
                          context: context,
                          resetItemForm: null,
                          content: (scrollController) {
                            return UiLogoHeaderFooter(
                              headerController: headerController,
                              footerController: footerController,
                              controller: scrollController,
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    WidgetCustomTextMenu(
                      icon: Icon(
                        Icons.archive_rounded,
                        color: AppPropertyColor.white,
                      ),
                      text2: "Ubah ke Excel atau hapus Data",
                      text1: "Manajemen Data",
                      onTap: () async {
                        final nameOperator = context
                            .read<DataUserRepositoryCache>()
                            .dataAccount!
                            .getNameUser;
                        nameBackupController.text =
                            '${nameOperator.length < 5 ? nameOperator : nameOperator.substring(0, 5)}_${formatDate(date: DateTime.now(), minute: true)}';

                        context.read<SettingsBloc>().add(
                          SettingsBackupRestoreinit(),
                        );

                        customBottomSheet(
                          context: context,
                          resetItemForm: null,
                          content: (scrollController) {
                            return UiBackupRestore(
                              controller: scrollController,
                              nameBackupController: nameBackupController,
                              formKey: _formKey,
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: WidgetCustomTextMenu(
                        icon: Icon(
                          Icons.info_outline,
                          color: AppPropertyColor.white,
                        ),
                        text2: "Informasi tentang Ringkas POS",
                        text1: "Tentang App",
                        onTap: () async {},
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: customButtonIcon(
                    backgroundColor: AppPropertyColor.primary,
                    icon: const Icon(
                      Icons.logout_rounded,
                      color: AppPropertyColor.white,
                    ),
                    label: Text("Keluar", style: lv05TextStyleWhite),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      navUpDownTransition(context, '/login', true);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
