import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/from_and_to_map/convert_to_map.dart';

class ModelItem extends Equatable {
  final String idItem;
  final String nameItem;
  final String idCategoryItem;
  final String urlImage;
  final String idBranch;
  final String barcode;

  final DateTime date;

  final double priceItem;
  final double qtyItem;
  final double priceItemBuybyBatch;
  final double priceItemByBatch;

  final StatusData statusCondiment;
  final StatusData statusItem;

  const ModelItem({
    required this.qtyItem,
    required this.nameItem,
    required this.idItem,
    required this.priceItem,
    required this.priceItemByBatch,
    required this.priceItemBuybyBatch,
    required this.idCategoryItem,
    required this.statusCondiment,
    required this.urlImage,
    required this.idBranch,
    required this.barcode,
    required this.statusItem,
    required this.date,
  });

  double get getpriceItemBuybyBatch => priceItemBuybyBatch;
  double get getpriceItembyBatch => priceItemByBatch;
  String get getnameItem => nameItem;
  String get getidItem => idItem;
  double get getpriceItem => priceItem;
  String get getidCategoryiItem => idCategoryItem;
  StatusData get getstatusCondiment => statusCondiment;
  String get geturlImage => urlImage;
  double get getqtyItem => qtyItem;
  String get getidBranch => idBranch;
  String get getBarcode => barcode;
  StatusData get getStatusItem => statusItem;
  DateTime get getDateItem => date;

  ModelItem copyWith({
    double? qtyItem,
    String? nameItem,
    String? idItem,
    double? priceItem,
    double? priceItemBuyByBatch,
    double? priceItemByBatch,
    String? idCategoryItem,
    StatusData? statusCondiment,
    String? urlImage,
    String? idBranch,
    String? barcode,
    StatusData? statusItem,
    DateTime? date,
  }) {
    return ModelItem(
      priceItemByBatch: priceItemByBatch ?? this.priceItemByBatch,
      priceItemBuybyBatch: priceItemBuyByBatch ?? priceItemBuybyBatch,
      qtyItem: qtyItem ?? this.qtyItem,
      nameItem: nameItem ?? this.nameItem,
      idItem: idItem ?? this.idItem,
      priceItem: priceItem ?? this.priceItem,
      idCategoryItem: idCategoryItem ?? this.idCategoryItem,
      statusCondiment: statusCondiment ?? this.statusCondiment,
      urlImage: urlImage ?? this.urlImage,
      idBranch: idBranch ?? this.idBranch,
      barcode: barcode ?? this.barcode,
      statusItem: statusItem ?? this.statusItem,
      date: date ?? this.date,
    );
  }

  Future<void> pushDataItem() async {
    await FirebaseFirestore.instance
        .collection("items")
        .doc(idItem)
        .set(convertToMapItem(this));
  }

  @override
  List<Object?> get props => [
    nameItem,
    idItem,
    priceItem,
    idCategoryItem,
    statusCondiment,
    urlImage,
    idBranch,
    barcode,
    qtyItem,
    statusItem,
    date,
  ];
}
