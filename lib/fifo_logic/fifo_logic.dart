import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_fifo_logic.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_item_ordered_batch.dart';

ModelFIFOLogic fifoLogic({
  required TransactionLoaded state,
  double? customPrice, // SELL → harga jual, BUY → harga beli
  required ModelItemOrdered item,
  bool? mode,
  double? qty,
  int? discount,
  List<ModelItemOrdered>? simulatedItemOrdered,
  double? secondCustomPrice, // BUY → harga jual default item
}) {
  final isSell = state.isSell;
  List<ModelItemOrderedBatch> batches = List.from(item.getitemOrderedBatch);
  final fifoActive = UserSession.getStatusFifo();
  final isFifo = fifoActive && isSell;
  final stockBatches = state.dataItemBatch!;

  // === PRICE SOURCE ===
  final double? sellOverride = isSell ? customPrice : secondCustomPrice;
  final double? buyOverride = !isSell ? customPrice : null;

  final double defaultSell = item.getpriceItemFinal;
  final bool hasSellOverride = sellOverride != null && sellOverride != 0;

  // === UPDATE EXISTING BATCH PRICE (NO FIFO) ===
  if (!isFifo && batches.isNotEmpty) {
    batches[0] = batches[0].copyWith(
      price_item: hasSellOverride ? sellOverride : defaultSell,
      price_itemBuy: buyOverride ?? batches[0].getprice_itemBuy,
    );
  }

  // === RESET FIFO WHEN PRICE CLEARED ===
  if (isFifo && sellOverride == 0) {
    final qtyNow = _totalQty(batches);
    batches.clear();
    _allocateFIFO(
      state: state,
      currentListContext: simulatedItemOrdered,
      id_ordered: item.getidOrdered,
      usedBatches: batches,
      stockBatches: stockBatches,
      idItem: item.getidItem,
      invoice: item.getinvoice ?? '',
      qtyNeed: qtyNow,
      sellPrice: null,
      buyPrice: null,
    );
  } else {
    if (batches.isNotEmpty) {
      batches[0] = batches[0].copyWith(
        price_item: item.getpriceItem,
        price_itemBuy: batches[0].getprice_itemBuy,
      );
    }
  }

  // === ADD / REMOVE QTY ===
  if (mode != null) {
    if (mode) {
      if (isFifo) {
        _allocateFIFO(
          state: state,
          sellPrice: hasSellOverride ? sellOverride : null,
          buyPrice: null,
          currentListContext: simulatedItemOrdered,
          id_ordered: item.getidOrdered,
          usedBatches: batches,
          stockBatches: stockBatches,
          idItem: item.getidItem,
          invoice: item.getinvoice ?? '',
          qtyNeed: 1,
        );
      } else {
        if (batches.isEmpty) {
          batches.add(
            ModelItemOrderedBatch(
              price_item: defaultSell,
              id_ordered: 'NON_FIFO',
              id_item: item.getidItem,
              invoice: item.getinvoice ?? '',
              qty_item: 1,
            ),
          );
        } else {
          batches[0] = batches[0].copyWith(
            qty_item: batches[0].getqty_item + 1,
          );
        }
      }
    } else {
      if (batches.isNotEmpty) {
        _releaseFIFO(usedBatches: batches, qtyRelease: 1);
      }
    }
  }

  // === CUSTOM QTY ===
  if (qty != null) {
    if (isFifo) {
      final diff = qty - _totalQty(batches).toInt();
      if (diff > 0) {
        _allocateFIFO(
          state: state,
          sellPrice: hasSellOverride ? sellOverride : null,
          buyPrice: null,
          currentListContext: simulatedItemOrdered,
          id_ordered: item.getidOrdered,
          usedBatches: batches,
          stockBatches: stockBatches,
          idItem: item.getidItem,
          invoice: item.getinvoice ?? '',
          qtyNeed: diff,
        );
      } else if (diff < 0) {
        _releaseFIFO(usedBatches: batches, qtyRelease: diff.abs());
      }
    } else {
      if (batches.isEmpty) {
        batches.add(
          ModelItemOrderedBatch(
            price_item: batches.isNotEmpty
                ? batches.first.getprice_item
                : item.getpriceItemFinal,
            id_ordered: 'NON_FIFO',
            id_item: item.getidItem,
            invoice: item.getinvoice ?? '',
            qty_item: item.getqtyItem,
          ),
        );
      } else {
        batches[0] = batches[0].copyWith(qty_item: qty);
      }
    }
  }

  final qtyFinal = _totalQty(batches);

  final double sellPrice = batches.isNotEmpty
      ? batches.first.getprice_item
      : defaultSell;

  final double buyPriceFinal = buyOverride ?? batches.first.getprice_itemBuy;

  final subTotal = isSell
      ? _calculateSubTotalFromBatch(batches, discount ?? 0)
      : sellPrice * qtyFinal;

  return ModelFIFOLogic(
    priceBuy: buyPriceFinal,
    qty: qtyFinal,
    price: sellPrice,
    batch: batches,
    subTotal: subTotal,
  );
}

double _totalQty(List<ModelItemOrderedBatch> batches) {
  return batches.fold(0.0, (sum, e) => sum + e.getqty_item);
}

void _allocateFIFO({
  required TransactionLoaded state,
  required List<ModelItemOrderedBatch> usedBatches,
  required List<ModelItemBatch> stockBatches,
  required String idItem,
  required String invoice,
  required double qtyNeed,
  required String id_ordered,
  double? sellPrice,
  double? buyPrice,
  List<ModelItemOrdered>? currentListContext,
}) {
  double need = qtyNeed;

  final fifo =
      stockBatches
          .where(
            (e) => e.getidItem == idItem && e.getqtyItem_in > e.getqtyItem_out,
          )
          .toList()
        ..sort((a, b) => a.getdateBuy.compareTo(b.getdateBuy));

  for (final batch in fifo) {
    if (need <= 0) break;

    final usedQtyInOrder = usedBatches
        .where((e) => e.getid_Ordered == batch.getidOrdered)
        .fold(
          0.0,
          (previousValue, element) => previousValue + element.getqty_item,
        );

    final globalUsed = _getGlobalUsedQty(
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

    usedBatches.add(
      ModelItemOrderedBatch(
        id_ordered: batch.getidOrdered,
        id_item: idItem,
        invoice: invoice,
        qty_item: take,
        price_item: sellPrice ?? batch.getpriceItemFinal,
        price_itemBuy: buyPrice ?? batch.getpriceItemBuy,
      ),
    );

    need -= take;
  }
}

void _releaseFIFO({
  required List<ModelItemOrderedBatch> usedBatches,
  required double qtyRelease,
}) {
  final totalQty = _totalQty(usedBatches);
  if (totalQty <= 1) return;

  double release = qtyRelease;

  for (int i = usedBatches.length - 1; i >= 0; i--) {
    if (release <= 0) break;

    final batch = usedBatches[i];

    if (batch.getqty_item <= release) {
      release -= batch.getqty_item.toInt();
      usedBatches.removeAt(i);
    } else {
      usedBatches[i] = ModelItemOrderedBatch(
        id_ordered: batch.getid_Ordered,
        id_item: batch.getid_Item,
        invoice: batch.getinvoice,
        qty_item: batch.getqty_item - release,
        price_item: batch.getprice_item,
      );
      release = 0;
    }
  }
}

double _calculateSubTotalFromBatch(
  List<ModelItemOrderedBatch> batches,
  int discount,
) {
  final gross = batches.fold<double>(
    0.0,
    (sum, element) => sum + (element.getqty_item * element.getprice_item),
  );

  if (discount <= 0) return gross;

  return gross - (gross * discount / 100);
}

double _getGlobalUsedQty(
  String idItem,
  String idOrdered,
  String stockBatchId, {
  required TransactionLoaded state,
  List<ModelItemOrdered>? currentListContext,
}) {
  final sourceList = currentListContext ?? state.itemOrdered;

  return sourceList
      .where((e) => e.getidItem == idItem)
      .where((b) => b.getidOrdered != idOrdered)
      .expand((e) => e.getitemOrderedBatch)
      .where((batch) => batch.getid_Ordered == stockBatchId)
      .fold(0.0, (sum, b) => sum + b.getqty_item);
}

Future<void> updateExistingBatch(
  DataUserRepositoryCache dataRepo,
  String invoice,
) async {
  final batchRef = FirebaseFirestore.instance.collection("batch").doc(invoice);

  final writeBatch = FirebaseFirestore.instance.batch();

  for (final batch in dataRepo.dataBatch) {
    if (batch.getinvoice != invoice) continue;

    for (final itemBatch in batch.getitems_batch) {
      final itemDoc = batchRef
          .collection("items_batch")
          .doc(itemBatch.getidOrdered);

      writeBatch.update(itemDoc, {"qty_item_out": itemBatch.getqtyItem_out});
    }
  }

  await writeBatch.commit();
}

void revertFIFOStock({
  required List<ModelItemOrdered> itemsOrdered,
  required List<ModelBatch> dataBatch,
}) {
  for (final item in itemsOrdered) {
    for (final usedBatch in item.getitemOrderedBatch) {
      bool found = false;

      for (int i = 0; i < dataBatch.length; i++) {
        final itemBatch = dataBatch[i];

        final batchIndex = itemBatch.getitems_batch.indexWhere(
          (b) =>
              b.getidItem == item.getidItem &&
              b.getidOrdered == usedBatch.getid_Ordered,
        );

        if (batchIndex == -1) continue;

        final batch = itemBatch.getitems_batch[batchIndex];

        final newQtyOut = batch.getqtyItem_out - usedBatch.getqty_item;

        itemBatch.getitems_batch[batchIndex] = batch.copyWith(
          qtyItem_out: newQtyOut < 0 ? 0 : newQtyOut,
        );

        found = true;

        debugPrint(
          "Revert FIFO → item:${item.getidItem} batch:${batch.getidOrdered} qty:${usedBatch.getqty_item}",
        );
        break;
      }

      if (!found) {
        debugPrint(
          "WARNING revertFIFOStock: batch ${usedBatch.getid_Ordered} not found",
        );
      }
    }
  }
}
