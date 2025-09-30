import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_cabang.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';

class DataUserRepository {
  final _db = FirebaseFirestore.instance;
  Future<List<ModelCabang>> ambilCabang() async {
    final data = await _db
        .collection("users")
        .doc(UserSession.ambilUidUser())
        .get();
    return ModelCabang.getDataListCabang(data);
  }

  Future<List<ModelItem>> ambilItem() async {
    final data = await _db
        .collection("items")
        .where("uid_user", isEqualTo: UserSession.uidUser)
        .get();
    return ModelItem.getDataListItem(data);
  }

  Future<List<ModelKategori>> ambilKategori() async {
    final data = await _db
        .collection("kategori")
        .where("uid_user", isEqualTo: UserSession.uidUser)
        .get();

    return ModelKategori.getDataListKategori(data);
  }
}
