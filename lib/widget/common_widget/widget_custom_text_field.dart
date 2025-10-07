import 'package:flutter/material.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

Widget customTextField(String text, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    style: lv05TextStyle,
    decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      label: Text(text, style: lv1TextStyle),
      hint: Text("$text...", style: lv05TextStyle),
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
