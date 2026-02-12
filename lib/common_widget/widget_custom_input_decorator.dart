import 'package:flutter/material.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

Widget customInputDecorator({required String text, required String value}) {
  return InputDecorator(
    decoration: InputDecoration(
      isDense: true,
      labelText: text,
      labelStyle: lv1TextStyle,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      contentPadding: const EdgeInsets.symmetric(vertical: 9, horizontal: 5),
    ),
    child: Text(value, style: lv1TextStyle),
  );
}
