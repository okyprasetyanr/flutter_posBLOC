import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';

Widget customTextBorder(
  String title,
  TextStyle textStyle, {
  bool? whiteBackground = false,
  double? marginLeft,
  Color? color,
}) {
  return Container(
    margin: EdgeInsets.only(left: marginLeft ?? 0),
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    decoration: BoxDecoration(
      color: whiteBackground!
          ? AppPropertyColor.white
          : color ?? AppPropertyColor.primary,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(title, style: textStyle, textAlign: TextAlign.center),
  );
}
