import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';

class BatchState {}

class BatchInitial extends BatchState {}

class BatchLoaded extends BatchState with EquatableMixin {
  final List<ModelBatch> dataBatch;
  final List<ModelItem> filteredItem;
  final List<ModelItemBatch> dataItemBatch;
  final List<ModelItem> dataItem;
  final String? selectedIdItem;
  final String? idBranch;
  final List<ModelItemBatch> dataItemByIdItem;
  final ModelItemBatch? detailSelectedItem;

  BatchLoaded({
    this.idBranch,
    this.filteredItem = const [],
    this.dataItem = const [],
    this.dataBatch = const [],
    this.dataItemBatch = const [],
    this.dataItemByIdItem = const [],
    this.selectedIdItem,
    this.detailSelectedItem,
  });

  BatchLoaded copyWith({
    String? idBranch,
    List<ModelItem>? filteredItem,
    List<ModelItemBatch>? dataItemByIdItem,
    List<ModelBatch>? dataBatch,
    List<ModelItemBatch>? dataItemBatch,
    List<ModelItem>? dataItem,
    String? selectedIdItem,
    ModelItemBatch? detailSelectedItem,
  }) {
    return BatchLoaded(
      idBranch: idBranch ?? this.idBranch,
      filteredItem: filteredItem ?? this.filteredItem,
      dataItem: dataItem ?? this.dataItem,
      detailSelectedItem: detailSelectedItem,
      dataItemByIdItem: dataItemByIdItem ?? this.dataItemByIdItem,
      selectedIdItem: selectedIdItem,
      dataBatch: dataBatch ?? this.dataBatch,
      dataItemBatch: dataItemBatch ?? this.dataItemBatch,
    );
  }

  @override
  List<Object?> get props => [
    idBranch,
    filteredItem,
    dataItem,
    dataBatch,
    dataItemBatch,
    selectedIdItem,
    detailSelectedItem,
  ];
}
