import 'package:flutter/material.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

Widget rowContent(
  String text,
  String value, {
  double? width,
  bool forTotal = false,
}) {
  TextStyle textStyle = forTotal ? lv2textStylePrice : lv05TextStyle;
  return Padding(
    padding: EdgeInsets.only(bottom: 5),
    child: Row(
      children: [
        SizedBox(
          width: width ?? 120,
          child: Text(text, style: textStyle, overflow: TextOverflow.ellipsis),
        ),
        Text(":", style: textStyle),
        const Spacer(),
        Text(value, style: textStyle),
      ],
    ),
  );
}
