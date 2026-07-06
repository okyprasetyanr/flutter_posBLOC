import 'package:flutter_pos/features/common_user/transaction/util/total_qty.dart';
import 'package:flutter_pos/model_data/model_item_ordered_batch.dart';

void releaseFIFO({
  required List<ModelItemOrderedBatch> usedBatches,
  required double qtyRelease,
}) {
  final totalQuant = totalQty(usedBatches);
  if (totalQuant <= 1) return;

  double release = qtyRelease;

  for (int i = usedBatches.length - 1; i >= 0; i--) {
    if (release <= 0) break;

    final batch = usedBatches[i];

    if (batch.getqty_item <= release) {
      release -= batch.getqty_item;
      usedBatches.removeAt(i);
    } else {
      usedBatches[i] = ModelItemOrderedBatch(
        id_ordered: batch.getid_Ordered,
        id_item: batch.getid_Item,
        invoice: batch.getinvoice,
        qty_item: batch.getqty_item - release,
        price_item: batch.getprice_item,
        price_itemBuy: batch.getprice_itemBuy,
      );
      release = 0;
    }
  }
}
