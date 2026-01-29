import 'package:equatable/equatable.dart';

class ModelItemBatch extends Equatable {
  final String _nameItem,
      _idBranch,
      _idItem,
      _idOrdered,
      _idCategoryItem,
      _note,
      _invoice;
  final DateTime _date_buy;
  final DateTime? _expiredDate;
  final int _discountItem;
  final double _qtyItem_in,
      _priceItem,
      _subTotal,
      _priceItemFinal,
      _qtyItem_out,
      _priceitemBuy;

  ModelItemBatch({
    required double priceitemBuy,
    required String invoice,
    required String nameItem,
    required String idBranch,
    required String idItem,
    required String idOrdered,
    required String idCategoryItem,
    required String note,
    required DateTime date_buy,
    required DateTime? expiredDate,
    required int discountItem,
    required double qtyItem_in,
    required double qtyItem_out,
    required double priceItem,
    required double subTotal,
    required double priceItemFinal,
  }) : _nameItem = nameItem,
       _idBranch = idBranch,
       _idItem = idItem,
       _idOrdered = idOrdered,
       _idCategoryItem = idCategoryItem,
       _note = note,
       _date_buy = date_buy,
       _expiredDate = expiredDate,
       _discountItem = discountItem,
       _qtyItem_in = qtyItem_in,
       _qtyItem_out = qtyItem_out,
       _priceItem = priceItem,
       _subTotal = subTotal,
       _priceItemFinal = priceItemFinal,
       _invoice = invoice,
       _priceitemBuy = priceitemBuy;

  String get getinvoice => _invoice;
  String get getnameItem => _nameItem;
  String get getidBranch => _idBranch;
  String get getidItem => _idItem;
  String get getidOrdered => _idOrdered;
  String get getidCategoryItem => _idCategoryItem;
  String get getnote => _note;
  DateTime get getdateBuy => _date_buy;
  DateTime? get getexpiredDate => _expiredDate;
  int get getdiscountItem => _discountItem;
  double get getqtyItem_in => _qtyItem_in;
  double get getqtyItem_out => _qtyItem_out;
  double get getpriceItem => _priceItem;
  double get getsubTotal => _subTotal;
  double get getpriceItemFinal => _priceItemFinal;
  double get getpriceItemBuy => _priceitemBuy;

  ModelItemBatch copyWith({
    String? invoice,
    String? nameItem,
    String? idBranch,
    String? idItem,
    String? idOrdered,
    String? idCategoryItem,
    String? note,
    DateTime? date_buy,
    DateTime? expiredDate,
    int? discountItem,
    double? qtyItem_in,
    double? qtyItem_out,
    double? priceItem,
    double? priceItemBuy,
    double? subTotal,
    double? priceItemFinal,
  }) {
    return ModelItemBatch(
      priceitemBuy: priceItemBuy ?? _priceitemBuy,
      qtyItem_out: qtyItem_out ?? _qtyItem_out,
      invoice: invoice ?? this._invoice,
      nameItem: nameItem ?? this._nameItem,
      idBranch: idBranch ?? this._idBranch,
      idItem: idItem ?? this._idItem,
      idOrdered: idOrdered ?? this._idOrdered,
      idCategoryItem: idCategoryItem ?? this._idCategoryItem,
      note: note ?? this._note,
      date_buy: date_buy ?? this._date_buy,
      expiredDate: expiredDate ?? this._expiredDate,
      discountItem: discountItem ?? this._discountItem,
      qtyItem_in: qtyItem_in ?? this._qtyItem_in,
      priceItem: priceItem ?? this._priceItem,
      subTotal: subTotal ?? this._subTotal,
      priceItemFinal: priceItemFinal ?? this._priceItemFinal,
    );
  }

  @override
  List<Object?> get props => [
    _invoice,
    _nameItem,
    _idBranch,
    _idItem,
    _idOrdered,
    _idCategoryItem,
    _note,
    _date_buy,
    _expiredDate,
    _discountItem,
    _qtyItem_out,
    _qtyItem_in,
    _priceItem,
    _priceitemBuy,
    _subTotal,
    _priceItemFinal,
  ];
}
