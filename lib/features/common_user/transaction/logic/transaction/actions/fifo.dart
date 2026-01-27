//   import 'package:flutter/material.dart';
// import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
// import 'package:flutter_pos/model_data/model_fifo_logic.dart';
// import 'package:flutter_pos/model_data/model_item_ordered.dart';
// import 'package:flutter_pos/model_data/model_item_ordered_batch.dart';

// ModelFIFOLogic fifoLogic({
//   required TransactionLoaded state,
//     double? customprice,
//     required ModelItemOrdered item,
//     bool? mode,
//     double? qty,
//     int? discount,
//   }) {
//     final isSell = (state as TransactionLoaded).isSell;
//     List<ModelItemOrderedBatch> batches = List.from(item.getitemOrderedBatch);
//     final fifoActive = UserSession.getStatusFifo();
//     final isFifo = fifoActive && isSell;
//     final batch = (state as TransactionLoaded).dataItemBatch!;
//     debugPrint(
//       "Log TransactionBloc: check bool fifoLogic(): isSell: $isSell, fifoActive: $fifoActive",
//     );
//     final customPriceState = customprice == null
//         ? (state as TransactionLoaded).customPrice != 0
//               ? (state as TransactionLoaded).customPrice
//               : item.getpriceItemFinal
//         : customprice;

//     if (customPriceState != 0) {
//       if (isFifo) {
//         for (int i = 0; i < batches.length; i++) {
//           final b = batches[i];
//           batches[i] = ModelItemOrderedBatch(
//             id_ordered: b.getid_Ordered,
//             id_item: b.getid_Item,
//             invoice: b.getinvoice,
//             qty_item: b.getqty_item,
//             price_item: customPriceState,
//           );
//         }
//       } else {
//         if (batches.isNotEmpty) {
//           batches[0] = batches[0].copyWith(price_item: customprice);
//         }
//       }
//     } else if (customPriceState == 0) {
//       if (isFifo) {
//         final qtyNow = _totalQty(batches);
//         batches.clear();
//         _allocateFIFO(
//           id_ordered: item.getidOrdered,
//           usedBatches: batches,
//           stockBatches: batch,
//           idItem: item.getidItem,
//           invoice: item.getinvoice ?? '',
//           qtyNeed: qtyNow,
//           price: 0,
//         );
//       } else {
//         if (batches.isNotEmpty) {
//           batches[0] = batches[0].copyWith(price_item: item.getpriceItem);
//         }
//       }
//     }

//     if (mode != null) {
//       if (mode) {
//         if (isFifo) {
//           _allocateFIFO(
//             id_ordered: item.getidOrdered,
//             usedBatches: batches,
//             stockBatches: batch,
//             idItem: item.getidItem,
//             invoice: item.getinvoice ?? '',
//             qtyNeed: 1,
//           );
//           debugPrint("Log TransactionBloc: fifoLogic: checkFLow ${mode}");
//         } else {
//           if (batches.isEmpty) {
//             batches.add(
//               ModelItemOrderedBatch(
//                 price_item: item.getpriceItem,
//                 id_ordered: 'NON_FIFO',
//                 id_item: item.getidItem,
//                 invoice: item.getinvoice ?? '',
//                 qty_item: 1,
//               ),
//             );
//           } else {
//             batches[0] = batches[0].copyWith(
//               qty_item: batches[0].getqty_item + 1,
//             );
//           }
//           debugPrint("Log TransactionBloc: Buy Add");
//         }
//       } else {
//         debugPrint("Log TransactionBloc: fifoLogic: checkFLow ${mode}");
//         if (batches.isNotEmpty) {
//           _releaseFIFO(usedBatches: batches, qtyRelease: 1);
//         }
//       }
//     }

//     //custom QTY
//     if (isFifo) {
//       if (qty != null) {
//         final diff = qty - _totalQty(batches).toInt();
//         if (diff > 0) {
//           _allocateFIFO(
//             id_ordered: item.getidOrdered,
//             usedBatches: batches,
//             stockBatches: batch,
//             idItem: item.getidItem,
//             invoice: item.getinvoice ?? '',
//             qtyNeed: diff,
//           );
//         } else if (diff < 0) {
//           _releaseFIFO(usedBatches: batches, qtyRelease: diff.abs());
//         }
//       } else {
//         if (batches.isEmpty) {
//           batches.add(
//             ModelItemOrderedBatch(
//               price_item: batches.isNotEmpty
//                   ? batches.first.getprice_item
//                   : item.getpriceItemFinal,
//               id_ordered: 'NON_FIFO',
//               id_item: item.getidItem,
//               invoice: item.getinvoice ?? '',
//               qty_item: 1,
//             ),
//           );
//         } else {
//           batches[0] = batches[0].copyWith(qty_item: qty);
//         }
//       }
//     }

//     final qtyFinal = _totalQty(batches);

//     final price = batches.isNotEmpty
//         ? batches.first.getprice_item
//         : item.getpriceItemFinal;

//     debugPrint("Log TransactionBloc: FifoLogic: qty: $qtyFinal, price: $price");

//     final subTotal = isSell
//         ? _calculateSubTotalFromBatch(batches, discount ?? 0)
//         : price * qtyFinal;

//     return ModelFIFOLogic(
//       qty: qtyFinal,
//       price: price,
//       batch: batches,
//       subTotal: subTotal,
//     );
//   }

//   double _totalQty(List<ModelItemOrderedBatch> batches) {
//     return batches.fold(0.0, (sum, e) => sum + e.getqty_item);
//   }

//   void _allocateFIFO({
//     required List<ModelItemOrderedBatch> usedBatches,
//     required List<ModelItemBatch> stockBatches,
//     required String idItem,
//     required String invoice,
//     required double qtyNeed,
//     required String id_ordered,
//     double? price,
//   }) {
//     final customPriceState = (state as TransactionLoaded).customPrice;
//     double need = qtyNeed;

//     final fifo =
//         stockBatches
//             .where(
//               (e) =>
//                   e.getidItem == idItem && e.getqtyItem_in > e.getqtyItem_out,
//             )
//             .toList()
//           ..sort((a, b) => a.getdateBuy.compareTo(b.getdateBuy));

//     for (final batch in fifo) {
//       if (need <= 0) break;

//       final usedQtyInOrder = usedBatches
//           .where((e) => e.getid_Ordered == batch.getidOrdered)
//           .fold(
//             0.0,
//             (previousValue, element) => previousValue + element.getqty_item,
//           );

//       final globalUsed = _getGlobalUsedQty(
//         idItem,
//         id_ordered,
//         batch.getidOrdered,
//       );

//       final available =
//           batch.getqtyItem_in -
//           batch.getqtyItem_out -
//           usedQtyInOrder -
//           globalUsed;

//       if (available <= 0) continue;

//       final take = available >= need ? need : available;

//       usedBatches.add(
//         ModelItemOrderedBatch(
//           id_ordered: batch.getidOrdered,
//           id_item: idItem,
//           invoice: invoice,
//           qty_item: take,
//           price_item: price != null && price != 0
//               ? price
//               : customPriceState != 0 && price == null
//               ? customPriceState
//               : batch.getpriceItemFinal,
//         ),
//       );

//       need -= take;
//     }
//   }

//   void _releaseFIFO({
//     required List<ModelItemOrderedBatch> usedBatches,
//     required double qtyRelease,
//   }) {
//     final totalQty = _totalQty(usedBatches);
//     if (totalQty <= 1) return;

//     double release = qtyRelease;

//     for (int i = usedBatches.length - 1; i >= 0; i--) {
//       if (release <= 0) break;

//       final batch = usedBatches[i];

//       if (batch.getqty_item <= release) {
//         release -= batch.getqty_item.toInt();
//         usedBatches.removeAt(i);
//       } else {
//         usedBatches[i] = ModelItemOrderedBatch(
//           id_ordered: batch.getid_Ordered,
//           id_item: batch.getid_Item,
//           invoice: batch.getinvoice,
//           qty_item: batch.getqty_item - release,
//           price_item: batch.getprice_item,
//         );
//         release = 0;
//       }
//     }
//   }

//   double _calculateSubTotalFromBatch(
//     List<ModelItemOrderedBatch> batches,
//     int discount,
//   ) {
//     final gross = batches.fold<double>(
//       0.0,
//       (sum, element) => sum + (element.getqty_item * element.getprice_item),
//     );

//     if (discount <= 0) return gross;

//     return gross - (gross * discount / 100);
//   }

//   double _getGlobalUsedQty(
//     String idItem,
//     String idOrdered,
//     String stockBatchId,
//   ) {
//     final currentState = state as TransactionLoaded;

//     return currentState.itemOrdered
//         .where((e) => e.getidItem == idItem)
//         .where((b) => b.getidOrdered != idOrdered)
//         .expand((e) => e.getitemOrderedBatch)
//         .where((batch) => batch.getid_Ordered == stockBatchId)
//         .fold(0.0, (sum, b) => sum + b.getqty_item);
//   }
