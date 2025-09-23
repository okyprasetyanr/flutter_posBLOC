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
  final String? idCabang;
  final String? daerahCabang;
  final List<ModelCabang> datacabang;
  final List<ModelItem> dataItem;
  final List<ModelKategori> dataKategori;
  final List<ModelItem> filteredDataItem;
  final Map<String, String> dataSelectedKategori;

  InventoryLoaded({
    this.dataSelectedKategori = const {},
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
    Map<String, String>? dataSelectedKategori,
  }) {
    return InventoryLoaded(
      idCabang: idCabang ?? this.idCabang,
      daerahCabang: daerahCabang ?? this.daerahCabang,
      datacabang: datacabang ?? this.datacabang,
      dataItem: dataItem ?? this.dataItem,
      dataKategori: dataKategori ?? this.dataKategori,
      filteredDataItem: filteredDataItem ?? this.filteredDataItem,
      dataSelectedKategori: dataSelectedKategori ?? this.dataSelectedKategori,
    );
  }
}
