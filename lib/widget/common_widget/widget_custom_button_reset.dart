import 'package:flutter/material.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/style_and_transition/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

Widget customButtonIconReset({VoidCallback? onPressed}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      iconColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      minimumSize: const Size(0, 30),
      backgroundColor: AppColor.primary,
    ),
    icon: Icon(Icons.restart_alt_rounded, size: lv2IconSize),
    label: Text("Bersihkan", style: lv1TextStyleWhite),
  );
}
