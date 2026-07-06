import 'package:flutter/material.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/icon_size.dart';

Widget customIconButtonMinPlus({
  required bool isIncrement,
  required VoidCallback onPressed,
}) {
  return IconButton(
    style: ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size(0, 0)),
      padding: WidgetStatePropertyAll(EdgeInsets.all(5)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppPropertyColor.black),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    onPressed: onPressed,
    icon: Icon(
      isIncrement ? Icons.add : Icons.remove,
      size: lv2IconSize,
      color: AppPropertyColor.black,
    ),
  );
}
