import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_event.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UiLogoHeaderFooter extends StatelessWidget {
  final TextEditingController headerController;
  final TextEditingController footerController;
  final ScrollController controller;
  UiLogoHeaderFooter({
    super.key,
    required this.headerController,
    required this.footerController,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text("Logo,Header & Footer", style: subTitleTextStyleBold),
            const SizedBox(height: 10),
            Image.asset("assets/logo.png", height: 150, width: 150),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 200,
                child: BlocListener<SettingsBloc, SettingsState>(
                  listener: (context, state) {
                    if (state is SettingsLogoHeaderFooterLoaded) {
                      headerController.text = state.header;
                      footerController.text = state.footer;
                    }
                  },
                  child: Column(
                    children: [
                      customTextField(
                        controller: headerController,
                        text: "Header",
                      ),
                      const SizedBox(height: 10),
                      customTextField(
                        controller: footerController,
                        text: "Footer",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            customButtonIcon(
              icon: const Icon(
                Icons.check_rounded,
                color: AppPropertyColor.white,
              ),
              label: Text("Simpan", style: lv05TextStyleWhite),
              backgroundColor: AppPropertyColor.primary,
              onPressed: () {
                context.read<SettingsBloc>().add(
                  SettingsLogoHeaderFooterUpdate(
                    footer: footerController.text,
                    header: headerController.text,
                  ),
                );

                footerController.clear();
                headerController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
