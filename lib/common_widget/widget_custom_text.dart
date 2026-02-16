import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

Widget CustomText({required String text}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: BoxBorder.all(
        width: 1,
        color: AppPropertyColor.grey,
        style: BorderStyle.solid,
      ),
    ),
    child: Text(text, style: lv05TextStyle),
  );
}
