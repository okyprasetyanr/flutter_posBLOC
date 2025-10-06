import 'package:flutter_pos/model_data/model_cabang.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';

class SellState {}

class SellInitial extends SellState {}

class SellLoading extends SellState {}

class SellLoaded extends SellState {
  final List<ModelItem>? dataItem;
  final List<ModelItem>? filteredItem;
  final List<ModelKategori>? dataKategori;
  final List<ModelCabang>? dataCabang;
  final String? selectedIDCabang;
  final ModelKategori? selectedKategori;

  SellLoaded({
    this.filteredItem = const [],
    this.dataKategori = const [],
    this.dataCabang = const [],
    this.dataItem = const [],
    this.selectedIDCabang,
    this.selectedKategori,
  });

  SellLoaded copyWith({
    List<ModelItem>? dataItem,
    List<ModelItem>? filteredItem,
    String? selectedIDCabang,
    ModelKategori? selectedKategori,
    List<ModelKategori>? dataKategori,
    List<ModelCabang>? dataCabang,
  }) {
    return SellLoaded(
      dataItem: dataItem ?? this.dataItem,
      dataCabang: dataCabang ?? this.dataCabang,
      dataKategori: dataKategori ?? this.dataKategori,
      filteredItem: filteredItem ?? this.filteredItem,
      selectedIDCabang: selectedIDCabang ?? this.selectedIDCabang,
      selectedKategori: selectedKategori ?? this.selectedKategori,
    );
  }
}
