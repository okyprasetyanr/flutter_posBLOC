import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class DataUserRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<ModelBranch>> getBranch() async {
    final data = await _db
        .collection('users')
        .doc(UserSession.ambilUidUser())
        .get();
    return ModelBranch.getDataListCabang(data);
  }

  Future<List<ModelItem>> getItem() async {
    final data = await _db
        .collection("items")
        .where('uid_user', isEqualTo: UserSession.uidUser)
        .get();
    return ModelItem.getDataListItem(data);
  }

  Future<List<ModelCategory>> getCategory() async {
    final data = await _db
        .collection("kategori")
        .where('uid_user', isEqualTo: UserSession.uidUser)
        .get();

    return ModelCategory.getDataListKategori(data);
  }

  Future<List<ModelPartner>> getPartner() async {
    final data = await _db
        .collection("partner")
        .where('uid_user', isEqualTo: UserSession.uidUser)
        .get();

    return ModelPartner.getDataListPartner(data);
  }

  Future<List<ModelTransaction>> getTransaction() async {
    final data = await _db
        .collection("transaction")
        .where('uid_user', isEqualTo: UserSession.uidUser)
        .get();

    return ModelTransaction.getDataListTansaction(data);
  }
}
