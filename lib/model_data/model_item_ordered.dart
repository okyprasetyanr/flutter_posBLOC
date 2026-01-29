import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_item_ordered_batch.dart';

class ModelItemOrdered extends Equatable {
  final String _nameItem,
      _idBranch,
      _idItem,
      _idOrdered,
      _idCategoryItem,
      _note;
  final String? _invoice;
  final int _discountItem;
  final double _qtyItem, _priceItem, _subTotal, _priceItemFinal, _priceItemBuy;
  final List<ModelItemOrderedBatch> _itemOrderedBatch;
  final List<ModelItemOrdered> _condiment;

  final DateTime? _dateBuy, _expiredDate;

  ModelItemOrdered({
    DateTime? dateBuy,
    DateTime? expiredDate,
    String? invoice,
    required double priceItemFinal,
    required double subTotal,
    required String nameItem,
    required String idItem,
    required String idBranch,
    required String idOrdered,
    required double qtyItem,
    required double priceItem,
    double priceItemBuy = 0,
    required int discountItem,
    required String idCategoryItem,
    required String note,
    required List<ModelItemOrderedBatch> itemOrderedBatch,
    required List<ModelItemOrdered> condiment,
  }) : _nameItem = nameItem,
       _idItem = idItem,
       _subTotal = subTotal,
       _idBranch = idBranch,
       _idOrdered = idOrdered,
       _qtyItem = qtyItem,
       _priceItem = priceItem,
       _priceItemBuy = priceItemBuy,
       _discountItem = discountItem,
       _idCategoryItem = idCategoryItem,
       _note = note,
       _condiment = condiment,
       _priceItemFinal = priceItemFinal,
       _dateBuy = dateBuy,
       _expiredDate = expiredDate,
       _invoice = invoice,
       _itemOrderedBatch = itemOrderedBatch;

  String get getnameItem => _nameItem;
  String get getidItem => _idItem;
  String get getidBranch => _idBranch;
  String get getidOrdered => _idOrdered;
  double get getsubTotal => _subTotal;
  double get getqtyItem => _qtyItem;
  double get getpriceItem => _priceItem;
  double get getpriceItemFinal => _priceItemFinal;
  int get getdiscountItem => _discountItem;
  String get getidCategoryItem => _idCategoryItem;
  String get getNote => _note;
  List<ModelItemOrdered> get getCondiment => _condiment;
  List<ModelItemOrderedBatch> get getitemOrderedBatch => _itemOrderedBatch;
  DateTime? get getdateBuy => _dateBuy;
  DateTime? get getexpiredDate => _expiredDate;
  String? get getinvoice => _invoice;
  double get getpriceItemBuy => _priceItemBuy;

  ModelItemOrdered copyWith({
    String? invoice,
    DateTime? dateBuy,
    DateTime? expiredDate,
    String? nameItem,
    String? idItem,
    String? idBranch,
    String? idOrdered,
    double? qtyItem,
    double? priceItem,
    double? priceItemBuy,
    double? priceItemFinal,
    int? dicountItem,
    String? idCategoryItem,
    String? note,
    double? subTotal,
    List<ModelItemOrdered>? condiment,
    List<ModelItemOrderedBatch>? itemOrderedBatch,
  }) {
    return ModelItemOrdered(
      priceItemBuy: priceItemBuy ?? _priceItemBuy,
      itemOrderedBatch: itemOrderedBatch ?? _itemOrderedBatch,
      invoice: invoice,
      dateBuy: dateBuy,
      expiredDate: expiredDate ?? _expiredDate,
      subTotal: subTotal ?? _subTotal,
      nameItem: nameItem ?? _nameItem,
      idItem: idItem ?? _idItem,
      idBranch: idBranch ?? _idBranch,
      idOrdered: idOrdered ?? _idOrdered,
      qtyItem: qtyItem ?? _qtyItem,
      priceItemFinal: priceItemFinal ?? _priceItemFinal,
      priceItem: priceItem ?? _priceItem,
      discountItem: dicountItem ?? _discountItem,
      idCategoryItem: idCategoryItem ?? _idCategoryItem,
      note: note ?? _note,
      condiment: condiment ?? _condiment,
    );
  }

  @override
  List<Object?> get props => [
    _invoice,
    _dateBuy,
    _expiredDate,
    _priceItemFinal,
    _subTotal,
    _nameItem,
    _idItem,
    _idBranch,
    _idOrdered,
    _qtyItem,
    _priceItem,
    _priceItemBuy,
    _discountItem,
    _idCategoryItem,
    _note,
    _condiment,
    _itemOrderedBatch,
  ];
}
