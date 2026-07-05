import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';

class AdjustmentState {}

class AdjustmentInitial extends AdjustmentState {}

class AdjustmentLoaded extends AdjustmentState with EquatableMixin {
  final List<ModelItem> dataItem;
  final List<ModelBatch> dataBatch;
  final List<ModelCategory> dataCategory;
  final String? idBranch;
  final String searchItemBatch;
  final String searchItem;
  final List<ModelItem> filteredItem;
  final List<ModelItemBatch> filteredItemBatch;
  final List<ModelBranch> dataBranch;
  final ModelItem? selectedItem;
  final ModelItemBatch? editedItemBatch;
  final ModelItemBatch? originalItemBatch;
  final ModelCategory? selectedFilterCategory;
  final List<ModelItemBatch> dataItemBatch;
  final List<ModelItemBatch> dataItemBatchByIdItem;
  final bool isAdjustIn;

  AdjustmentLoaded({
    this.isAdjustIn = true,
    this.dataItem = const [],
    this.dataBatch = const [],
    this.dataCategory = const [],
    this.dataItemBatch = const [],
    this.dataItemBatchByIdItem = const [],
    this.filteredItem = const [],
    this.filteredItemBatch = const [],
    this.dataBranch = const [],
    this.searchItemBatch = "",
    this.searchItem = "",
    this.selectedFilterCategory,
    this.idBranch,
    this.selectedItem,
    this.editedItemBatch,
    this.originalItemBatch,
  });

  AdjustmentLoaded copyWith({
    String? searchItemBatch,
    String? searchItem,
    bool? isAdjustIn,
    List<ModelItem>? dataItem,
    List<ModelBatch>? dataBatch,
    List<ModelCategory>? dataCategory,
    String? idBranch,
    List<ModelItem>? filteredItem,
    List<ModelItemBatch>? filteredItemBatch,
    List<ModelBranch>? dataBranch,
    ModelItem? selectedItem,
    ModelItemBatch? editedItemBatch,
    ModelItemBatch? originalItemBatch,
    List<ModelItemBatch>? dataItemBatch,
    List<ModelItemBatch>? dataItemBatchByIdItem,
    ModelCategory? selectedFilterCategory,
  }) {
    return AdjustmentLoaded(
      searchItem: searchItem ?? this.searchItem,
      searchItemBatch: searchItemBatch ?? this.searchItemBatch,
      filteredItemBatch: filteredItemBatch ?? this.filteredItemBatch,
      dataItemBatchByIdItem:
          dataItemBatchByIdItem ?? this.dataItemBatchByIdItem,
      isAdjustIn: isAdjustIn ?? this.isAdjustIn,
      dataItem: dataItem ?? this.dataItem,
      dataBatch: dataBatch ?? this.dataBatch,
      dataCategory: dataCategory ?? this.dataCategory,
      idBranch: idBranch ?? this.idBranch,
      filteredItem: filteredItem ?? this.filteredItem,
      dataBranch: dataBranch ?? this.dataBranch,
      selectedItem: selectedItem,
      editedItemBatch: editedItemBatch,
      originalItemBatch: originalItemBatch,
      dataItemBatch: dataItemBatch ?? this.dataItemBatch,
      selectedFilterCategory:
          selectedFilterCategory ?? this.selectedFilterCategory,
    );
  }

  @override
  List<Object?> get props => [
    searchItem,
    searchItemBatch,
    isAdjustIn,
    dataItem,
    dataBatch,
    dataCategory,
    filteredItem,
    filteredItemBatch,
    dataItemBatch,
    dataItemBatchByIdItem,
    dataBranch,
    idBranch,
    selectedItem,
    editedItemBatch,
    originalItemBatch,
    selectedFilterCategory,
  ];
}
