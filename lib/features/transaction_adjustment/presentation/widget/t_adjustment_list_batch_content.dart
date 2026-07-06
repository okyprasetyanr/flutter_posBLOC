import 'package:flutter/material.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/row_content.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/batch/model/model_item_batch.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class TAdjustmentListBatchContent extends StatelessWidget {
  final Color color;
  final ModelItemBatch item;
  const TAdjustmentListBatchContent({
    super.key,
    required this.color,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppPropertyColor.white,
      borderRadius: BorderRadius.circular(10),
      elevation: 4,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            width: double.infinity,
            child: Text(
              "Nota: ${item.getinvoice}",
              style: lv1TextStyleWhite,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                rowContent("Tanggal", formatDate(date: item.getdateBuy)),
                rowContent("Stok Masuk", formatQtyOrPrice(item.getqtyItem_in)),
                rowContent(
                  "Stok Keluar",
                  formatQtyOrPrice(item.getqtyItem_out),
                ),
                rowContent(
                  "Stok Sisa",
                  formatQtyOrPrice(item.getqtyItem_in - item.getqtyItem_out),
                ),
                rowContent("Harga Jual", formatPriceRp(item.getpriceItemFinal)),
                rowContent("Harga Beli", formatPriceRp(item.getpriceItemBuy)),
                rowContent(
                  "Kadaluarsa",
                  item.getexpiredDate != null
                      ? formatDate(date: item.getexpiredDate!, minute: false)
                      : "-",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
