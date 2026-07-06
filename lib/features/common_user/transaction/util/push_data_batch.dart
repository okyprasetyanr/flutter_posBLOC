import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/features/common_user/transaction/model/model_transaction.dart';
import 'package:flutter_pos/features/data_user/isar/action/save/save_update_data_isar.dart';
import 'package:flutter_pos/from_and_to_map/convert_to_map.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';

Future<void> pushDataBatch({required ModelTransaction data}) async {
  List<ModelItemBatch> convertToItemBatch = [];
  for (final itemordered in data.getitemsOrdered) {
    devLog("Log ModelTransaction: ${itemordered}");
    convertToItemBatch.add(
      ModelItemBatch(
        priceitemBuy: itemordered.getpriceItemBuy,
        qtyItem_out: 0,
        invoice: itemordered.getinvoice!,
        nameItem: itemordered.getnameItem,
        idBranch: itemordered.getidBranch,
        idItem: itemordered.getidItem,
        idOrdered: itemordered.getidOrdered,
        idCategoryItem: itemordered.getidCategoryItem,
        note: itemordered.getNote,
        date_buy: itemordered.getdateBuy!,
        expiredDate: itemordered.getexpiredDate,
        discountItem: itemordered.getdiscountItem,
        qtyItem_in: itemordered.getqtyItem,
        priceItem: itemordered.getpriceItem,
        subTotal: itemordered.getsubTotal,
        priceItemFinal: itemordered.getpriceItemFinal,
      ),
    );
  }

  final newBatch = ModelBatch(
    invoice: data.getinvoice,
    idBranch: data.getidBranch,
    date_buy: data.getdate,
    items_batch: convertToItemBatch,
  );

  final batchRef = FirebaseFirestore.instance
      .collection("batch")
      .doc(data.getinvoice);

  await batchRef.set(convertToMapBatch(newBatch));

  final itemsRef = batchRef.collection("items_batch");
  final writeBatch = FirebaseFirestore.instance.batch();

  for (final itemBatch in convertToItemBatch) {
    final itemDoc = itemsRef.doc(itemBatch.getidOrdered);
    writeBatch.set(itemDoc, convertToMapItemBatch(itemBatch, data.getinvoice));
  }

  await saveBatch_Isar(newBatch);

  await writeBatch.commit();
}
