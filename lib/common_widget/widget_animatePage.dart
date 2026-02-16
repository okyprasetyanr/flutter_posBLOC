import 'package:flutter/material.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class WidgetAnimatePage extends StatelessWidget {
  final bool change;
  final String text1;
  final String text2;
  const WidgetAnimatePage({
    super.key,
    required this.change,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          curve: Curves.easeInOut,
          left: change ? 0 : -200,
          duration: const Duration(milliseconds: 500),
          child: Row(
            children: [
              const Icon(Icons.swap_horiz_rounded, size: lv3IconSize),
              Text(text1, style: titleTextStyle),
            ],
          ),
        ),
        AnimatedPositioned(
          curve: Curves.easeInOut,
          left: change ? 300 : 0,
          duration: const Duration(milliseconds: 500),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Icon(Icons.swap_horiz_rounded, size: lv3IconSize),
                Text(text2, style: titleTextStyle),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
