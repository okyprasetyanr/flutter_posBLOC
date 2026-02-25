import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

Widget customButtonIconReset({VoidCallback? onPressed, Color? color}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      iconColor: AppPropertyColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      minimumSize: const Size(0, 30),
      backgroundColor: color == null ? AppPropertyColor.primary : color,
    ),
    icon: const Icon(Icons.restart_alt_rounded, size: lv2IconSize),
    label: Text("Bersihkan", style: lv1TextStyleWhite),
  );
}
