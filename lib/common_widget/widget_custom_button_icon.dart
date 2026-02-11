import 'package:flutter/material.dart';

Widget customButtonIcon({
  VoidCallback? onPressed,
  Widget? label,
  Color? backgroundColor,
  Icon? icon,
  bool left = false,
}) {
  return Padding(
    padding: EdgeInsets.only(left: 5, right: 0, bottom: 5, top: 0),
    child: ElevatedButton.icon(
      onPressed: onPressed,
      label: label ?? const SizedBox.shrink(),
      icon: icon,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(0, 0),
        alignment: left ? Alignment.centerLeft : Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}
