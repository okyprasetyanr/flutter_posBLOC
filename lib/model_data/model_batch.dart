import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';

class ModelBatch extends Equatable {
  final String _invoice;
  final String _idBranch;
  final String _dateBuy;
  final List<ModelItemBatch> _itemsBatch;

  ModelBatch({
    required String invoice,
    required String idBranch,
    required String date_buy,
    required List<ModelItemBatch> items_batch,
  }) : _invoice = invoice,
       _idBranch = idBranch,
       _dateBuy = date_buy,
       _itemsBatch = items_batch;

  String get getinvoice => _invoice;
  String get getidBranch => _idBranch;
  String get getdate_buy => _dateBuy;
  List<ModelItemBatch> get getitems_batch => _itemsBatch;

  ModelBatch copyWith(
    String? invoice,
    String? idBranch,
    String? date_buy,
    List<ModelItemBatch>? items_batch,
  ) {
    return ModelBatch(
      invoice: invoice ?? _invoice,
      idBranch: idBranch ?? _idBranch,
      date_buy: date_buy ?? _dateBuy,
      items_batch: items_batch ?? _itemsBatch,
    );
  }

  static List<ModelBatch> getDataListBatch(QuerySnapshot data) {
    return data.docs.map((map) {
      final dataBatch = map.data() as Map<String, dynamic>;
      return ModelBatch(
        invoice: dataBatch['invoice'],
        idBranch: dataBatch['id_branch'],
        date_buy: dataBatch['date_buy'],
        items_batch: ModelItemBatch.fromMapItemsBatch(
          List<Map<String, dynamic>>.from(dataBatch['items_batch']),
        ),
      );
    }).toList();
  }

  @override
  List<Object?> get props => [_invoice, _idBranch, _dateBuy, _itemsBatch];
}

