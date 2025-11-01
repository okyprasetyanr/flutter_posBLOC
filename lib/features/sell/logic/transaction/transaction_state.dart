import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_partner.dart';

class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState with EquatableMixin {
  final bool sell;
  final List<ModelItem>? dataItem;
  final List<ModelItem>? filteredItem;
  final List<ModelKategori>? dataCategory;
  final List<ModelBranch>? dataBranch;
  final String? selectedIDBranch;
  final ModelKategori? selectedKategori;
  final ModelItemOrdered? selectedItem;
  final bool editSelectedItem;
  final List<ModelItemOrdered>? itemOrdered;
  final List<ModelPartner>? dataPartner;

  TransactionLoaded({
    this.sell = true,
    this.selectedItem,
    this.editSelectedItem = false,
    this.filteredItem = const [],
    this.dataPartner = const [],
    this.dataCategory = const [],
    this.dataBranch = const [],
    this.dataItem = const [],
    this.itemOrdered = const [],
    this.selectedIDBranch,
    this.selectedKategori,
  });

  TransactionLoaded copyWith({
    List<ModelPartner>? dataPartner,
    bool? sell,
    List<ModelItem>? dataItem,
    List<ModelItem>? filteredItem,
    String? selectedIDBranch,
    ModelKategori? selectedKategori,
    List<ModelKategori>? dataKategori,
    List<ModelBranch>? dataCabang,
    ModelItemOrdered? selectedItem,
    List<ModelItemOrdered>? itemOrdered,
    bool? editSelectedItem,
  }) {
    return TransactionLoaded(
      dataPartner: dataPartner ?? this.dataPartner,
      sell: sell ?? this.sell,
      editSelectedItem: editSelectedItem ?? this.editSelectedItem,
      itemOrdered: itemOrdered ?? this.itemOrdered,
      selectedItem: selectedItem,
      dataItem: dataItem ?? this.dataItem,
      dataBranch: dataCabang ?? this.dataBranch,
      dataCategory: dataKategori ?? this.dataCategory,
      filteredItem: filteredItem ?? this.filteredItem,
      selectedIDBranch: selectedIDBranch ?? this.selectedIDBranch,
      selectedKategori: selectedKategori ?? this.selectedKategori,
    );
  }

  @override
  List<Object?> get props => [
    dataPartner,
    sell,
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
