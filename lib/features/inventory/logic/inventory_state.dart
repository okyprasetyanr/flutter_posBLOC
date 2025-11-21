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
  final int indexFilterItem;
  final int indexStatusItem;
  final int indexFilterTypeItem;
  final int indexFilterByCategoryItem;
  final bool condimentForm;
  final List<ModelBranch>? dataBranch;
  final List<ModelItem> dataItem;
  final List<ModelCategory> dataCategory;
  final List<ModelCategory> filteredDataCategory;
  final List<ModelItem> filteredDataItem;
  final ModelCategory? dataSelectedCategory;
  final ModelItem? dataSelectedItem;
  final ModelCategory? dataSelectedCategoryItem;

  InventoryLoaded({
    this.filteredDataCategory = const [],
    this.dataSelectedCategoryItem,
    this.indexFilterByCategoryItem = 0,
    this.indexFilterTypeItem = 0,
    this.indexFilterItem = 0,
    this.indexStatusItem = 0,
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
    int? indexFilterItem,
    int? indexStatusItem,
    int? indexFilterTypeItem,
    int? indexFilterIDCategoryItem,
    bool? condimentForm,
    List<ModelBranch>? dataBranch,
    List<ModelItem>? dataItem,
    List<ModelCategory>? dataCategory,
    List<ModelCategory>? filteredDataCategory,
    List<ModelItem>? filteredDataItem,
    ModelCategory? dataSelectedCategoryItem,
    ModelCategory? dataSelectedCategory,
    ModelItem? dataSelectedItem,
  }) {
    return InventoryLoaded(
      filteredDataCategory: filteredDataCategory ?? this.filteredDataCategory,
      indexFilterByCategoryItem:
          indexFilterIDCategoryItem ?? this.indexFilterByCategoryItem,
      indexFilterItem: indexFilterItem ?? this.indexFilterItem,
      indexFilterTypeItem: indexFilterTypeItem ?? this.indexFilterTypeItem,
      indexStatusItem: indexStatusItem ?? this.indexStatusItem,
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
    indexFilterItem,
    indexStatusItem,
    indexFilterTypeItem,
    indexFilterByCategoryItem,
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
