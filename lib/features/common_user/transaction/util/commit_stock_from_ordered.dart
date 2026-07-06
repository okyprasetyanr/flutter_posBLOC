import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/features/common_user/transaction/domain/model/model_transaction.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_by.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/from_and_to_map/convert_to_isar.dart';
import 'package:flutter_pos/from_and_to_map/from_isar.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/service/isar_service.dart';

Future<void> commitStockFromOrderedBatch({
  required ModelTransaction data,
  required List<ModelBatch> dataBatch,
}) async {
  final firestore = FirebaseFirestore.instance;
  final batchWrite = firestore.batch();

  final allOrderedBatch = data.getitemsOrdered
      .expand((e) => e.getitemOrderedBatch)
      .toList();

  final List<ModelBatchIsar> updatedIsarBatch = [];

  for (final orderedBatch in allOrderedBatch) {
    final batchIndex = dataBatch.indexWhere(
      (b) => b.getitems_batch.any(
        (x) =>
            x.getidOrdered == orderedBatch.getid_Ordered &&
            x.getidItem == orderedBatch.getid_Item,
      ),
    );

    if (batchIndex == -1) continue;

    final itemIndex = dataBatch[batchIndex].getitems_batch.indexWhere(
      (x) =>
          x.getidOrdered == orderedBatch.getid_Ordered &&
          x.getidItem == orderedBatch.getid_Item,
    );

    if (itemIndex == -1) continue;

    final old = dataBatch[batchIndex].getitems_batch[itemIndex];

    final updated = old.copyWith(
      qtyItem_out: old.getqtyItem_out + orderedBatch.getqty_item,
    );

    final newItems = List<ModelItemBatch>.from(
      dataBatch[batchIndex].getitems_batch,
    );

    newItems[itemIndex] = updated;

    final newBatch = dataBatch[batchIndex].copyWith(items_batch: newItems);

    dataBatch[batchIndex] = newBatch;

    final docRef = firestore
        .collection("batch")
        .doc(updated.getinvoice)
        .collection("items_batch")
        .doc(updated.getidOrdered);

    batchWrite.update(docRef, {'qty_item_out': updated.getqtyItem_out});

    var batchIsarIndex = updatedIsarBatch.indexWhere(
      (e) => e.invoice == updated.getinvoice,
    );

    ModelBatchIsar batchIsar;

    if (batchIsarIndex == -1) {
      batchIsar = await getBatchIsarByInvoice(updated.getinvoice);
      updatedIsarBatch.add(batchIsar);
    } else {
      batchIsar = updatedIsarBatch[batchIsarIndex];
    }

    final items = fromIsarBatch(batchIsar).getitems_batch;

    final index = items.indexWhere(
      (e) => e.getidOrdered == updated.getidOrdered,
    );

    if (index != -1) {
      items[index] = items[index].copyWith(qtyItem_out: updated.getqtyItem_out);
    }

    batchIsar.itemsBatch = items.map((e) => convertItemBatch(e)).toList();
  }

  await isar.writeTxn(() async {
    await isar.modelBatchIsars.putAll(updatedIsarBatch);
  });

  await batchWrite.commit();
}
