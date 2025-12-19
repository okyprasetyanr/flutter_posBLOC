import 'package:flutter/material.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

Widget rowContent(String text, String value) {
  TextStyle textStyle = text == "Total" ? lv2textStylePrice : lv05TextStyle;
  return Row(
    children: [
      SizedBox(
        width: 120,
        child: Text(
          text,
          style: lv05TextStyle,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Text(":", style: textStyle),
      const Spacer(),
      Text(value, style: textStyle),
    ],
  );
}
