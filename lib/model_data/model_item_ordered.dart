import 'package:equatable/equatable.dart';

class ModelItemPesanan extends Equatable {
  final String _namaItem,
      _idBranch,
      _idItem,
      _idOrdered,
      _idCategoryItem,
      _idCondimen,
      _note,
      _urlImage;

  final int _discountItem;
  final double _qtyItem, _priceItem, _subTotal;
  final List<ModelItemPesanan> _condiment;

  ModelItemPesanan({
    required double subTotal,
    required String namaItem,
    required String idItem,
    required String idCabang,
    required String idPesanan,
    required double qtyItem,
    required double hargaItem,
    required int diskonItem,
    required String idKategoriItem,
    required String idCondimen,
    required String catatan,
    required String urlGambar,
    required List<ModelItemPesanan> condiment,
  }) : _namaItem = namaItem,
       _idItem = idItem,
       _subTotal = subTotal,
       _idBranch = idCabang,
       _idOrdered = idPesanan,
       _qtyItem = qtyItem,
       _priceItem = hargaItem,
       _discountItem = diskonItem,
       _idCategoryItem = idKategoriItem,
       _idCondimen = idCondimen,
       _note = catatan,
       _urlImage = urlGambar,
       _condiment = condiment;

  String get getnameItem => _namaItem;
  String get getidItem => _idItem;
  String get getidBranch => _idBranch;
  String get getidOrdered => _idOrdered;
  double get getsubTotal => _subTotal;
  double get getqtyItem => _qtyItem;
  double get getpriceItem => _priceItem;
  int get getdiscountItem => _discountItem;
  String get getidCategoryItem => _idCategoryItem;
  String get getidCondimen => _idCondimen;
  String get getnote => _note;
  String get geturlImage => _urlImage;
  List<ModelItemPesanan> get getCondiment => _condiment;

  ModelItemPesanan copyWith({
    String? nameItem,
    String? idItem,
    String? idBranch,
    String? idOrdered,
    double? qtyItem,
    double? priceItem,
    int? dicountItem,
    String? idCategoryItem,
    String? idCondimen,
    String? note,
    String? urlImage,
    double? subTotal,
    List<ModelItemPesanan>? condiment,
  }) {
    return ModelItemPesanan(
      subTotal: subTotal ?? _subTotal,
      namaItem: nameItem ?? _namaItem,
      idItem: idItem ?? _idItem,
      idCabang: idBranch ?? _idBranch,
      idPesanan: idOrdered ?? _idOrdered,
      qtyItem: qtyItem ?? _qtyItem,
      hargaItem: priceItem ?? _priceItem,
      diskonItem: dicountItem ?? _discountItem,
      idKategoriItem: idCategoryItem ?? _idCategoryItem,
      idCondimen: idCondimen ?? _idCondimen,
      catatan: note ?? _note,
      urlGambar: urlImage ?? _urlImage,
      condiment: condiment ?? _condiment,
    );
  }

  @override
  List<Object?> get props => [
    _namaItem,
    _idBranch,
    _idItem,
    _idOrdered,
    _priceItem,
    _discountItem,
    _idCategoryItem,
    _idCondimen,
    _note,
    _urlImage,
    _qtyItem,
    _condiment,
  ];
}
