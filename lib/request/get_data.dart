import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/from_and_to_map/from_map.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_company.dart';
import 'package:flutter_pos/model_data/model_counter.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_split.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/model_data/model_user.dart';

List<ModelTransactionFinancial> getDataListTransFinancial(QuerySnapshot data) {
  return data.docs.map((map) {
    final dataFinancial = map.data() as Map<String, dynamic>;
    return fromMapTransFinancial(dataFinancial, map.id);
  }).toList();
}

List<ModelFinancial> getDataListFinancial(QuerySnapshot data) {
  return data.docs.map((map) {
    final dataFinancial = map.data() as Map<String, dynamic>;
    return fromMapFinancial(dataFinancial, map.id);
  }).toList();
}

List<ModelBranch> getDataListBranch(DocumentSnapshot data) {
  List listbranch = data['list_branch'] ?? const [];
  return listbranch.map((map) => fromMapBranch(map, data.id)).toList();
}

ModelCompany getDataCompany(DocumentSnapshot data) {
  final dataUser = data.data() as Map<String, dynamic>;
  return fromMapCompany(dataUser, data.id, dataList: data);
}

List<ModelCounter> getDataCounter(QuerySnapshot dataCounter) {
  return dataCounter.docs
      .map(
        (counter) =>
            fromMapCounter(counter.data() as Map<String, dynamic>, counter.id),
      )
      .toList();
}

Future<List<ModelBatch>> getDataListBatch(QuerySnapshot data) async {
  final firestore = FirebaseFirestore.instance;
  return await Future.wait(
    data.docs.map((map) async {
      final dataBatch = map.data() as Map<String, dynamic>;
      final itemsSnapshot = await firestore
          .collection('batch')
          .doc(map.id)
          .collection('items_batch')
          .get();

      final itemsBatch = itemsSnapshot.docs.map((itemDoc) {
        final data = itemDoc.data();
        return fromMapItembatch(data, itemDoc.id);
      }).toList();

      return fromMapBatch(dataBatch, map.id, dataList: itemsBatch);
    }).toList(),
  );
}

Future<List<ModelTransaction>> getDataListTransaction(
  QuerySnapshot data, {
  required bool isSell,
}) async {
  final firestore = FirebaseFirestore.instance;
  final String collection = isSell ? 'transaction_sell' : 'transaction_buy';

  return await Future.wait(
    data.docs.map((map) async {
      final dataTransaction = map.data() as Map<String, dynamic>;
      final itemsSnapshot = await firestore
          .collection(collection)
          .doc(map.id)
          .collection('items_ordered')
          .get();

      final itemsOrdered = await Future.wait(
        itemsSnapshot.docs.map((itemDoc) async {
          final condimentSnapshot = await firestore
              .collection(collection)
              .doc(map.id)
              .collection('items_ordered')
              .doc(itemDoc.id)
              .collection('condiment')
              .get();

          final condiments = condimentSnapshot.docs
              .map(
                (condimentDoc) => fromMapItemOrdered(
                  condimentDoc.data(),
                  [],
                  true,
                  condimentDoc.id,
                ),
              )
              .toList();

          return fromMapItemOrdered(
            itemDoc.data(),
            condiments,
            false,
            itemDoc.id,
          );
        }),
      );
      final splitSnapshot = await firestore
          .collection(collection)
          .doc(map.id)
          .collection('data_split')
          .get();

      final splitData = splitSnapshot.docs
          .map((splitDoc) => ModelSplit.fromMap(splitDoc.data()))
          .toList();

      return fromMapTransaction(
        dataTransaction,
        itemsOrdered,
        splitData,
        map.id,
      );
    }),
  );
}

List<ModelPartner> getDataListPartner(QuerySnapshot data) {
  return data.docs.map((map) {
    final dataPartner = map.data() as Map<String, dynamic>;
    return fromMapPartner(dataPartner, map.id);
  }).toList();
}

List<ModelUser> getDataListUser(QuerySnapshot<Map<String, dynamic>> data) {
  return data.docs
      .map((map) => fromMapUser(map.data() as Map<String, dynamic>, map.id))
      .toList();
}

List<ModelItem> getDataListItem(QuerySnapshot data) {
  return data.docs.map((map) {
    final dataItem = map.data() as Map<String, dynamic>;
    return fromMapItem(dataItem, map.id);
  }).toList();
}

List<ModelCategory> getDataListCategory(QuerySnapshot data) {
  return data.docs.map((map) {
    final dataCategory = map.data() as Map<String, dynamic>;
    return fromMapCategory(dataCategory, map.id);
  }).toList();
}
