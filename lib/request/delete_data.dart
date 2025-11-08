import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteDataPartner(String id) async {
  await FirebaseFirestore.instance.collection('partner').doc(id).delete();
}

Future<void> deleteDataCategory(String id) async {
  await FirebaseFirestore.instance.collection('kategori').doc(id).delete();
}

Future<void> deleteDataitem(String id) async {
  await FirebaseFirestore.instance.collection('item').doc(id).delete();
}
