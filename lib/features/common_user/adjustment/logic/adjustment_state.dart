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
  final List<ModelItem> filteredItem;
  final List<ModelBranch> dataBranch;
  final ModelItem? selectedItem;
  final ModelBatch? selectedBatch;
  final ModelCategory? selectedFilterCategory;
  final List<ModelItemBatch> dataItemBatch;
  final bool isAdjustIn;

  AdjustmentLoaded({
    this.isAdjustIn = true,
    this.dataItem = const [],
    this.dataBatch = const [],
    this.dataCategory = const [],
    this.dataItemBatch = const [],
    this.filteredItem = const [],
    this.dataBranch = const [],
    this.selectedFilterCategory,
    this.idBranch,
    this.selectedItem,
    this.selectedBatch,
  });

  AdjustmentLoaded copyWith({
    bool? isAdjustIn,
    List<ModelItem>? dataItem,
    List<ModelBatch>? dataBatch,
    List<ModelCategory>? dataCategory,
    String? idBranch,
    List<ModelItem>? filteredItem,
    List<ModelBranch>? dataBranch,
    ModelItem? selectedItem,
    ModelBatch? selectedBatch,
    List<ModelItemBatch>? dataItemBatch,
    ModelCategory? selectedFilterCategory,
  }) {
    return AdjustmentLoaded(
      isAdjustIn: isAdjustIn ?? this.isAdjustIn,
      dataItem: dataItem ?? this.dataItem,
      dataBatch: dataBatch ?? this.dataBatch,
      dataCategory: dataCategory ?? this.dataCategory,
      idBranch: idBranch ?? this.idBranch,
      filteredItem: filteredItem ?? this.filteredItem,
      dataBranch: dataBranch ?? this.dataBranch,
      selectedItem: selectedItem ?? this.selectedItem,
      selectedBatch: selectedBatch ?? this.selectedBatch,
      dataItemBatch: dataItemBatch ?? this.dataItemBatch,
      selectedFilterCategory:
          selectedFilterCategory ?? this.selectedFilterCategory,
    );
  }

  @override
  List<Object?> get props => [
    isAdjustIn,
    dataItem,
    dataBatch,
    dataCategory,
    filteredItem,
    dataItemBatch,
    dataBranch,
    idBranch,
    selectedItem,
    selectedBatch,
    selectedFilterCategory,
  ];
}
