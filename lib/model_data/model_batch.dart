import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';

class ModelBatch extends Equatable {
  final String _invoice;
  final String _idBranch;
  final DateTime _dateBuy;
  final List<ModelItemBatch> _itemsBatch;

  ModelBatch({
    required String invoice,
    required String idBranch,
    required DateTime date_buy,
    required List<ModelItemBatch> items_batch,
  }) : _invoice = invoice,
       _idBranch = idBranch,
       _dateBuy = date_buy,
       _itemsBatch = items_batch;

  String get getinvoice => _invoice;
  String get getidBranch => _idBranch;
  DateTime get getdate_buy => _dateBuy;
  List<ModelItemBatch> get getitems_batch => _itemsBatch;

  ModelBatch copyWith({
    String? invoice,
    String? idBranch,
    DateTime? date_buy,
    List<ModelItemBatch>? items_batch,
  }) {
    return ModelBatch(
      invoice: invoice ?? _invoice,
      idBranch: idBranch ?? _idBranch,
      date_buy: date_buy ?? _dateBuy,
      items_batch: items_batch ?? _itemsBatch,
    );
  }

  static Future<List<ModelBatch>> getDataListBatch(QuerySnapshot data) async {
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
          final itemData = itemDoc.data();

          return ModelItemBatch(
            invoice: itemDoc.id,
            idBranch: itemData['id_branch'],
            idItem: itemData['id_item'],
            idOrdered: itemDoc.id,
            nameItem: itemData['name_item'],
            idCategoryItem: itemData['id_category_item'],
            note: itemData['note'],
            date_buy: DateTime.parse(itemData['date_buy']),
            expiredDate: itemData['expired_date'],
            discountItem: itemData['discount_item'],
            qtyItem_in: itemData['qty_item_in'],
            qtyItem_out: itemData['qty_item_out'],
            priceItem: itemData['price_item'],
            subTotal: itemData['sub_total'],
            priceItemFinal: itemData['price_item_final'],
          );
        }).toList();

        return ModelBatch(
          invoice: map.id,
          idBranch: dataBatch['id_branch'],
          date_buy: dataBatch['date_buy'],
          items_batch: itemsBatch,
        );
      }).toList(),
    );
  }

  @override
  List<Object?> get props => [_invoice, _idBranch, _dateBuy, _itemsBatch];
}
