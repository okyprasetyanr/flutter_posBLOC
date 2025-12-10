import 'package:flutter/material.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

Widget WidgetCustomTextMenu({
  required String text,
  required GestureTapCallback onTap,
}) {
  return Material(
    child: InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
        ),
        child: Text(text, style: lv05TextStyle),
      ),
    ),
  );
}
