import 'package:flutter/material.dart';

import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition/transition_navigator/transition_up_down.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';

class LayoutTopBottomMainMenu extends StatelessWidget {
  final Widget widgetTop;
  final Widget widgetBottom;
  final ValueNotifier<String?>? nameCompany;
  final Function(int) pageview;
  const LayoutTopBottomMainMenu({
    Key? key,
    required this.widgetTop,
    required this.widgetBottom,
    required this.nameCompany,
    required this.pageview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedMenu = ValueNotifier<String>("Main");
    double height = MediaQuery.of(context).size.height;
    double paddingtStatusBar, paddingBottomMain;
    Orientation rotation = MediaQuery.of(context).orientation;
    if (rotation == Orientation.portrait) {
      paddingtStatusBar = height * 0.04;
      paddingBottomMain = 10;
    } else {
      paddingtStatusBar = height * 0.1;
      paddingBottomMain = 5;
    }
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: paddingtStatusBar,
            left: 10,
            right: 10,
            bottom: paddingBottomMain,
          ),
          decoration: BoxDecoration(color: AppColor.primary),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  if (rotation == Orientation.portrait)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: content(context),
                    ),
                  if (rotation == Orientation.landscape)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: content(context),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  listTileText(
                    () {
                      pageview(0);
                      selectedMenu.value = "Main";
                    },
                    Icons.dashboard_customize_sharp,
                    "Main",
                    selectedMenu,
                  ),
                  listTileText(
                    () {
                      pageview(1);
                      selectedMenu.value = "Data";
                    },
                    Icons.table_chart_rounded,
                    "Data",
                    selectedMenu,
                  ),
                  listTileText(
                    () {
                      pageview(2);
                      selectedMenu.value = "Riwayat";
                    },
                    Icons.work_history_rounded,
                    "Riwayat",
                    selectedMenu,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return Column(
                  children: [
                    Flexible(fit: FlexFit.loose, child: widgetTop),
                    const SizedBox(height: 10),
                    Flexible(fit: FlexFit.loose, child: widgetBottom),
                  ],
                );
              } else {
                return Row(
                  children: [
                    Expanded(child: widgetTop),
                    const SizedBox(width: 10),
                    Expanded(child: widgetBottom),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }

  List<Widget> content(BuildContext context) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/logo.png", width: 50, height: 50),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pesan Kenyang!", style: labelTextStyle),
              ValueListenableBuilder<String?>(
                valueListenable: nameCompany!,
                builder: (context, value, child) => Text(
                  "Welcome ${value ?? "Mohon Tunggu"}, jualan lagi kita!",
                  style: lv1TextStyle,
                ),
              ),
            ],
          ),
          customButtonIcon(
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.settings_rounded, color: Colors.white),
            onPressed: () {
              navUpDownTransition(context, '/settings', false);
            },
          ),
        ],
      ),
    ];
  }

  Widget listTileText(
    VoidCallback onTap,
    IconData leading,
    String text,
    ValueNotifier selectedMenu,
  ) {
    return Flexible(
      fit: FlexFit.loose,
      child: ListTile(
        onTap: onTap,
        title: ValueListenableBuilder(
          valueListenable: selectedMenu,
          builder: (context, value, child) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: text == value
                    ? Colors.white.withValues(alpha: 0.5)
                    : Colors.transparent,
              ),
              child: Column(
                children: [
                  Icon(
                    leading,
                    color: text == value ? Colors.black : Colors.white,
                  ),
                  Text(
                    text,
                    style: text == value ? lv05TextStyle : lv05TextStyleWhite,
                    maxLines: 1,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
