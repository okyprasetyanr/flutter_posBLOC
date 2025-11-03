import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_category.dart';

class InventoryState {}

class InventoryInitial extends InventoryState {}

class InventoryLoading extends InventoryState {}

class InventoryLoadingItem extends InventoryState {}

class InventoryError extends InventoryState {
  final String message;
  InventoryError(this.message);
}

class InventoryLoaded extends InventoryState with EquatableMixin {
  final String? selectedIdBranch;
  final String? daerahCabang;
  final String? selectedFilterItem;
  final String? selectedStatusItem;
  final String? selectedFilterJenisItem;
  final String? selectedFilterIDKategoriItem;
  final bool condimentForm;
  final List<ModelBranch> datacabang;
  final List<ModelItem> dataItem;
  final List<ModelCategory> dataKategori;
  final List<ModelItem> filteredDataItem;
  final ModelCategory? dataSelectedKategori;
  final ModelItem? dataSelectedItem;
  final ModelCategory? dataSelectedKategoriItem;

  InventoryLoaded({
    this.dataSelectedKategoriItem,
    this.selectedFilterIDKategoriItem,
    this.selectedFilterJenisItem,
    this.selectedFilterItem,
    this.selectedStatusItem,
    this.condimentForm = false,
    this.dataSelectedKategori,
    this.dataSelectedItem,
    this.selectedIdBranch,
    this.daerahCabang,
    this.datacabang = const [],
    this.dataItem = const [],
    this.dataKategori = const [],
    this.filteredDataItem = const [],
  });

  InventoryLoaded copyWith({
    String? idBranch,
    String? daerahCabang,
    String? selectedFilterItem,
    String? selectedStatusItem,
    String? selectedFilterJenisItem,
    String? selectedFilterIDKategoriItem,
    bool? condimentForm,
    List<ModelBranch>? datacabang,
    List<ModelItem>? dataItem,
    List<ModelCategory>? dataKategori,
    List<ModelItem>? filteredDataItem,
    ModelCategory? dataSelectedKategoriItem,
    ModelCategory? dataSelectedKategori,
    ModelItem? dataSelectedItem,
  }) {
    return InventoryLoaded(
      selectedFilterIDKategoriItem:
          selectedFilterIDKategoriItem ?? this.selectedFilterIDKategoriItem,
      selectedFilterItem: selectedFilterItem ?? this.selectedFilterItem,
      selectedFilterJenisItem:
          selectedFilterJenisItem ?? this.selectedFilterJenisItem,
      selectedStatusItem: selectedStatusItem ?? this.selectedStatusItem,
      condimentForm: condimentForm ?? this.condimentForm,
      selectedIdBranch: idBranch ?? this.selectedIdBranch,
      daerahCabang: daerahCabang ?? this.daerahCabang,
      datacabang: datacabang ?? this.datacabang,
      dataItem: dataItem ?? this.dataItem,
      dataKategori: dataKategori ?? this.dataKategori,
      filteredDataItem: filteredDataItem ?? this.filteredDataItem,
      dataSelectedKategori: dataSelectedKategori,
      dataSelectedKategoriItem: dataSelectedKategoriItem,
      dataSelectedItem: dataSelectedItem,
    );
  }

  @override
  List<Object?> get props => [
    selectedIdBranch,
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
    dataSelectedKategoriItem,
    dataSelectedKategori,
    dataSelectedItem,
  ];
}
