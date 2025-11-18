import 'package:flutter/material.dart';

Widget customButtonIconReset({VoidCallback? onPressed, Widget? label}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    style: ButtonStyle(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      ),
      minimumSize: const WidgetStatePropertyAll(Size(0, 30)),
      backgroundColor: WidgetStatePropertyAll(Colors.white),
    ),
    icon: const Icon(Icons.restart_alt_rounded, size: 20),
    label: label!,
  );
}
