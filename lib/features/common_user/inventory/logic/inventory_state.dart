import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_pos/enum/enum.dart';
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
  final File? image;
  final String? idBranch;
  final String? areaBranch;
  final FilterItem filterItem;
  final StatusData statusItem;
  final FilterTypeItem filterTypeItem;
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
    this.image,
    this.filteredDataCategory = const [],
    this.dataSelectedCategoryItem,
    this.indexFilterByCategoryItem = 0,
    this.filterTypeItem = FilterTypeItem.All,
    this.filterItem = FilterItem.A_Z,
    this.statusItem = StatusData.Aktif,
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
    File? image,
    String? idBranch,
    String? areaBranch,
    FilterItem? indexFilterItem,
    StatusData? indexStatusItem,
    FilterTypeItem? filterTypeItem,
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
      image: image ?? this.image,
      filteredDataCategory: filteredDataCategory ?? this.filteredDataCategory,
      indexFilterByCategoryItem:
          indexFilterIDCategoryItem ?? this.indexFilterByCategoryItem,
      filterItem: indexFilterItem ?? this.filterItem,
      filterTypeItem: filterTypeItem ?? this.filterTypeItem,
      statusItem: indexStatusItem ?? this.statusItem,
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
    filteredDataCategory,
    image,
    idBranch,
    areaBranch,
    filterItem,
    statusItem,
    filterTypeItem,
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
