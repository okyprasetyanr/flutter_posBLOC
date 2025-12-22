import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_menu.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_event.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/ui_backup_restore_reset.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/ui_logo_header_footer.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/ui_profil.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/ui_feature.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/ui_sync_data.dart';
import 'package:flutter_pos/function/bottom_sheet.dart';
import 'package:flutter_pos/features/common_user/settings/presentation/ui_print.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition_text/transition_navigator/transition_up_down.dart';

class UISettings extends StatefulWidget {
  const UISettings({super.key});

  @override
  State<UISettings> createState() => _UISettingsState();
}

class _UISettingsState extends State<UISettings> {
  final headerController = TextEditingController();
  final footerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetCustomTextMenu(
                text: "Profil",
                onTap: () async {
                  customBottomSheet(
                    context: context,
                    resetItemForm: null,
                    content: (scrollController) {
                      context.read<SettingsBloc>().add(SettingsProfile());
                      return UIProfile(controller: scrollController);
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              WidgetCustomTextMenu(
                text: "Fitur",
                onTap: () async {
                  customBottomSheet(
                    context: context,
                    resetItemForm: null,
                    content: (scrollController) {
                      context.read<SettingsBloc>().add(SettingsFeature());
                      return UiFeature(controller: scrollController);
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              WidgetCustomTextMenu(
                text: "Sinkron Data",
                onTap: () async {
                  customBottomSheet(
                    context: context,
                    resetItemForm: null,
                    content: (scrollController) {
                      context.read<SettingsBloc>().add(SettingsSyncData());
                      return UiSyncData(controller: scrollController);
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              WidgetCustomTextMenu(
                text: "Printer",
                onTap: () async {
                  customBottomSheet(
                    context: context,
                    resetItemForm: null,
                    content: (scrollController) {
                      context.read<SettingsBloc>().add(SettingsPrinterInit());
                      return UIPrint();
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              WidgetCustomTextMenu(
                text: "Logo/Header/Footer",
                onTap: () async {
                  customBottomSheet(
                    context: context,
                    resetItemForm: null,
                    content: (scrollController) {
                      context.read<SettingsBloc>().add(
                        SettingsLogoHeaderFooterInit(),
                      );
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
                text: "Cadangkan/Pulihkan/Reset",
                onTap: () async {
                  customBottomSheet(
                    context: context,
                    resetItemForm: null,
                    content: (scrollController) {
                      context.read<SettingsBloc>().add(
                        SettingsBackupRestoreinit(),
                      );
                      return UiBackupRestore(controller: scrollController);
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              WidgetCustomTextMenu(text: "Tentang App", onTap: () async {}),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: customButtonIcon(
                    backgroundColor: AppPropertyColor.primary,
                    icon: Icon(Icons.logout_rounded, color: Colors.white),
                    label: Text("Logout", style: lv05TextStyleWhite),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      await Future.delayed(const Duration(milliseconds: 300));
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
