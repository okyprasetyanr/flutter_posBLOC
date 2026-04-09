import 'package:flutter/material.dart';

class DynamicColorWrapper extends StatelessWidget {
  final Color Function(BuildContext context) colorSelector;
  final Widget Function(BuildContext context, Color color) builder;

  const DynamicColorWrapper({
    Key? key,
    required this.colorSelector,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedColor = colorSelector(context);

    return builder(context, selectedColor);
  }
}
