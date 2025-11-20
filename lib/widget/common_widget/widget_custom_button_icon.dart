import 'package:flutter/material.dart';

Widget customButtonIcon({
  VoidCallback? onPressed,
  Widget? label,
  Color? backgroundColor,
  Icon? icon,
}) {
  return Padding(
    padding: EdgeInsets.only(left: 5, right: 0, bottom: 5, top: 0),
    child: ElevatedButton.icon(
      onPressed: onPressed,
      label: label ?? const SizedBox.shrink(),
      icon: icon,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        minimumSize: WidgetStatePropertyAll(Size(0, 0)),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
        ),
      ),
    ),
  );
}
