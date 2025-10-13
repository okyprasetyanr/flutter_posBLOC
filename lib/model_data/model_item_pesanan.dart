import 'package:equatable/equatable.dart';

class ModelItemPesanan extends Equatable {
  final String _namaItem,
      _idCabang,
      _idItem,
      _idPesanan,
      _hargaItem,
      _diskonItem,
      _idKategoriItem,
      _idCondimen,
      _catatan,
      _urlGambar;
  final double _qtyItem;
  final List<ModelItemPesanan> _condiment;

  ModelItemPesanan({
    required String namaItem,
    required String idItem,
    required String idCabang,
    required String idPesanan,
    required double qtyItem,
    required String hargaItem,
    required String diskonItem,
    required String idKategoriItem,
    required String idCondimen,
    required String catatan,
    required String urlGambar,
    required List<ModelItemPesanan> condiment,
  }) : _namaItem = namaItem,
       _idItem = idItem,
       _idCabang = idCabang,
       _idPesanan = idPesanan,
       _qtyItem = qtyItem,
       _hargaItem = hargaItem,
       _diskonItem = diskonItem,
       _idKategoriItem = idKategoriItem,
       _idCondimen = idCondimen,
       _catatan = catatan,
       _urlGambar = urlGambar,
       _condiment = condiment;

  String get getnamaItem => _namaItem;
  String get getidItem => _idItem;
  String get getidCabang => _idCabang;
  String get getidPesanan => _idPesanan;
  double get getqtyItem => _qtyItem;
  String get gethargaItem => _hargaItem;
  String get getdiskonItem => _diskonItem;
  String get getidKategoriItem => _idKategoriItem;
  String get getidCondimen => _idCondimen;
  String get getcatatan => _catatan;
  String get geturlGambar => _urlGambar;
  List<ModelItemPesanan> get getCondiment => _condiment;

  ModelItemPesanan copyWith({
    String? namaItem,
    String? idItem,
    String? idCabang,
    String? idPesanan,
    double? qtyItem,
    String? hargaItem,
    String? diskonItem,
    String? idKategoriItem,
    String? idCondimen,
    String? catatan,
    String? urlGambar,
    List<ModelItemPesanan>? condiment,
  }) {
    return ModelItemPesanan(
      namaItem: namaItem ?? _namaItem,
      idItem: idItem ?? _idItem,
      idCabang: idCabang ?? _idCabang,
      idPesanan: idPesanan ?? _idPesanan,
      qtyItem: qtyItem ?? _qtyItem,
      hargaItem: hargaItem ?? _hargaItem,
      diskonItem: diskonItem ?? _diskonItem,
      idKategoriItem: idKategoriItem ?? _idKategoriItem,
      idCondimen: idCondimen ?? _idCondimen,
      catatan: catatan ?? _catatan,
      urlGambar: urlGambar ?? _urlGambar,
      condiment: condiment ?? _condiment,
    );
  }

  @override
  List<Object?> get props => [
    _namaItem,
    _idCabang,
    _idItem,
    _idPesanan,
    _hargaItem,
    _diskonItem,
    _idKategoriItem,
    _idCondimen,
    _catatan,
    _urlGambar,
    _qtyItem,
    _condiment,
  ];
}
