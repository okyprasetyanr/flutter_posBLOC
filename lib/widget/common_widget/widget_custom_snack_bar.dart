import 'package:flutter/material.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

void customSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text, style: lv05TextStyleWhite),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColor.primary,
    ),
  );
}
