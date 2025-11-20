import 'package:flutter/material.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

Widget customButtonIconReset({VoidCallback? onPressed}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      iconColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      minimumSize: const Size(0, 30),
      backgroundColor: AppColor.primary,
    ),
    icon: const Icon(Icons.restart_alt_rounded, size: 20),
    label: Text("Bersihkan", style: lv1TextStyleWhite),
  );
}
