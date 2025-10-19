import 'package:equatable/equatable.dart';

class ModelItemOrdered extends Equatable {
  final String _nameItem,
      _idBranch,
      _idItem,
      _idOrdered,
      _idCategoryItem,
      _idCondimen,
      _note,
      _urlImage;
  final String? _nameCustomer, _idCustomer;
  final int _discountItem;
  final double _qtyItem, _priceItem, _subTotal, _priceItemCustom;
  final List<ModelItemOrdered> _condiment;

  ModelItemOrdered({
    required double priceItemCustom,
    required double subTotal,
    required String nameItem,
    required String idItem,
    required String? nameCustomer,
    required String? idCustomer,
    required String idBranch,
    required String idOrdered,
    required double qtyItem,
    required double priceItem,
    required int discountItem,
    required String idCategoryItem,
    required String idCondiment,
    required String note,
    required String urlImage,
    required List<ModelItemOrdered> condiment,
  }) : _nameItem = nameItem,
       _idItem = idItem,
       _idCustomer = idCustomer,
       _nameCustomer = nameCustomer,
       _subTotal = subTotal,
       _idBranch = idBranch,
       _idOrdered = idOrdered,
       _qtyItem = qtyItem,
       _priceItem = priceItem,
       _discountItem = discountItem,
       _idCategoryItem = idCategoryItem,
       _idCondimen = idCondiment,
       _note = note,
       _urlImage = urlImage,
       _condiment = condiment,
       _priceItemCustom = priceItemCustom;

  String get getnameItem => _nameItem;
  String get getidItem => _idItem;
  String? get getnameCustomer => _nameCustomer;
  String? get getidCustomer => _idCustomer;
  String get getidBranch => _idBranch;
  String get getidOrdered => _idOrdered;
  double get getsubTotal => _subTotal;
  double get getqtyItem => _qtyItem;
  double get getpriceItem => _priceItem;
  double get getpriceItemCustom => _priceItemCustom;
  int get getdiscountItem => _discountItem;
  String get getidCategoryItem => _idCategoryItem;
  String get getidCondimen => _idCondimen;
  String get getNote => _note;
  String get geturlImage => _urlImage;
  List<ModelItemOrdered> get getCondiment => _condiment;

  ModelItemOrdered copyWith({
    String? nameItem,
    String? idItem,
    String? idCustomer,
    String? nameCustomer,
    String? idBranch,
    String? idOrdered,
    double? qtyItem,
    double? priceItem,
    double? priceItemCustom,
    int? dicountItem,
    String? idCategoryItem,
    String? idCondimen,
    String? note,
    String? urlImage,
    double? subTotal,
    List<ModelItemOrdered>? condiment,
  }) {
    return ModelItemOrdered(
      idCustomer: idCustomer ?? _idCustomer,
      nameCustomer: nameCustomer ?? _nameCustomer,
      subTotal: subTotal ?? _subTotal,
      nameItem: nameItem ?? _nameItem,
      idItem: idItem ?? _idItem,
      idBranch: idBranch ?? _idBranch,
      idOrdered: idOrdered ?? _idOrdered,
      qtyItem: qtyItem ?? _qtyItem,
      priceItemCustom: priceItemCustom ?? _priceItemCustom,
      priceItem: priceItem ?? _priceItem,
      discountItem: dicountItem ?? _discountItem,
      idCategoryItem: idCategoryItem ?? _idCategoryItem,
      idCondiment: idCondimen ?? _idCondimen,
      note: note ?? _note,
      urlImage: urlImage ?? _urlImage,
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
    _priceItemCustom,
    _discountItem,
    _idCategoryItem,
    _idCondimen,
    _note,
    _urlImage,
    _qtyItem,
    _condiment,
    _subTotal,
  ];
}
