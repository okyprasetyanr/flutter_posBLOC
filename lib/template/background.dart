import 'dart:ui';

import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    double waveHeight = 10; // tinggi gelombang
    double waveWidth = 10; // makin kecil = makin rapat

    // ==== WAVE ATAS ====
    path.moveTo(0, waveHeight);

    for (double i = 0; i < size.width; i += waveWidth) {
      path.quadraticBezierTo(i + waveWidth / 2, 0, i + waveWidth, waveHeight);
    }

    // ==== TURUN KE BAWAH ====
    path.lineTo(size.width, size.height - waveHeight);

    // ==== WAVE BAWAH ====
    for (double i = size.width; i > 0; i -= waveWidth) {
      path.quadraticBezierTo(
        i - waveWidth / 2,
        size.height,
        i - waveWidth,
        size.height - waveHeight,
      );
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
