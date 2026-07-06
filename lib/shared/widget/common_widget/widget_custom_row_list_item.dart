import 'package:flutter/material.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

Widget customRowListItem({
  String row1 = "Nama",
  String row2 = "Dis.",
  String row3 = "Jumlah",
  String row4 = "Total Harga",
  int flexRow1 = 7,
  int flexRow2 = 3,
  int flexRow3 = 3,
  int flexRow4 = 5,
  TextStyle? style1,
  TextStyle? style2,
  TextStyle? style3,
  TextStyle? style4,
  bool label = false,
  bool condiment = false,
}) {
  return Column(
    children: [
      if (label) const Divider(color: AppPropertyColor.greyLight, height: 1),
      Row(
        children: [
          Expanded(
            flex: flexRow1,
            child: Padding(
              padding: EdgeInsets.only(left: label ? 0 : 5),
              child: Text(
                condiment ? "*$row1" : row1,
                style: condiment
                    ? lv05TextStyleItalic
                    : style1 ?? lv05TextStyle,
                overflow: TextOverflow.ellipsis,
                textAlign: label ? TextAlign.center : TextAlign.start,
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
            flex: flexRow2,
            child: Text(
              row2,
              style: condiment ? lv05TextStyleItalic : style2 ?? lv05TextStyle,
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
            flex: flexRow3,
            child: Text(
              row3,
              style: condiment ? lv05TextStyleItalic : style3 ?? lv05TextStyle,
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
            flex: flexRow4,
            child: Padding(
              padding: EdgeInsets.only(right: label ? 0 : 5),
              child: Text(
                row4,
                style: condiment
                    ? lv05TextStyleItalic
                    : style4 ?? lv05TextStyle,
                textAlign: label ? TextAlign.center : TextAlign.end,
              ),
            ),
          ),
        ],
      ),
      if (label) const Divider(color: AppPropertyColor.greyLight, height: 1),
    ],
  );
}
