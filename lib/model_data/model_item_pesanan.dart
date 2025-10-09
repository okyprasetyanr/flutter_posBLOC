class ModelItemPesanan {
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

  set setnamaItem(String value) => _namaItem;
  set setidItem(String value) => _idItem;
  set idCabang(String value) => _idCabang;
  set setidPesanan(String value) => _idPesanan;
  set setqtyItem(double value) => _qtyItem;
  set sethargaItem(String value) => _hargaItem;
  set setdiskonItem(String value) => _diskonItem;
  set setidKategoriItem(String value) => _idKategoriItem;
  set setidCondimen(String value) => _idCondimen;
  set setcatatan(String value) => _catatan;
  set seturlGambar(String value) => _urlGambar;
  set setCondiment(List<ModelItemPesanan> value) => _condiment;
}
