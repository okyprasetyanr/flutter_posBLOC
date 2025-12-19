import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/colors.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

void customSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text, style: lv05TextStyleWhite),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppPropertyColor.primary,
    ),
  );
}
