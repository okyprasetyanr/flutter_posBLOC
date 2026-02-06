// ModelFIFOLogic fifoLogic({
//   required TransactionLoaded state,
//   double? customPrice,
//   required ModelItemOrdered item,
//   bool? mode,
//   double? qty,
//   int? discount,
//   List<ModelItemOrdered>? simulatedItemOrdered,
//   double? secondCustomPrice,
// }) {
//   final isSell = state.isSell;
//   List<ModelItemOrderedBatch> batches = List.from(item.getitemOrderedBatch);
//   final fifoActive = UserSession.getStatusFifo();
//   final isFifo = fifoActive && isSell;
//   final batch = state.dataItemBatch!;

//   final customPriceState = customPrice == null
//       ? state.customPrice != 0
//             ? state.customPrice
//             : item.getpriceItemFinal
//       : customPrice;

//   final checkCustomPrice = customPriceState != item.getpriceItem;

//   if ((customPriceState != 0 && checkCustomPrice) ||
//       secondCustomPrice != null && secondCustomPrice != 0) {
//     if (isFifo) {
//       for (int i = 0; i < batches.length; i++) {
//         final b = batches[i];
//         batches[i] = ModelItemOrderedBatch(
//           price_itemBuy: isSell ? 0 : customPriceState,
//           id_ordered: b.getid_Ordered,
//           id_item: b.getid_Item,
//           invoice: b.getinvoice,
//           qty_item: b.getqty_item,
//           price_item: isSell
//               ? customPriceState
//               : secondCustomPrice != null && secondCustomPrice != 0
//               ? secondCustomPrice
//               : b.getprice_item,
//         );
//       }
//     } else {
//       if (batches.isNotEmpty) {
//         batches[0] = batches[0].copyWith(
//           price_item: isSell
//               ? customPrice
//               : secondCustomPrice != null && secondCustomPrice != 0
//               ? secondCustomPrice
//               : batches[0].getprice_item,
//           price_itemBuy: isSell ? batches[0].getprice_item : customPrice,
//         );
//       }
//     }
//   } else if (customPriceState == 0) {
//     if (isFifo) {
//       final qtyNow = _totalQty(batches);
//       batches.clear();
//       _allocateFIFO(
//         state: state,
//         currentListContext: simulatedItemOrdered,
//         id_ordered: item.getidOrdered,
//         usedBatches: batches,
//         stockBatches: batch,
//         idItem: item.getidItem,
//         invoice: item.getinvoice ?? '',
//         qtyNeed: qtyNow,
//         price: 0,
//       );
//     } else {
//       if (batches.isNotEmpty) {
//         batches[0] = batches[0].copyWith(
//           price_item: item.getpriceItem,
//           price_itemBuy: batches[0].getprice_itemBuy,
//         );
//       }
//     }
//   }

//   if (mode != null) {
//     if (mode) {
//       if (isFifo) {
//         _allocateFIFO(
//           state: state,
//           price: checkCustomPrice ? customPriceState : 0,
//           currentListContext: simulatedItemOrdered,
//           id_ordered: item.getidOrdered,
//           usedBatches: batches,
//           stockBatches: batch,
//           idItem: item.getidItem,
//           invoice: item.getinvoice ?? '',
//           qtyNeed: 1,
//         );
//         debugPrint(
//           "Log TransactionBloc: fifoLogic: price ${item.getpriceItem != item.getpriceItemFinal ? customPriceState : 0}",
//         );
//       } else {
//         if (batches.isEmpty) {
//           batches.add(
//             ModelItemOrderedBatch(
//               price_item: item.getpriceItem,
//               id_ordered: 'NON_FIFO',
//               id_item: item.getidItem,
//               invoice: item.getinvoice ?? '',
//               qty_item: 1,
//             ),
//           );
//         } else {
//           batches[0] = batches[0].copyWith(
//             qty_item: batches[0].getqty_item + 1,
//           );
//         }
//         debugPrint("Log TransactionBloc: Buy Add");
//       }
//     } else {
//       debugPrint("Log TransactionBloc: fifoLogic: checkFLow ${mode}");
//       if (batches.isNotEmpty) {
//         _releaseFIFO(usedBatches: batches, qtyRelease: 1);
//       }
//     }
//   }

//   //custom QTY
//   if (qty != null) {
//     if (isFifo) {
//       final diff = qty - _totalQty(batches).toInt();
//       if (diff > 0) {
//         _allocateFIFO(
//           state: state,
//           price: checkCustomPrice ? customPriceState : 0,
//           currentListContext: simulatedItemOrdered,
//           id_ordered: item.getidOrdered,
//           usedBatches: batches,
//           stockBatches: batch,
//           idItem: item.getidItem,
//           invoice: item.getinvoice ?? '',
//           qtyNeed: diff,
//         );
//       } else if (diff < 0) {
//         _releaseFIFO(usedBatches: batches, qtyRelease: diff.abs());
//       }
//     } else {
//       if (batches.isEmpty) {
//         batches.add(
//           ModelItemOrderedBatch(
//             price_item: batches.isNotEmpty
//                 ? batches.first.getprice_item
//                 : item.getpriceItemFinal,
//             id_ordered: 'NON_FIFO',
//             id_item: item.getidItem,
//             invoice: item.getinvoice ?? '',
//             qty_item: item.getqtyItem,
//           ),
//         );
//       } else {
//         batches[0] = batches[0].copyWith(qty_item: qty);
//       }
//     }
//   }

//   final qtyFinal = _totalQty(batches);

//   final price = batches.isNotEmpty
//       ? batches.first.getprice_item
//       : item.getpriceItemFinal;

//   double secondPrice = item.getpriceItemFinal;
//   if (secondCustomPrice != null) {
//     secondPrice = secondCustomPrice;
//   }
//   debugPrint(
//     "Log TransactionBloc: FifoLogic: qty: $qtyFinal, price: $price, secondPrice: $secondPrice",
//   );

//   final subTotal = isSell
//       ? _calculateSubTotalFromBatch(batches, discount ?? 0)
//       : price * qtyFinal;

//   return ModelFIFOLogic(
//     priceBuy: isSell ? secondPrice : price,
//     qty: qtyFinal,
//     price: isSell ? price : secondPrice,
//     batch: batches,
//     subTotal: subTotal,
//   );
// }
