import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_counter.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/request/get_data.dart';

class DataUserRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<ModelBranch>> getBranch() async {
    final data = await _db
        .collection('companies')
        .doc(UserSession.getUidOwner())
        .get();
    return getDataListBranch(data);
  }

  Future<List<ModelFinancial>> getFinancial() async {
    final data = await _db
        .collection('financial')
        .where('uid_owner', isEqualTo: UserSession.uid_owner)
        .get();
    return getDataListFinancial(data);
  }

  Future<List<ModelTransactionFinancial>> getTransIncome() async {
    final data = await _db
        .collection('transaction_income')
        .where('uid_owner', isEqualTo: UserSession.uid_owner)
        .get();
    return getDataListTransFinancial(data);
  }

  Future<List<ModelUser>> getUser() async {
    final data = await _db
        .collection('users')
        .where('uid_owner', isEqualTo: UserSession.uid_owner)
        .get();
    return getDataListUser(data);
  }

  Future<List<ModelTransactionFinancial>> getTransExpense() async {
    final data = await _db
        .collection('transaction_expense')
        .where('uid_owner', isEqualTo: UserSession.uid_owner)
        .get();
    return getDataListTransFinancial(data);
  }

  Future<List<ModelItem>> getItem() async {
    final data = await _db
        .collection('items')
        .where('uid_owner', isEqualTo: UserSession.uid_owner)
        .get();
    return getDataListItem(data);
  }

  Future<List<ModelCategory>> getCategory() async {
    final data = await _db
        .collection('category')
        .where('uid_owner', isEqualTo: UserSession.uid_owner)
        .get();

    return getDataListCategory(data);
  }

  Future<List<ModelPartner>> getPartner() async {
    final data = await _db
        .collection('partners')
        .where('uid_owner', isEqualTo: UserSession.uid_owner)
        .get();

    return getDataListPartner(data);
  }

  Future<List<ModelTransaction>> getTransactionSell() async {
    final data = await _db
        .collection('transaction_sell')
        .where('uid_owner', isEqualTo: UserSession.uid_owner)
        .get();

    return await getDataListTransaction(data, isSell: true);
  }

  Future<List<ModelTransaction>> getTransactionBuy() async {
    final data = await _db
        .collection('transaction_buy')
        .where('uid_owner', isEqualTo: UserSession.uid_owner)
        .get();

    return await getDataListTransaction(data, isSell: false);
  }

  Future<List<ModelBatch>> getBatch() async {
    final data = await _db
        .collection('batch')
        .where('uid_owner', isEqualTo: UserSession.uid_owner)
        .get();

    return getDataListBatch(data);
  }

  Future<List<ModelCounter>> getCounter() async {
    final data = await _db
        .collection('counter')
        .doc(UserSession.uid_owner)
        .collection('branch')
        .get();

    return getDataCounter(data);
  }
}
