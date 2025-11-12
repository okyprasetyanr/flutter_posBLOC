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
  final String? idBranch;
  final String? areaBranch;
  final String? selectedFilterItem;
  final String? selectedStatusItem;
  final String? selectedFilterJenisItem;
  final String? selectedFilterIDCategoryItem;
  final bool condimentForm;
  final List<ModelBranch>? dataBranch;
  final List<ModelItem> dataItem;
  final List<ModelCategory> dataCategory;
  final List<ModelItem> filteredDataItem;
  final ModelCategory? dataSelectedCategory;
  final ModelItem? dataSelectedItem;
  final ModelCategory? dataSelectedCategoryItem;

  InventoryLoaded({
    this.dataSelectedCategoryItem,
    this.selectedFilterIDCategoryItem,
    this.selectedFilterJenisItem,
    this.selectedFilterItem,
    this.selectedStatusItem,
    this.condimentForm = false,
    this.dataSelectedCategory,
    this.dataSelectedItem,
    this.idBranch,
    this.areaBranch,
    this.dataBranch,
    this.dataItem = const [],
    this.dataCategory = const [],
    this.filteredDataItem = const [],
  });

  InventoryLoaded copyWith({
    String? idBranch,
    String? areaBranch,
    String? selectedFilterItem,
    String? selectedStatusItem,
    String? selectedFilterJenisItem,
    String? selectedFilterIDCategoryItem,
    bool? condimentForm,
    List<ModelBranch>? dataBranch,
    List<ModelItem>? dataItem,
    List<ModelCategory>? dataCategory,
    List<ModelItem>? filteredDataItem,
    ModelCategory? dataSelectedCategoryItem,
    ModelCategory? dataSelectedCategory,
    ModelItem? dataSelectedItem,
  }) {
    return InventoryLoaded(
      selectedFilterIDCategoryItem:
          selectedFilterIDCategoryItem ?? this.selectedFilterIDCategoryItem,
      selectedFilterItem: selectedFilterItem ?? this.selectedFilterItem,
      selectedFilterJenisItem:
          selectedFilterJenisItem ?? this.selectedFilterJenisItem,
      selectedStatusItem: selectedStatusItem ?? this.selectedStatusItem,
      condimentForm: condimentForm ?? this.condimentForm,
      idBranch: idBranch ?? this.idBranch,
      areaBranch: areaBranch ?? this.areaBranch,
      dataBranch: dataBranch ?? this.dataBranch,
      dataItem: dataItem ?? this.dataItem,
      dataCategory: dataCategory ?? this.dataCategory,
      filteredDataItem: filteredDataItem ?? this.filteredDataItem,
      dataSelectedCategory: dataSelectedCategory,
      dataSelectedCategoryItem: dataSelectedCategoryItem,
      dataSelectedItem: dataSelectedItem,
    );
  }

  @override
  List<Object?> get props => [
    idBranch,
    areaBranch,
    selectedFilterItem,
    selectedStatusItem,
    selectedFilterJenisItem,
    selectedFilterIDCategoryItem,
    condimentForm,
    dataBranch,
    dataItem,
    dataCategory,
    filteredDataItem,
    dataSelectedCategoryItem,
    dataSelectedCategory,
    dataSelectedItem,
  ];
}
