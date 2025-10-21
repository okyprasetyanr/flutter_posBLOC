import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_category.dart';

class SellState {}

class SellInitial extends SellState {}

class SellLoading extends SellState {}

class SellLoaded extends SellState with EquatableMixin {
  final List<ModelItem>? dataItem;
  final List<ModelItem>? filteredItem;
  final List<ModelKategori>? dataCategory;
  final List<ModelCabang>? dataBranch;
  final String? selectedIDBranch;
  final ModelKategori? selectedKategori;
  final ModelItemOrdered? selectedItem;
  final bool editSelectedItem;
  final List<ModelItemOrdered>? itemOrdered;

  SellLoaded({
    this.selectedItem,
    this.editSelectedItem = false,
    this.filteredItem = const [],
    this.dataCategory = const [],
    this.dataBranch = const [],
    this.dataItem = const [],
    this.itemOrdered = const [],
    this.selectedIDBranch,
    this.selectedKategori,
  });

  SellLoaded copyWith({
    List<ModelItem>? dataItem,
    List<ModelItem>? filteredItem,
    String? selectedIDCabang,
    ModelKategori? selectedKategori,
    List<ModelKategori>? dataKategori,
    List<ModelCabang>? dataCabang,
    ModelItemOrdered? selectedItem,
    List<ModelItemOrdered>? itemOrdered,
    bool? editSelectedItem,
  }) {
    return SellLoaded(
      editSelectedItem: editSelectedItem ?? this.editSelectedItem,
      itemOrdered: itemOrdered ?? this.itemOrdered,
      selectedItem: selectedItem,
      dataItem: dataItem ?? this.dataItem,
      dataBranch: dataCabang ?? this.dataBranch,
      dataCategory: dataKategori ?? this.dataCategory,
      filteredItem: filteredItem ?? this.filteredItem,
      selectedIDBranch: selectedIDCabang ?? this.selectedIDBranch,
      selectedKategori: selectedKategori ?? this.selectedKategori,
    );
  }

  @override
  List<Object?> get props => [
    dataItem,
    filteredItem,
    dataCategory,
    dataBranch,
    selectedIDBranch,
    selectedKategori,
    selectedItem,
    editSelectedItem,
    itemOrdered,
  ];
}
