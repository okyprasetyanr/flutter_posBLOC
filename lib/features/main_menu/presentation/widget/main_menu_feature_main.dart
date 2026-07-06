// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/features/main_menu/logic/main_menu_bloc.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/shared/style_and_transition_text/transition_navigator/transition_up_down.dart';

class MainMenuFeatureMain extends StatelessWidget {
  final ValueNotifier<String> selectedMenu;
  final PageController currentPage;
  const MainMenuFeatureMain({
    Key? key,
    required this.selectedMenu,
    required this.currentPage,
  }) : super(key: key);
  _pageView(int page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (currentPage.hasClients) {
        currentPage.animateToPage(
          page,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        listTileText(
          () {
            _pageView(0);
            selectedMenu.value = "Dashboard";
          },
          Icons.dashboard_customize_sharp,
          "Dashboard",
          selectedMenu,
        ),
        listTileText(
          () {
            _pageView(1);
            selectedMenu.value = "Data";
          },
          Icons.table_chart_rounded,
          "Data",
          selectedMenu,
        ),
        listTileText(
          () {
            _pageView(2);
            selectedMenu.value = "Riwayat";
          },
          Icons.work_history_rounded,
          "Riwayat",
          selectedMenu,
        ),
        listTileText(
          () {
            navUpDownTransition(
              context,
              '/settings',
              false,
              arguments: context.read<DataReportBloc>(),
            );
          },
          Icons.settings,
          "Pengaturan",
          selectedMenu,
        ),
      ],
    );
  }

  Widget listTileText(
    VoidCallback onTap,
    IconData leading,
    String text,
    ValueNotifier selectedMenu,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ValueListenableBuilder(
        valueListenable: selectedMenu,
        builder: (context, value, child) {
          return customButton(
            backgroundColor: text == value
                ? AppPropertyColor.primary
                : AppPropertyColor.white,
            child: Column(
              children: [
                Icon(
                  leading,
                  color: text != value
                      ? AppPropertyColor.black
                      : AppPropertyColor.white,
                ),
                Text(
                  text,
                  style: text != value ? lv05TextStyle : lv05TextStyleWhite,
                  maxLines: 1,
                ),
              ],
            ),
            onPressed: onTap,
          );
        },
      ),
    );
  }
}
