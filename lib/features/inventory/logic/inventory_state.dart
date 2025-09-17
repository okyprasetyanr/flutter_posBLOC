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

class InventoryFilteredItem extends InventoryState {
  final List<ModelItem> dataItem;
  InventoryFilteredItem({required this.dataItem});
}

class InventoryFilteredKategory extends InventoryState {
  final List<ModelKategori> dataKategori;
  InventoryFilteredKategory({required this.dataKategori});
}

class InventoryLoaded extends InventoryState {
  final String? idCabang;
  final String? daerahCabang;
  final List<ModelCabang> datacabang;
  final List<ModelItem> dataItem;
  final List<ModelKategori> dataKategori;

  InventoryLoaded({
    required this.idCabang,
    required this.daerahCabang,
    required this.datacabang,
    required this.dataItem,
    required this.dataKategori,
  });
}
