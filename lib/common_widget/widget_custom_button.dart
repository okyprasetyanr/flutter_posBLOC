import 'package:flutter/material.dart';

Widget customButton({
  VoidCallback? onPressed,
  Color? backgroundColor,
  Widget? child,
  bool moreRadius = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        visualDensity: const VisualDensity(horizontal: -2.0, vertical: -2.0),
        elevation: const WidgetStatePropertyAll(4),
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        minimumSize: const WidgetStatePropertyAll(Size(0, 0)),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(moreRadius ? 15 : 10),
          ),
        ),
      ),
    ),
  );
}
