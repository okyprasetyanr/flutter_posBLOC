import 'package:equatable/equatable.dart';

class ModelItemOrderedBatch extends Equatable {
  final String _id_ordered;
  final String _id_item;
  final String _invoice;
  final double _qty_item;
  final double _price_item;
  final double _price_itemBuy;
  final bool _isNegative;

  ModelItemOrderedBatch({
    bool isNegative = false,
    required String id_ordered,
    required String id_item,
    required String invoice,
    required double qty_item,
    double price_itemBuy = 0,
    required double price_item,
  }) : _id_ordered = id_ordered,
       _id_item = id_item,
       _invoice = invoice,
       _qty_item = qty_item,
       _price_item = price_item,
       _price_itemBuy = price_itemBuy,
       _isNegative = isNegative;

  String get getid_Ordered => _id_ordered;
  String get getid_Item => _id_item;
  String get getinvoice => _invoice;
  double get getqty_item => _qty_item;
  double get getprice_item => _price_item;
  double get getprice_itemBuy => _price_itemBuy;
  bool get getisNegative => _isNegative;

  ModelItemOrderedBatch copyWith({
    String? id_ordered,
    String? id_item,
    String? invoice,
    double? qty_item,
    double? price_item,
    double? price_itemBuy,
    bool? isNegative,
  }) {
    return ModelItemOrderedBatch(
      isNegative: isNegative ?? this._isNegative,
      id_ordered: id_ordered ?? this._id_ordered,
      id_item: id_item ?? this._id_item,
      invoice: invoice ?? this._invoice,
      qty_item: qty_item ?? this._qty_item,
      price_item: price_item ?? this._price_item,
      price_itemBuy: price_itemBuy ?? this._price_itemBuy,
    );
  }

  @override
  List<Object?> get props => [
    _id_ordered,
    _id_item,
    _invoice,
    _qty_item,
    _price_item,
    _price_itemBuy,
    _isNegative,
  ];
}
