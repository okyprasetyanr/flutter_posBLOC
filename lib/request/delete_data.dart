import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

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
  await FirebaseFirestore.instance.collection('operator').doc(id).delete();
}

Future<void> deleteDataTransaction(String id) async {
  debugPrint("Log DeleteData: Operator: $id");
  await FirebaseFirestore.instance
      .collection('transaction_sell')
      .doc(id)
      .delete();
}
