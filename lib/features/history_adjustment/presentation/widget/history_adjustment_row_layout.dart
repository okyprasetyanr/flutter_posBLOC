// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_row_list_item.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class HistoryAdjustmentRowLayout<T> extends StatelessWidget {
  final String title;
  final T? value_before;
  final T? value_after;
  final bool date;
  final bool price;
  final bool adjustment_in;
  HistoryAdjustmentRowLayout({
    Key? key,
    required this.title,
    this.value_before,
    this.value_after,
    required this.adjustment_in,
    this.price = false,
    this.date = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dataAfter;
    String dataBefore;
    String originalAfter;
    bool minus = false;
    if (value_before is double) {
      final after = value_after as double?;
      final before = value_before as double?;
      double calculate = after != null && before != after ? after - before! : 0;
      dataAfter = calculate != 0
          ? price
                ? formatPriceRp(
                    calculate,
                  ).replaceAll("Rp", "").replaceAll(",00", "")
                : formatQtyOrPrice(calculate)
          : "";
      originalAfter = after != null && before != after
          ? price
                ? formatPriceRp(
                    after,
                  ).replaceAll("Rp", "").replaceAll(",00", "")
                : formatQtyOrPrice(after)
          : "-";
      minus = calculate < 0;
      dataBefore = price
          ? formatPriceRp(
              before as double,
            ).replaceAll("Rp", "").replaceAll(",00", "")
          : formatQtyOrPrice(before as double);
    } else {
      final after = value_after as String? ?? "";
      dataBefore = value_before as String? ?? "";
      dataAfter = after.isEmpty
          ? "-"
          : (dataBefore.isEmpty || after != dataBefore)
          ? after
          : "Sama";
      originalAfter = after.isNotEmpty && dataBefore != after ? after : "-";
    }
    return Column(
      children: [
        customRowListItem(
          row1: title,
          flexRow1: 4,
          row2: dataBefore.isEmpty ? "-" : dataBefore,
          flexRow2: 5,
          row3: originalAfter,
          flexRow3: 5,
          style3: lv05TextStyleRed,
          row4: date
              ? dataAfter
              : dataAfter.isEmpty
              ? "-"
              : "(${minus ? "" : "+"}$dataAfter)",
          flexRow4: 5,
          style4: minus ? lv05TextStyleRed : lv05TextStylePrimary,
        ),
        const Divider(
          thickness: 1,
          height: 5,
          color: AppPropertyColor.greyLight,
        ),
      ],
    );
  }
}
