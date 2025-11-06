import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';

class BatchState {}

class BatchInitial extends BatchState {}

class BatchLoading extends BatchState {}

class BatchLoaded extends BatchState with EquatableMixin {
  final List<ModelBatch> dataBatch;
  final List<ModelItem> dataItemBatch;
  final String? selectedIdItem;
  final List<ModelItemBatch> dataItemByIdItem;
  final ModelItemBatch? detailSelectedItem;

  BatchLoaded({
    this.dataBatch = const [],
    this.dataItemBatch = const [],
    this.dataItemByIdItem = const [],
    this.selectedIdItem,
    this.detailSelectedItem,
  });

  BatchLoaded copyWith({
    List<ModelItemBatch>? dataItemByIdItem,
    List<ModelBatch>? dataBatch,
    List<ModelItem>? dataItemBatch,
    String? selectedIdItem,
    ModelItemBatch? detailSelectedItem,
  }) {
    return BatchLoaded(
      detailSelectedItem: detailSelectedItem,
      dataItemByIdItem: dataItemByIdItem ?? this.dataItemByIdItem,
      selectedIdItem: selectedIdItem,
      dataBatch: dataBatch ?? this.dataBatch,
      dataItemBatch: dataItemBatch ?? this.dataItemBatch,
    );
  }

  @override
  List<Object?> get props => [
    dataBatch,
    dataItemBatch,
    selectedIdItem,
    detailSelectedItem,
  ];
}
