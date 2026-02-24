import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

Widget WidgetCustomTextMenu({
  required String text1,
  required String text2,
  required GestureTapCallback onTap,
  required Icon icon,
}) {
  return Material(
    color: AppPropertyColor.white,
    child: InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          border: const Border(
            bottom: const BorderSide(
              color: AppPropertyColor.greyLight,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppPropertyColor.primary,
              ),
              child: icon,
            ),
            const SizedBox(width: 10),
            Text(text1, style: lv1TextStyleBold),
            Expanded(
              child: Text(
                text2,
                style: lv05TextStyleItalic,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
