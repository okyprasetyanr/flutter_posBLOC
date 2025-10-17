import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ModelItem extends Equatable {
  final String _uidUser,
      _nameItem,
      _idItem,
      _idCategoryItem,
      _urlImage,
      _idBranch,
      _dateItem,
      _barcode;
  final double _priceItem, _qtyItem;
  final bool _statusCondiment, _statusItem;

  ModelItem({
    required double qtyItem,
    required String uidUser,
    required String nameItem,
    required String idItem,
    required double priceItem,
    required String idCategoryItem,
    required bool statusCondiment,
    required String urlImage,
    required String idBranch,
    required String barcode,
    required bool statusItem,
    required String dateItem,
  }) : _uidUser = uidUser,
       _nameItem = nameItem,
       _idItem = idItem,
       _priceItem = priceItem,
       _idCategoryItem = idCategoryItem,
       _statusCondiment = statusCondiment,
       _urlImage = urlImage,
       _idBranch = idBranch,
       _barcode = barcode,
       _qtyItem = qtyItem,
       _statusItem = statusItem,
       _dateItem = dateItem;

  String get getuidUser => _uidUser;
  String get getnameItem => _nameItem;
  String get getidItem => _idItem;
  double get getpriceItem => _priceItem;
  String get getidCategoryiItem => _idCategoryItem;
  bool get getstatusCondiment => _statusCondiment;
  String get geturlImage => _urlImage;
  double get getqtyitem => _qtyItem;
  String get getidBranch => _idBranch;
  String get getBarcode => _barcode;
  bool get getStatusItem => _statusItem;
  String get getDateItem => _dateItem;

  set setuidUser(String value) => _uidUser;
  set setnameItem(String value) => _nameItem;
  set setidItem(String value) => _idItem;
  set setpriceItem(String value) => _priceItem;
  set setidCategoryItem(String value) => _idCategoryItem;
  set setstatusCondiment(bool value) => _statusCondiment;
  set seturlImage(String value) => _urlImage;
  set setqtyItem(double value) => _qtyItem;
  set setidBranch(String value) => _idBranch;
  set setBarcode(String value) => _barcode;
  set setStatusItem(bool value) => _statusItem;
  set setDateItem(String value) => _dateItem;

  static List<ModelItem> getDataListItem(QuerySnapshot data) {
    return data.docs.map((map) {
      final dataItem = map.data() as Map<String, dynamic>;
      return ModelItem(
        uidUser: dataItem['uid_user'],
        nameItem: dataItem['nama_item'],
        idItem: dataItem['id_item'],
        priceItem: dataItem['harga_item'].toDouble(),
        idCategoryItem: dataItem['id_kategori'],
        statusCondiment: dataItem['status_condiment'],
        urlImage: dataItem['url_gambar'],
        qtyItem: dataItem['qty_item'].toDouble(),
        idBranch: dataItem['id_cabang'],
        barcode: dataItem['barcode'],
        statusItem: dataItem['status_item'],
        dateItem: dataItem['tanggal_item'],
      );
    }).toList();
  }

  @override
  List<Object?> get props => [
    _uidUser,
    _nameItem,
    _idItem,
    _priceItem,
    _idCategoryItem,
    _statusCondiment,
    _urlImage,
    _idBranch,
    _barcode,
    _qtyItem,
    _statusItem,
    _dateItem,
  ];
}
