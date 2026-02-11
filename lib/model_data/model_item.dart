import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/from_and_to_map/convert_to_map.dart';

class ModelItem extends Equatable {
  final String _nameItem,
      _idItem,
      _idCategoryItem,
      _urlImage,
      _idBranch,
      _barcode;
  final DateTime _date;
  final double _priceItem, _qtyItem, _priceItemBuy;
  final StatusData _statusCondiment, _statusItem;

  ModelItem({
    required double qtyItem,
    required String nameItem,
    required String idItem,
    required double priceItem,
    required double priceItemBuy,
    required String idCategoryItem,
    required StatusData statusCondiment,
    required String urlImage,
    required String idBranch,
    required String barcode,
    required StatusData statusItem,
    required DateTime date,
  }) : _nameItem = nameItem,
       _idItem = idItem,
       _priceItem = priceItem,
       _priceItemBuy = priceItemBuy,
       _idCategoryItem = idCategoryItem,
       _statusCondiment = statusCondiment,
       _urlImage = urlImage,
       _idBranch = idBranch,
       _barcode = barcode,
       _qtyItem = qtyItem,
       _statusItem = statusItem,
       _date = date;

  double get getpriceItemBuy => _priceItemBuy;
  String get getnameItem => _nameItem;
  String get getidItem => _idItem;
  double get getpriceItem => _priceItem;
  String get getidCategoryiItem => _idCategoryItem;
  StatusData get getstatusCondiment => _statusCondiment;
  String get geturlImage => _urlImage;
  double get getqtyItem => _qtyItem;
  String get getidBranch => _idBranch;
  String get getBarcode => _barcode;
  StatusData get getStatusItem => _statusItem;
  DateTime get getDateItem => _date;

  ModelItem copyWith({
    double? qtyItem,
    String? nameItem,
    String? idItem,
    double? priceItem,
    double? priceItemBuy,
    String? idCategoryItem,
    StatusData? statusCondiment,
    String? urlImage,
    String? idBranch,
    String? barcode,
    StatusData? statusItem,
    DateTime? date,
  }) {
    return ModelItem(
      priceItemBuy: priceItemBuy ?? _priceItemBuy,
      qtyItem: qtyItem ?? _qtyItem,
      nameItem: nameItem ?? _nameItem,
      idItem: idItem ?? _idItem,
      priceItem: priceItem ?? _priceItem,
      idCategoryItem: idCategoryItem ?? _idCategoryItem,
      statusCondiment: statusCondiment ?? _statusCondiment,
      urlImage: urlImage ?? _urlImage,
      idBranch: idBranch ?? _idBranch,
      barcode: barcode ?? _barcode,
      statusItem: statusItem ?? _statusItem,
      date: date ?? _date,
    );
  }

  Future<void> pushDataItem() async {
    await FirebaseFirestore.instance
        .collection("items")
        .doc(_idItem)
        .set(
          convertToMapItem(
            ModelItem(
              priceItemBuy: _priceItemBuy,
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
              date: _date,
            ),
          ),
        );
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
    _date,
  ];
}
