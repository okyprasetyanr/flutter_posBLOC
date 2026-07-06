import 'package:flutter_pos/features/transaction/logic/transaction_state.dart';
import 'package:flutter_pos/features/transaction/util/global_used_qty.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/batch/model/model_item_batch.dart';
import 'package:flutter_pos/features/transaction/model/model_item_ordered.dart';
import 'package:flutter_pos/features/batch/model/model_item_ordered_batch.dart';

void allocateFIFO({
  required TransactionLoaded state,
  required List<ModelItemOrderedBatch> usedBatches,
  required List<ModelItemBatch> stockBatches,
  required String idItem,
  required String invoice,
  required double qtyNeed,
  required String id_ordered,
  required double priceSell,
  required double priceBuy,
  List<ModelItemOrdered>? currentListContext,
}) {
  double need = qtyNeed;

  final fifo = sortStockMode(
    stockBatches
        .where(
          (e) => e.getidItem == idItem && e.getqtyItem_in > e.getqtyItem_out,
        )
        .toList(),
  );

  for (final batch in fifo) {
    if (need <= 0) break;

    final usedQtyInOrder = usedBatches
        .where((e) => e.getid_Ordered == batch.getidOrdered)
        .fold(
          0.0,
          (previousValue, element) => previousValue + element.getqty_item,
        );

    final globalUsed = getGlobalUsedQty(
      state: state,
      idItem,
      id_ordered,
      batch.getidOrdered,
      currentListContext: currentListContext,
    );

    final available =
        batch.getqtyItem_in -
        batch.getqtyItem_out -
        usedQtyInOrder -
        globalUsed;

    if (available <= 0) continue;

    final take = available >= need ? need : available;

    final existingIndex = usedBatches.indexWhere(
      (e) => e.getid_Ordered == batch.getidOrdered,
    );

    if (existingIndex != -1) {
      final existing = usedBatches[existingIndex];

      usedBatches[existingIndex] = ModelItemOrderedBatch(
        id_ordered: existing.getid_Ordered,
        id_item: existing.getid_Item,
        invoice: existing.getinvoice,
        qty_item: existing.getqty_item + take,
        price_item: existing.getprice_item,
        price_itemBuy: existing.getprice_itemBuy,
      );
    } else {
      usedBatches.add(
        ModelItemOrderedBatch(
          id_ordered: batch.getidOrdered,
          id_item: idItem,
          invoice: invoice,
          qty_item: take,
          price_item: priceSell != 0 ? priceSell : batch.getpriceItemFinal,
          price_itemBuy: priceBuy != 0 ? priceBuy : batch.getpriceItemBuy,
        ),
      );
    }

    devLog(
      "Log FifoLogic: AllocateFIFO: ${usedBatches.last.getprice_item}/$priceSell",
    );
    need -= take;
  }
}
