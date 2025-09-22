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

class InventoryFilteredKategori extends InventoryState {
  final List<ModelKategori> dataKategori;
  InventoryFilteredKategori({required this.dataKategori});
}

class InventorySelectedKategori extends InventoryState {
  final Map<String, String> dataSelectedKategori;

  InventorySelectedKategori({required this.dataSelectedKategori});
}

class InventoryLoaded extends InventoryState {
  final String? idCabang;
  final String? daerahCabang;
  final List<ModelCabang> datacabang;
  final List<ModelItem> dataItem;
  final List<ModelKategori> dataKategori;
  final List<ModelItem> filteredDataItem;

  InventoryLoaded({
    this.idCabang,
    this.daerahCabang,
    this.datacabang = const [],
    this.dataItem = const [],
    this.dataKategori = const [],
    this.filteredDataItem = const [],
  });

  InventoryLoaded copyWith({
    String? idCabang,
    String? daerahCabang,
    List<ModelCabang>? datacabang,
    List<ModelItem>? dataItem,
    List<ModelKategori>? dataKategori,
    List<ModelItem>? filteredDataItem,
  }) {
    return InventoryLoaded(
      idCabang: idCabang ?? this.idCabang,
      daerahCabang: daerahCabang ?? this.daerahCabang,
      datacabang: datacabang ?? this.datacabang,
      dataItem: dataItem ?? this.dataItem,
      dataKategori: dataKategori ?? this.dataKategori,
      filteredDataItem: filteredDataItem ?? this.filteredDataItem,
    );
  }
}
