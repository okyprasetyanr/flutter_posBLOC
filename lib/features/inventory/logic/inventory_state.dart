import 'package:flutter_pos/model_data/model_cabang.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';

class InventoryState {}

class InventoryInitial extends InventoryState {}

class InventoryLoading extends InventoryState {}

class InventoryError extends InventoryState {
  final String message;
  InventoryError(this.message);
}

class InventoryFilteredCategory extends InventoryState {
  final List<ModelKategori> dataKategori;
  InventoryFilteredCategory({required this.dataKategori});
}

class InventoryLoaded extends InventoryState {
  final String? idCabang;
  final String? daerahCabang;
  final List<ModelCabang>? datacabang;
  final List<ModelItem>? dataItem;
  final List<ModelKategori>? dataKategori;

  InventoryLoaded({
    this.idCabang,
    this.daerahCabang,
    this.datacabang,
    this.dataItem,
    this.dataKategori,
  });
}

class InventoryAllFilteredItem extends InventoryState {
  final List<ModelItem> dataitem;

  InventoryAllFilteredItem({required this.dataitem});
}
