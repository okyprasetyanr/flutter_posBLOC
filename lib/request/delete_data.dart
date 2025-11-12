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
