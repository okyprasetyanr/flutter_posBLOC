import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_menu.dart';
import 'package:flutter_pos/function/bottom_sheet.dart';
import 'package:flutter_pos/print/presentation/ui_print.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition/transition_navigator/transition_up_down.dart';

class UISettings extends StatefulWidget {
  const UISettings({super.key});

  @override
  State<UISettings> createState() => _UISettingsState();
}

class _UISettingsState extends State<UISettings> {
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
              WidgetCustomTextMenu(text: "Profil", onTap: () async {}),
              const SizedBox(height: 10),
              WidgetCustomTextMenu(text: "Fitur", onTap: () async {}),
              const SizedBox(height: 10),
              WidgetCustomTextMenu(text: "Sinkron Data", onTap: () async {}),
              const SizedBox(height: 10),
              WidgetCustomTextMenu(
                text: "Printer",
                onTap: () async {
                  customBottomSheet(
                    context: context,
                    resetItemForm: null,
                    content: (scrollController) => UIPrint(),
                  );
                },
              ),
              const SizedBox(height: 10),
              WidgetCustomTextMenu(
                text: "Logo/Header/Footer",
                onTap: () async {},
              ),
              const SizedBox(height: 10),
              WidgetCustomTextMenu(
                text: "Cadangkan/Pulihkan",
                onTap: () async {},
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
                    backgroundColor: AppColor.primary,
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
