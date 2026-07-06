import 'package:flutter_pos/enum_and_string/string.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction_state.dart';
import 'package:flutter_pos/features/common_user/transaction/util/allocate_fifo.dart';
import 'package:flutter_pos/features/common_user/transaction/util/calculate_subtotal_batch.dart';
import 'package:flutter_pos/features/common_user/transaction/util/release_fifo.dart';
import 'package:flutter_pos/features/common_user/transaction/util/total_qty.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_fifo_logic.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_item_ordered_batch.dart';

ModelFIFOLogic fifoLogic({
  required TransactionLoaded state,
  double? customPrice,
  required ModelItemOrdered item,
  bool? mode,
  double? qty,
  int? discount,
  List<ModelItemOrdered>? simulatedItemOrdered,
  double? secondCustomPrice,
}) {
  final isSell = state.isSell;
  List<ModelItemOrderedBatch> batches = List.from(item.getitemOrderedBatch);
  final fifoActive = UserSession.getStatusFifo();
  final isFifo = fifoActive && isSell;
  final batch = state.dataItemBatch!;
  bool customPriceItemStatus = item.getcustomPrice;

  final customPriceSell = isSell
      ? customPrice == null
            ? item.getpriceItemFinal
            : customPrice
      : secondCustomPrice == null
      ? batches.isNotEmpty
            ? batches.last.getprice_item
            : item.getpriceItemFinal
      : secondCustomPrice;

  double customPriceBuy = isSell
      ? item.getpriceItemBuy
      : customPrice == null
      ? batches.isNotEmpty
            ? batches.last.getprice_itemBuy
            : item.getpriceItemBuy
      : customPrice;

  final checkCustomPrice = isSell ? customPriceSell != item.getpriceItem : true;

  devLog(
    "Log FifoLogic: customPriceBuy: $customPriceBuy, customPriceSell: $customPriceSell",
  );
  devLog(
    "Log FifoLogic: batch_priceBuy: ${batches.isNotEmpty ? batches.last.getprice_itemBuy : 0}, batch_priceSell: ${batches.isNotEmpty ? batches.last.getprice_item : 0}",
  );

  if ((customPrice != null && customPrice != 0 && checkCustomPrice) ||
      (secondCustomPrice != null && secondCustomPrice != 0)) {
    customPriceItemStatus = true;
    if (isFifo) {
      for (int i = 0; i < batches.length; i++) {
        final b = batches[i];
        batches[i] = ModelItemOrderedBatch(
          price_itemBuy: customPriceBuy,
          id_ordered: b.getid_Ordered,
          id_item: b.getid_Item,
          invoice: b.getinvoice,
          qty_item: b.getqty_item,
          price_item: customPriceSell,
        );
      }
    } else {
      if (batches.isNotEmpty) {
        batches[0] = batches[0].copyWith(
          price_item: customPriceSell == 0
              ? batches[0].getprice_item
              : customPriceSell,
          price_itemBuy: customPriceBuy == 0
              ? batches[0].getprice_itemBuy
              : customPriceBuy,
        );
      }
    }
  } else if (customPriceSell == 0 || customPriceBuy == 0) {
    customPriceItemStatus = false;
    if (isFifo) {
      final qtyNow = totalQty(batches);
      batches.clear();
      allocateFIFO(
        state: state,
        currentListContext: simulatedItemOrdered,
        id_ordered: item.getidOrdered,
        usedBatches: batches,
        stockBatches: batch,
        idItem: item.getidItem,
        invoice: item.getinvoice ?? '',
        qtyNeed: qtyNow,
        priceSell: customPriceSell == 0 ? 0 : customPriceSell,
        priceBuy: customPriceBuy == 0 ? 0 : customPriceBuy,
      );
    } else {
      if (batches.isNotEmpty) {
        batches[0] = batches[0].copyWith(
          price_item: item.getpriceItem,
          price_itemBuy: item.getpriceItemBuy,
        );
      }
    }
  }

  if (mode != null) {
    if (mode) {
      if (isFifo) {
        allocateFIFO(
          state: state,
          priceSell: customPriceItemStatus ? customPriceSell : 0,
          priceBuy: customPriceBuy,
          currentListContext: simulatedItemOrdered,
          id_ordered: item.getidOrdered,
          usedBatches: batches,
          stockBatches: batch,
          idItem: item.getidItem,
          invoice: item.getinvoice ?? '',
          qtyNeed: 1,
        );
        devLog(
          "Log TransactionBloc: fifoLogic: price ${checkCustomPrice ? customPriceSell : 0}",
        );
      } else {
        if (batches.isEmpty) {
          batches.add(
            ModelItemOrderedBatch(
              price_itemBuy: item.getpriceItemBuy,
              price_item: item.getpriceItem,
              id_ordered: nonFifo,
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
        devLog("Log TransactionBloc: Buy Add");
      }
    } else {
      devLog("Log TransactionBloc: fifoLogic: checkFLow ${mode}");
      if (batches.isNotEmpty) {
        releaseFIFO(usedBatches: batches, qtyRelease: 1);
      }
    }
  }

  //custom QTY
  if (qty != null) {
    if (isFifo) {
      final diff = qty - totalQty(batches);
      if (diff > 0) {
        allocateFIFO(
          priceBuy: customPriceBuy,
          state: state,
          priceSell: customPriceItemStatus ? customPriceSell : 0,
          currentListContext: simulatedItemOrdered,
          id_ordered: item.getidOrdered,
          usedBatches: batches,
          stockBatches: batch,
          idItem: item.getidItem,
          invoice: item.getinvoice ?? '',
          qtyNeed: diff,
        );
      } else if (diff < 0) {
        releaseFIFO(usedBatches: batches, qtyRelease: diff.abs());
      }
    } else {
      if (batches.isEmpty) {
        batches.add(
          ModelItemOrderedBatch(
            price_item: batches.isNotEmpty
                ? batches.first.getprice_item
                : item.getpriceItemFinal,
            id_ordered: nonFifo,
            id_item: item.getidItem,
            invoice: item.getinvoice ?? '',
            qty_item: item.getqtyItem,
            price_itemBuy: batches.isNotEmpty
                ? batches.first.getprice_itemBuy
                : item.getpriceItemBuy,
          ),
        );
      } else {
        batches[0] = batches[0].copyWith(qty_item: qty);
      }
    }
  }

  final qtyFinal = totalQty(batches);

  final priceSell = batches.isNotEmpty
      ? batches.first.getprice_item
      : item.getpriceItemFinal;

  final priceBuy = batches.isNotEmpty
      ? batches.first.getprice_itemBuy
      : item.getpriceItemBuy;

  final subTotal = isSell
      ? calculateSubTotalFromBatch(batches, discount ?? 0)
      : priceBuy * qtyFinal;

  devLog("Log FifoLogic: subTotal: $priceBuy * $qtyFinal = $subTotal");

  return ModelFIFOLogic(
    customPriceStatus: customPriceItemStatus,
    priceBuy: priceBuy,
    qty: qtyFinal,
    price: priceSell,
    batch: batches,
    subTotal: subTotal.roundToDouble(),
  );
}
