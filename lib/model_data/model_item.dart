import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/convert_to_map/convert_to_map.dart';

class ModelItem extends Equatable {
  final String _nameItem,
      _idItem,
      _idCategoryItem,
      _urlImage,
      _idBranch,
      _barcode;
  final DateTime _created;
  final double _priceItem, _qtyItem;
  final bool _statusCondiment, _statusItem;

  ModelItem({
    required double qtyItem,
    required String nameItem,
    required String idItem,
    required double priceItem,
    required String idCategoryItem,
    required bool statusCondiment,
    required String urlImage,
    required String idBranch,
    required String barcode,
    required bool statusItem,
    required DateTime created,
  }) : _nameItem = nameItem,
       _idItem = idItem,
       _priceItem = priceItem,
       _idCategoryItem = idCategoryItem,
       _statusCondiment = statusCondiment,
       _urlImage = urlImage,
       _idBranch = idBranch,
       _barcode = barcode,
       _qtyItem = qtyItem,
       _statusItem = statusItem,
       _created = created;

  String get getnameItem => _nameItem;
  String get getidItem => _idItem;
  double get getpriceItem => _priceItem;
  String get getidCategoryiItem => _idCategoryItem;
  bool get getstatusCondiment => _statusCondiment;
  String get geturlImage => _urlImage;
  double get getqtyItem => _qtyItem;
  String get getidBranch => _idBranch;
  String get getBarcode => _barcode;
  bool get getStatusItem => _statusItem;
  DateTime get getDateItem => _created;

  ModelItem copyWith({
    
    double? qtyItem,
    String? nameItem,
    String? idItem,
    double? priceItem,
    String? idCategoryItem,
    bool? statusCondiment,
    String? urlImage,
    String? idBranch,
    String? barcode,
    bool? statusItem,
    DateTime? created,
  }) {
    return ModelItem(
      qtyItem: qtyItem ?? this._qtyItem,
      nameItem: nameItem ?? this._nameItem,
      idItem: idItem ?? this._idItem,
      priceItem: priceItem ?? this._priceItem,
      idCategoryItem: idCategoryItem ?? this._idCategoryItem,
      statusCondiment: statusCondiment ?? this._statusCondiment,
      urlImage: urlImage ?? this._urlImage,
      idBranch: idBranch ?? this._idBranch,
      barcode: barcode ?? this._barcode,
      statusItem: statusItem ?? this._statusItem,
      created: created ?? this._created,
    );
  }

  Future<void> pushDataItem() async {
    await FirebaseFirestore.instance
        .collection("items")
        .doc(_idItem)
        .set(
          convertToMapItem(
            ModelItem(
              qtyItem: _qtyItem,
              nameItem: _nameItem,
              idItem: _idItem,
              priceItem: _priceItem,
              idCategoryItem: _idCategoryItem,
              statusCondiment: _statusCondiment,
              urlImage: _urlImage,
              idBranch: _idBranch,
              barcode: _barcode,
              statusItem: _statusItem,
              created: _created,
            ),
          ),
        );
  }

  static List<ModelItem> getDataListItem(QuerySnapshot data) {
    return data.docs.map((map) {
      final dataItem = map.data() as Map<String, dynamic>;
      return ModelItem(
        nameItem: dataItem['name_item'],
        idItem: map.id,
        priceItem: dataItem['price_item'].toDouble(),
        idCategoryItem: dataItem['id_category'],
        statusCondiment: dataItem['status_condiment'],
        urlImage: dataItem['url_image'],
        qtyItem: dataItem['qty_item'].toDouble(),
        idBranch: dataItem['id_branch'],
        barcode: dataItem['barcode'],
        statusItem: dataItem['status_item'],
        created: DateTime.parse(dataItem['created']),
      );
    }).toList();
  }

  @override
  List<Object?> get props => [
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
    _created,
  ];
}
