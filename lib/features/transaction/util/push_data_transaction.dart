import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/features/transaction/model/model_transaction.dart';
import 'package:flutter_pos/features/transaction/util/commit_stock_from_ordered.dart';
import 'package:flutter_pos/features/transaction/util/push_data_batch.dart';
import 'package:flutter_pos/features/transaction/util/revert_fifo_stock.dart';
import 'package:flutter_pos/features/transaction/util/update_existing_batch.dart';
import 'package:flutter_pos/core/data_user/isar/action/check/check_data_isar_all.dart';
import 'package:flutter_pos/core/data_user/isar/action/get/get_data_isar_by.dart';
import 'package:flutter_pos/core/data_user/isar/action/save/save_update_data_isar.dart';
import 'package:flutter_pos/shared/helper/from_and_to_map/convert_to_map.dart';
import 'package:flutter_pos/shared/helper/from_and_to_map/from_isar.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';

Future<void> pushDataTransaction({
  required ModelTransaction data,
  bool? statusRemove,
  required bool isSell,
}) async {
  final dataBatch = await getBatchIsarRaw(data.getidBranch);
  final remove = statusRemove ?? false;
  final transRef = FirebaseFirestore.instance
      .collection(isSell ? "transaction_sell" : "transaction_buy")
      .doc(data.getinvoice);

  if (remove) {
    if (UserSession.getStatusFifo() && isSell) {
      revertFIFOStock(itemsOrdered: data.getitemsOrdered, dataBatch: dataBatch);
      await updateExistingBatch(dataBatch, data.getinvoice);
    }
    transRef.set({
      'status_transaction': data.getstatusTransaction!.name,
    }, SetOptions(merge: true));
  } else {
    if (!isSell) {
      await pushDataBatch(data: data);
    } else {
      if (UserSession.getStatusFifo()) {
        await commitStockFromOrderedBatch(
          data: data,
          dataBatch: await fromIsarBatchToList(dataBatch),
        );
      }
    }

    final dataTransaction = await checkTransactionById_Isar(
      data.getinvoice,
      isSell: isSell,
    );

    final transaction = ModelTransaction(
      statusTransaction: data.getstatusTransaction,
      idBranch: data.getidBranch,
      date: data.getdate,
      note: data.getnote,
      invoice: data.getinvoice,
      namePartner: data.getnamePartner,
      idPartner: data.getidPartner,
      nameOperator: data.getnameOperator,
      idOperator: data.getidOperator,
      paymentMethod: data.getpaymentMethod,
      discount: data.getdiscount,
      ppn: data.getppn,
      totalItem: data.gettotalItem,
      charge: data.getcharge,
      subTotal: data.getsubTotal,
      billPaid: data.getbillPaid,
      totalCharge: data.gettotalCharge,
      totalPpn: data.gettotalPpn,
      totalDiscount: data.gettotalDiscount,
      total: data.gettotal,
      itemsOrdered: [],
      dataSplit: [],
    );

    ModelTransaction? finaldataTransaction = null;

    dataTransaction != null
        ? finaldataTransaction = dataTransaction.copyWith(
            itemsOrdered: data.getitemsOrdered,
            dataSplit: data.getdataSplit,
            statusTransaction: data.getstatusTransaction,
          )
        : finaldataTransaction = transaction.copyWith(
            itemsOrdered: data.getitemsOrdered,
            dataSplit: data.getdataSplit,
            statusTransaction: data.getstatusTransaction,
          );

    devLog("Log ModelTransaction: Cek Transaksi: $dataTransaction");

    isSell
        ? await saveTransactionSell_Isar(finaldataTransaction)
        : await saveTransactionBuy_Isar(finaldataTransaction);

    final writeBatch = FirebaseFirestore.instance.batch();
    writeBatch.set(transRef, convertToMapTransaction(transaction));

    final itemsRef = transRef.collection("items_ordered");

    for (final itemOrdered in data.getitemsOrdered) {
      final itemIdOrdered = itemsRef.doc(itemOrdered.getidOrdered);
      final condimentRef = itemIdOrdered.collection("condiment");
      final itemOrderedBatchRef = itemIdOrdered.collection(
        "item_ordered_batch",
      );
      for (final itemBatch in itemOrdered.getitemOrderedBatch) {
        devLog(
          "Log ModelTransaction: PushData: Check ItemOrderedBatch: ${itemBatch.getid_Ordered}",
        );
        final itemIdOrderedBatch = itemOrderedBatchRef.doc(
          itemBatch.getid_Ordered,
        );

        writeBatch.set(
          itemIdOrderedBatch,
          convertToMapItemOrderedBatch(itemBatch),
        );
      }

      for (final condimentOrdered in itemOrdered.getCondiment) {
        final condimentIdOrdered = condimentRef.doc(
          condimentOrdered.getidOrdered,
        );
        writeBatch.set(
          condimentIdOrdered,
          convertToMapItemOrdered(condimentOrdered),
        );
      }
      writeBatch.set(itemIdOrdered, convertToMapItemOrdered(itemOrdered));
    }

    final splitRef = transRef.collection("data_split");
    int inc = 0;
    for (final split in data.getdataSplit) {
      final idInc = splitRef.doc("${inc++}");
      writeBatch.set(idInc, convertToMapSplit(split));
    }
    await writeBatch.commit();
  }
}
