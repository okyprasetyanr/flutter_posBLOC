// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

class DoubleWave extends StatefulWidget {
  final bool mirror;
  const DoubleWave({Key? key, required this.mirror}) : super(key: key);

  @override
  State<DoubleWave> createState() => _DoubleWaveState();
}

class _DoubleWaveState extends State<DoubleWave>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: Stack(
        children: [
          CustomPaint(
            painter: _WavePainter(
              mirror: widget.mirror,
              animation: _controller,
              amplitude: 6,
              phase: 0,
              opacity: 0.35,
              reverse: widget.mirror ? false : true, // 👈 kebalik
            ),
            size: const Size(double.infinity, 90),
          ),
          CustomPaint(
            painter: _WavePainter(
              mirror: widget.mirror,
              animation: _controller,
              amplitude: 10,
              phase: pi / 2,
              opacity: 0.65,
              reverse: widget.mirror ? true : false,
            ),
            size: const Size(double.infinity, 90),
          ),
        ],
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  final Animation<double> animation;
  final double amplitude;
  final double phase;
  final double opacity;
  final bool reverse;
  final bool mirror;

  _WavePainter({
    required this.mirror,
    required this.animation,
    required this.amplitude,
    required this.phase,
    required this.opacity,
    this.reverse = false,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    if (mirror) {
      canvas.save();
      canvas.translate(0, size.height);
      canvas.scale(1, -1);
    }
    final t = reverse ? (1.0 - animation.value) : animation.value;

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color.fromARGB(249, 110, 161, 111).withValues(alpha: opacity),
          const Color.fromARGB(
            249,
            110,
            161,
            111,
          ).withValues(alpha: opacity * 0.6),
          const Color.fromARGB(
            249,
            110,
            161,
            111,
          ).withValues(alpha: opacity * 0.4),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()..moveTo(0, size.height);

    for (double x = 0; x <= size.width; x += 4) {
      final y = reverse
          ? sin((x / size.width * 1 * pi) + t * 4 * pi + phase) * amplitude +
                size.height * 0.7
          : size.height -
                (sin((x / size.width * 2 * pi) + t * 2 * pi + phase) *
                        amplitude +
                    size.height * 0.7);

      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
    if (mirror) {
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_) => false;
}
