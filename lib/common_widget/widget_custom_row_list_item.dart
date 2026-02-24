import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

Widget customRowListItem({
  String name = "Nama",
  String disc = "Dis.",
  String quantity = "Jumlah",
  String total = "Total Harga",
  bool label = false,
  bool condiment = false,
}) {
  return Column(
    children: [
      if (label)
        const SizedBox(
          height: 1,
          width: double.infinity,
          child: const DecoratedBox(
            decoration: BoxDecoration(color: AppPropertyColor.greyLight),
          ),
        ),
      Row(
        children: [
          Expanded(
            flex: 7,
            child: Text(
              condiment ? "*$name" : name,
              style: condiment ? lv05TextStyleItalic : lv05TextStyle,
              overflow: TextOverflow.ellipsis,
              textAlign: label ? TextAlign.center : TextAlign.start,
            ),
          ),
          const SizedBox(
            width: 1,
            height: 15,
            child: const DecoratedBox(
              decoration: BoxDecoration(color: AppPropertyColor.greyLight),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              disc,
              style: condiment ? lv05TextStyleItalic : lv05TextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 1,
            height: 15,
            child: const DecoratedBox(
              decoration: BoxDecoration(color: AppPropertyColor.greyLight),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Text(
                quantity,
                style: condiment ? lv05TextStyleItalic : lv05TextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            width: 1,
            height: 15,
            child: const DecoratedBox(
              decoration: BoxDecoration(color: AppPropertyColor.greyLight),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              total,
              style: condiment ? lv05TextStyleItalic : lv05TextStyle,
              textAlign: label ? TextAlign.center : TextAlign.end,
            ),
          ),
        ],
      ),
      if (label)
        const SizedBox(
          height: 1,
          width: double.infinity,
          child: const DecoratedBox(
            decoration: BoxDecoration(color: AppPropertyColor.greyLight),
          ),
        ),
    ],
  );
}
