import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_cabang.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';

class InventoryState {}

class InventoryInitial extends InventoryState {}

class InventoryLoading extends InventoryState {}

class InventoryLoadingItem extends InventoryState {}

class InventoryError extends InventoryState {
  final String message;
  InventoryError(this.message);
}

class InventoryLoaded extends InventoryState with EquatableMixin {
  final String? idCabang;
  final String? daerahCabang;
  final String? selectedFilterItem;
  final String? selectedStatusItem;
  final String? selectedFilterJenisItem;
  final String? selectedFilterIDKategoriItem;
  final bool? condimentForm;
  final List<ModelCabang> datacabang;
  final List<ModelItem> dataItem;
  final List<ModelKategori> dataKategori;
  final List<ModelItem> filteredDataItem;
  final ModelKategori? dataSelectedKategori;
  final ModelItem? dataSelectedItem;
  final ModelKategori? dataSelectedKategoriItem;
  final ModelItem? updateDataSelectedItem;

  InventoryLoaded({
    this.dataSelectedKategoriItem,
    this.selectedFilterIDKategoriItem,
    this.selectedFilterJenisItem,
    this.selectedFilterItem,
    this.selectedStatusItem,
    this.condimentForm,
    this.dataSelectedKategori,
    this.dataSelectedItem,
    this.updateDataSelectedItem,
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
    String? selectedFilterItem,
    String? selectedStatusItem,
    String? selectedFilterJenisItem,
    String? selectedFilterIDKategoriItem,
    bool? condimentForm,
    List<ModelCabang>? datacabang,
    List<ModelItem>? dataItem,
    List<ModelKategori>? dataKategori,
    List<ModelItem>? filteredDataItem,
    ModelKategori? dataSelectedKategoriItem,
    ModelKategori? dataSelectedKategori,
    ModelItem? dataSelectedItem,
    ModelItem? updateDataSelectedItem,
  }) {
    return InventoryLoaded(
      selectedFilterIDKategoriItem:
          selectedFilterIDKategoriItem ?? this.selectedFilterIDKategoriItem,
      selectedFilterItem: selectedFilterItem ?? this.selectedFilterItem,
      selectedFilterJenisItem:
          selectedFilterJenisItem ?? this.selectedFilterJenisItem,
      selectedStatusItem: selectedStatusItem ?? this.selectedStatusItem,
      condimentForm: condimentForm ?? this.condimentForm,
      idCabang: idCabang ?? this.idCabang,
      daerahCabang: daerahCabang ?? this.daerahCabang,
      datacabang: datacabang ?? this.datacabang,
      dataItem: dataItem ?? this.dataItem,
      dataKategori: dataKategori ?? this.dataKategori,
      filteredDataItem: filteredDataItem ?? this.filteredDataItem,
      dataSelectedKategori: dataSelectedKategori ?? this.dataSelectedKategori,
      dataSelectedKategoriItem:
          dataSelectedKategoriItem ?? this.dataSelectedKategoriItem,
      dataSelectedItem: dataSelectedItem ?? this.dataSelectedItem,
      updateDataSelectedItem:
          updateDataSelectedItem ?? this.updateDataSelectedItem,
    );
  }

  @override
  List<Object?> get props => [
    idCabang,
    daerahCabang,
    selectedFilterItem,
    selectedStatusItem,
    selectedFilterJenisItem,
    selectedFilterIDKategoriItem,
    condimentForm,
    datacabang,
    dataItem,
    dataKategori,
    filteredDataItem,
    dataSelectedKategori,
    dataSelectedKategoriItem,
    dataSelectedItem,
    updateDataSelectedItem,
  ];
}
