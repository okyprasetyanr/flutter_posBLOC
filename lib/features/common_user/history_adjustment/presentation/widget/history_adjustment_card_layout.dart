import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/template/dynamic_stl_for_color_wrapper.dart';

class HistoryAdjustmentCardLayout extends StatelessWidget {
  final String name;
  final String invoice;
  final DateTime date;
  final String note;
  final double? qty_in_after;
  final double? qty_in_before;
  final double? qty_out_after;
  final double? qty_out_before;
  final double? sell_price_after;
  final double? sell_price_before;
  final double? buy_price_after;
  final double? buy_price_before;
  final DateTime? expired_after;
  final DateTime? expired_before;
  final VoidCallback onTap;
  const HistoryAdjustmentCardLayout({
    super.key,
    required this.name,
    required this.invoice,
    required this.date,
    required this.note,
    this.qty_in_after,
    this.qty_in_before,
    this.qty_out_after,
    this.qty_out_before,
    this.sell_price_after,
    this.sell_price_before,
    this.buy_price_after,
    this.buy_price_before,
    this.expired_after,
    this.expired_before,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 6),
      child: Card(
        color: AppPropertyColor.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DynamicColorWrapper(
                  colorSelector: (context) => context.colorHistAdjustment,
                  builder: (context, color) => SizedBox(
                    width: double.infinity,
                    child: customTextBorder(
                      "$name (${invoice})",
                      lv1TextStyleWhite,
                      color: context.colorHistAdjustment,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(invoice, style: lv05TextStyle),
                    Text(formatDate(date: date), style: lv05TextStyle),
                  ],
                ),
                Text(
                  "Catatan: ${note}",
                  style: lv05TextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
