import 'package:flutter/material.dart';

Widget customButtonIcon({
  VoidCallback? function,
  Widget? label,
  Color? backgroundColor,
  IconData? icon,
}) {
  return ElevatedButton.icon(
    onPressed: function,
    label: label!,
    icon: Icon(icon),
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(backgroundColor),
      minimumSize: WidgetStatePropertyAll(Size(0, 0)),
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
      ),
    ),
  );
}
