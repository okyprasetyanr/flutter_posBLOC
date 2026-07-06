import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/core/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/core/service/isar_service.dart';

Future<void> updateExistingBatch(
  List<ModelBatchIsar> dataBatch,
  String invoice,
) async {
  final batchRef = FirebaseFirestore.instance.collection("batch").doc(invoice);
  final writeBatch = FirebaseFirestore.instance.batch();

  await isar.writeTxn(() async {
    for (final batch in dataBatch) {
      if (batch.invoice != invoice) continue;

      for (final item in batch.itemsBatch) {
        final itemDoc = batchRef.collection("items_batch").doc(item.idOrdered);

        writeBatch.update(itemDoc, {"qty_item_out": item.qtyItem_out});
      }

      await isar.modelBatchIsars.put(batch);
    }
  });

  await writeBatch.commit();
}
