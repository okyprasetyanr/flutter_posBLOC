import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';

Future<void> deleteDataPartner(String id) async {
  await FirebaseFirestore.instance.collection('partners').doc(id).delete();
}

Future<void> deleteDataCategory(String id) async {
  await FirebaseFirestore.instance.collection('category').doc(id).delete();
}

Future<void> deleteDataitem(String id) async {
  debugPrint("Log DeleteData: Item: $id");
  await FirebaseFirestore.instance.collection('items').doc(id).delete();
}

Future<void> deleteDataFinancial(String id) async {
  debugPrint("Log DeleteData: Financial: $id");
  await FirebaseFirestore.instance.collection('financial').doc(id).delete();
}

Future<void> deleteDataUser(String id) async {
  debugPrint("Log DeleteData: Operator: $id");
  await FirebaseFirestore.instance.collection('users').doc(id).delete();
}

Future<void> deleteDataBatch({
  required String invoice,
  required List<ModelItemBatch> itemBatch,
}) async {
  final batchRef = FirebaseFirestore.instance.collection('batch').doc(invoice);

  final writeBatch = FirebaseFirestore.instance.batch();

  for (final item in itemBatch) {
    final docRef = batchRef.collection('items_batch').doc(item.getidOrdered);
    writeBatch.delete(docRef);
  }

  writeBatch.delete(batchRef);

  await writeBatch.commit();
}

Future<void> deleteDataTransaction(
  String id,
  List<ModelItemOrdered> itemOrdered,
) async {
  debugPrint("Log DeleteData: Operator: $id");

  for (final item in itemOrdered) {
    for (final condiment in item.getCondiment) {
      await FirebaseFirestore.instance
          .collection('transaction_sell')
          .doc(id)
          .collection('items_ordered')
          .doc(condiment.getidOrdered)
          .collection('condiment')
          .doc(condiment.getidOrdered)
          .delete();
    }
    await FirebaseFirestore.instance
        .collection('transaction_sell')
        .doc(id)
        .collection('items_ordered')
        .doc(item.getidOrdered)
        .delete();
  }

  await FirebaseFirestore.instance
      .collection('transaction_sell')
      .doc(id)
      .delete();
}
