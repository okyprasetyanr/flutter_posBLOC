import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ModelItemOrdered extends Equatable {
  final String _nameItem,
      _idBranch,
      _idItem,
      _idOrdered,
      _idCategoryItem,
      _idCondiment,
      _note;
  final int _discountItem;
  final double _qtyItem, _priceItem, _subTotal, _priceItemFinal;
  final List<ModelItemOrdered> _condiment;

  final String? _dateBuy, _expiredDate;

  ModelItemOrdered({
    String? dateBuy,
    String? expiredDate,
    required double priceItemFinal,
    required double subTotal,
    required String nameItem,
    required String idItem,
    required String idBranch,
    required String idOrdered,
    required double qtyItem,
    required double priceItem,
    required int discountItem,
    required String idCategoryItem,
    required String idCondiment,
    required String note,
    required List<ModelItemOrdered> condiment,
  }) : _nameItem = nameItem,
       _idItem = idItem,
       _subTotal = subTotal,
       _idBranch = idBranch,
       _idOrdered = idOrdered,
       _qtyItem = qtyItem,
       _priceItem = priceItem,
       _discountItem = discountItem,
       _idCategoryItem = idCategoryItem,
       _idCondiment = idCondiment,
       _note = note,
       _condiment = condiment,
       _priceItemFinal = priceItemFinal,
       _dateBuy = dateBuy,
       _expiredDate = expiredDate;

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
  String get getidCondiment => _idCondiment;
  String get getNote => _note;
  List<ModelItemOrdered> get getCondiment => _condiment;
  String? get getdateBuy => _dateBuy;
  String? get getexpiredDate => _expiredDate;

  ModelItemOrdered copyWith({
    String? dateBuy,
    String? expiredDate,
    String? nameItem,
    String? idItem,
    String? idBranch,
    String? idOrdered,
    double? qtyItem,
    double? priceItem,
    double? priceItemFinal,
    int? dicountItem,
    String? idCategoryItem,
    String? idCondimen,
    String? note,
    double? subTotal,
    List<ModelItemOrdered>? condiment,
  }) {
    return ModelItemOrdered(
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
      idCondiment: idCondimen ?? _idCondiment,
      note: note ?? _note,
      condiment: condiment ?? _condiment,
    );
  }

  factory ModelItemOrdered.fromMap(
    Map<String, dynamic> items,
    List<ModelItemOrdered> condiment,
    bool isCondiment,
    String id_ordered,
  ) {
    debugPrint("Log ModelData: Transaction ItemOrdered: ${items}");

    return ModelItemOrdered(
      dateBuy: items['date_buy'],
      expiredDate: items['expired_date'],
      priceItemFinal: double.tryParse(items['price_item_final'].toString())!,
      subTotal: double.tryParse(items['sub_total'].toString())!,
      nameItem: items['name_item'],
      idItem: items['id_item'],
      idBranch: items['id_branch'],
      idOrdered: id_ordered,
      qtyItem: double.tryParse(items['qty_item'].toString())!,
      priceItem: double.tryParse(items['price_item'].toString())!,
      discountItem: int.tryParse(items['discount_item'].toString())!,
      idCategoryItem: items['id_category_item'],
      idCondiment: items['id_condiment'],
      note: items['note'],
      condiment: isCondiment ? [] : condiment,
    );
  }

  @override
  List<Object?> get props => [
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
    _discountItem,
    _idCategoryItem,
    _idCondiment,
    _note,
    _condiment,
  ];
}
