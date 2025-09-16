import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_cabang.dart';

class InventoryRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<ModelCabang>> ambilCabang() async {
    final data = await _db
        .collection("users")
        .doc(UserSession.ambilUidUser())
        .get();
    return ModelCabang.getDataListCabang(data);
  }
}
