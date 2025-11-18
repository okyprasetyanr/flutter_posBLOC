import 'package:flutter/material.dart';

Widget customButton({
  VoidCallback? onPressed,
  Color? backgroundColor,
  Icon? child,
}) {
  return Padding(
    padding: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 0),
    child: ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        minimumSize: WidgetStatePropertyAll(Size(0, 0)),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
