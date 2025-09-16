import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
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

class InventoryLoaded extends InventoryState {
  final List<ModelCabang> datacabang;
  final List<ModelItem> dataItem;
  final List<ModelKategori> dataKategori;

  InventoryLoaded({
    required this.datacabang,
    required this.dataItem,
    required this.dataKategori,
  });
}
