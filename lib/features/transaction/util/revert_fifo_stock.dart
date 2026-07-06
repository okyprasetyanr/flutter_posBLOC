import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/core/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/shared/helper/from_and_to_map/convert_to_isar.dart';
import 'package:flutter_pos/shared/helper/from_and_to_map/convert_to_map.dart';
import 'package:flutter_pos/shared/helper/from_and_to_map/from_isar.dart';
import 'package:flutter_pos/features/transaction/model/model_item_ordered.dart';
import 'package:flutter_pos/core/service/isar_service.dart';

Future<void> revertFIFOStock({
  required List<ModelItemOrdered> itemsOrdered,
  required List<ModelBatchIsar> dataBatch,
}) async {
  final batchWrite = FirebaseFirestore.instance.batch();
  for (final item in itemsOrdered) {
    for (final usedBatch in item.getitemOrderedBatch) {
      for (int i = 0; i < dataBatch.length; i++) {
        final itemBatch = dataBatch[i];

        final batchIndex = itemBatch.itemsBatch.indexWhere(
          (b) =>
              b.idItem == item.getidItem &&
              b.idOrdered == usedBatch.getid_Ordered,
        );

        if (batchIndex == -1) continue;

        final batch = itemBatch.itemsBatch[batchIndex];

        final newQtyOut = batch.qtyItem_out - usedBatch.getqty_item;

        itemBatch.itemsBatch[batchIndex] = convertItemBatch(
          fromIsarItemBatch(
            batch,
          ).copyWith(qtyItem_out: newQtyOut < 0 ? 0 : newQtyOut),
        );
        batchWrite.set(
          FirebaseFirestore.instance
              .collection(
                'batch/${itemBatch.itemsBatch[batchIndex].invoice}/items_batch',
              )
              .doc(itemBatch.itemsBatch[batchIndex].idOrdered),
          convertToMapItemBatch(
            fromIsarItemBatch(itemBatch.itemsBatch[batchIndex]),
            itemBatch.itemsBatch[batchIndex].invoice,
          ),
          SetOptions(merge: true),
        );

        break;
      }
    }
  }
  await isar.writeTxn(() async {
    await isar.modelBatchIsars.putAll(dataBatch);
  });
  await batchWrite.commit();
}
