import 'package:flutter/material.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

Widget rowContent(String text, String value) {
  TextStyle textStyle = text == "Total" ? lv2textStyleHarga : lv1TextStyle;
  return Row(
    children: [
      SizedBox(width: 100, child: Text(text, style: textStyle)),
      Text(":", style: textStyle),
      const Spacer(),
      Text(value, style: textStyle),
    ],
  );
}
