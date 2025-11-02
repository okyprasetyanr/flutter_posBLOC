import 'package:equatable/equatable.dart';

class ModelItemOrdered extends Equatable {
  final String _nameItem,
      _idBranch,
      _idItem,
      _idOrdered,
      _idCategoryItem,
      _idCondimen,
      _note;
  final int _discountItem;
  final double _qtyItem, _priceItem, _subTotal, _priceItemFinal;
  final List<ModelItemOrdered> _condiment;

  ModelItemOrdered({
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
       _idCondimen = idCondiment,
       _note = note,
       _condiment = condiment,
       _priceItemFinal = priceItemFinal;

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
  String get getidCondimen => _idCondimen;
  String get getNote => _note;
  List<ModelItemOrdered> get getCondiment => _condiment;

  ModelItemOrdered copyWith({
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
      idCondiment: idCondimen ?? _idCondimen,
      note: note ?? _note,
      condiment: condiment ?? _condiment,
    );
  }

  @override
  List<Object?> get props => [
    _nameItem,
    _idBranch,
    _idItem,
    _idOrdered,
    _priceItem,
    _priceItemFinal,
    _discountItem,
    _idCategoryItem,
    _idCondimen,
    _note,
    _qtyItem,
    _condiment,
    _subTotal,
  ];
}
