import 'package:equatable/equatable.dart';

class ModelItemBatch extends Equatable {
  final String _nameItem,
      _idBranch,
      _idItem,
      _idOrdered,
      _idCategoryItem,
      _note,
      _date_buy,
      _invoice;
  final String? _expiredDate;
  final int _discountItem;
  final double _qtyItem_in,
      _priceItem,
      _subTotal,
      _priceItemFinal,
      _qtyItem_out;

  ModelItemBatch({
    required String invoice,
    required String nameItem,
    required String idBranch,
    required String idItem,
    required String idOrdered,
    required String idCategoryItem,
    required String note,
    required String date_buy,
    required String? expiredDate,
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
       _invoice = invoice;

  String get getinvoice => _invoice;
  String get getnameItem => _nameItem;
  String get getidBranch => _idBranch;
  String get getidItem => _idItem;
  String get getidOrdered => _idOrdered;
  String get getidCategoryItem => _idCategoryItem;
  String get getnote => _note;
  String get getdateBuy => _date_buy;
  String? get getexpiredDate => _expiredDate;
  int get getdiscountItem => _discountItem;
  double get getqtyItem_in => _qtyItem_in;
  double get getqtyItem_out => _qtyItem_out;
  double get getpriceItem => _priceItem;
  double get getsubTotal => _subTotal;
  double get getpriceItemFinal => _priceItemFinal;

  ModelItemBatch copyWith({
    String? invoice,
    String? nameItem,
    String? idBranch,
    String? idItem,
    String? idOrdered,
    String? idCategoryItem,
    String? note,
    String? date_buy,
    String? expiredDate,
    int? discountItem,
    double? qtyItem_in,
    double? qtyItem_out,
    double? priceItem,
    double? subTotal,
    double? priceItemFinal,
  }) {
    return ModelItemBatch(
      qtyItem_out: qtyItem_out??_qtyItem_out,
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

  static List<ModelItemBatch> fromMapItemsBatch(
    List<Map<String, dynamic>> data,
  ) {
    return data
        .map(
          (map) => ModelItemBatch(
            invoice: map['invoice'],
            nameItem: map['name_item'],
            idBranch: map['id_branch'],
            idItem: map['id_item'],
            idOrdered: map['id_ordered'],
            idCategoryItem: map['id_category_item'],
            note: map['note'],
            date_buy: map['date_buy'],
            expiredDate: map['expired_date'],
            discountItem: map['discount_item'],
            qtyItem_in: map['qty_item_in'],
            qtyItem_out: map['qty_item_out'],
            priceItem: map['price_item'],
            subTotal: map['sub_total'],
            priceItemFinal: map['price_item_final'],
          ),
        )
        .toList();
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
    _subTotal,
    _priceItemFinal,
  ];
}
