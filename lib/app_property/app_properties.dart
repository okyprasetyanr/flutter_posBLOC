import 'dart:ui';

import 'package:flutter/material.dart';

class AppPropertyColor {
  static const Color primary = Color.fromARGB(249, 110, 161, 111);
  static const Color primarylight1 = Color.fromARGB(248, 208, 255, 208);
  static const Color primarylight2 = Color.fromARGB(248, 173, 255, 173);
  static const Color primarylight3 = Color.fromARGB(248, 227, 255, 227);
  static const Color primarymorelight = Color.fromARGB(248, 243, 255, 243);
  static const Color deleteOrClose = Color.fromARGB(248, 245, 51, 51);
  static const Color condiment = const Color.fromARGB(255, 255, 154, 72);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color grey = Color.fromARGB(255, 226, 226, 226);
}

class AppPropertyText {
  static const String AppName = "Ringkas App";
}

class AppPropertyBorderRadius {
  // Untuk Card, Container, dll
  static final rounded10 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  // Untuk ButtonStyle
  static final buttonShape = WidgetStatePropertyAll<OutlinedBorder>(rounded10);
}
