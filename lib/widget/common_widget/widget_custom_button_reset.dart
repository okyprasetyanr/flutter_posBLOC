import 'package:flutter/material.dart';

Widget customButtonIconReset({VoidCallback? onPressed}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      minimumSize: const Size(0, 30),
      backgroundColor: Colors.white,
    ),
    icon: const Icon(Icons.restart_alt_rounded, size: 20),
    label: Text("Bersihkan"),
  );
}
