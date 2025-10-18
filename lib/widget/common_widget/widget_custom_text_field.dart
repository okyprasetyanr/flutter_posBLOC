import 'package:flutter/material.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

Widget customTextField(
  String text,
  TextEditingController controller,
  bool enable,
) {
  return TextFormField(
    enabled: enable,
    controller: controller,
    style: lv05TextStyle,
    decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      label: Text(text, style: lv1TextStyle),
      hint: Text("$text...", style: lv05TextStyle),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
    ),
  );
}
