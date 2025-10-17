import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_category.dart';

class DataUserRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<ModelCabang>> getBranch() async {
    final data = await _db
        .collection("users")
        .doc(UserSession.ambilUidUser())
        .get();
    return ModelCabang.getDataListCabang(data);
  }

  Future<List<ModelItem>> getItem() async {
    final data = await _db
        .collection("items")
        .where("uid_user", isEqualTo: UserSession.uidUser)
        .get();
    return ModelItem.getDataListItem(data);
  }

  Future<List<ModelKategori>> getCategory() async {
    final data = await _db
        .collection("kategori")
        .where("uid_user", isEqualTo: UserSession.uidUser)
        .get();

    return ModelKategori.getDataListKategori(data);
  }
}
