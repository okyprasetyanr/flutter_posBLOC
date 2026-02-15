import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';

Widget customButtonIcon({
  VoidCallback? onPressed,
  Widget? label,
  Color? backgroundColor,
  Icon? icon,
  bool left = false,
  bool rightIcon = false,
  bool padding = true,
}) {
  return Padding(
    padding: padding
        ? const EdgeInsets.only(left: 5, right: 0, bottom: 5, top: 0)
        : const EdgeInsets.only(),
    child: ElevatedButton.icon(
      onPressed: onPressed,
      label: label ?? const SizedBox.shrink(),
      icon: icon,
      iconAlignment: rightIcon ? IconAlignment.end : IconAlignment.start,
      style: ElevatedButton.styleFrom(
        visualDensity: VisualDensity.compact,
        backgroundColor: backgroundColor,
        minimumSize: const Size(0, 0),
        alignment: left ? Alignment.centerLeft : Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
        shape: AppPropertyBorderRadius.rounded10,
      ),
    ),
  );
}
