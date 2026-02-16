import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

Widget WidgetCustomTextMenu({
  required String text,
  required GestureTapCallback onTap,
}) {
  return Material(
    child: InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          border: const Border(
            bottom: const BorderSide(color: AppPropertyColor.grey, width: 1),
          ),
        ),
        child: Text(text, style: lv05TextStyle),
      ),
    ),
  );
}
