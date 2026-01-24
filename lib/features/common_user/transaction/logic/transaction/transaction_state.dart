import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState with EquatableMixin {
  final double customPrice;
  final bool revision;
  final List<ModelTransaction> dataTransactionSaved;
  final ModelTransaction? selectedTransaction;
  final bool isSell;
  final List<ModelItem>? dataItem;
  final List<ModelItem>? filteredItem;
  final List<ModelCategory>? dataCategory;
  final List<ModelBranch> dataBranch;
  final String? idBranch;
  final ModelCategory? selectedCategory;
  final ModelItemOrdered? selectedItem;
  final ModelPartner? selectedPartner;
  final bool editSelectedItem;
  final List<ModelItemOrdered> itemOrdered;
  final List<ModelPartner>? dataPartner;
  final List<ModelItemBatch>? dataItemBatch;

  TransactionLoaded({
    this.customPrice = 0,
    this.dataItemBatch = const [],
    this.revision = false,
    this.dataTransactionSaved = const [],
    this.isSell = true,
    this.selectedItem,
    this.selectedPartner,
    this.selectedTransaction,
    this.editSelectedItem = false,
    this.filteredItem = const [],
    this.dataPartner = const [],
    this.dataCategory = const [],
    this.dataBranch = const [],
    this.dataItem = const [],
    this.itemOrdered = const [],
    this.idBranch,
    this.selectedCategory,
  });

  TransactionLoaded copyWith({
    double? customPrice,
    List<ModelItemBatch>? dataItemBatch,
    bool? revision,
    ModelTransaction? selectedTransaction,
    List<ModelTransaction>? dataTransactionSaved,
    List<ModelPartner>? dataPartner,
    bool? sell,
    List<ModelItem>? dataItem,
    List<ModelItem>? filteredItem,
    String? selectedIDBranch,
    ModelCategory? selectedCategory,
    List<ModelCategory>? dataCategory,
    List<ModelBranch>? dataBranch,
    ModelItemOrdered? selectedItem,
    ModelPartner? selectedPartner,
    List<ModelItemOrdered>? itemOrdered,
    bool? editSelectedItem,
  }) {
    return TransactionLoaded(
      customPrice: customPrice ?? this.customPrice,
      dataItemBatch: dataItemBatch ?? this.dataItemBatch,
      revision: revision ?? this.revision,
      selectedTransaction: selectedTransaction ?? this.selectedTransaction,
      dataTransactionSaved: dataTransactionSaved ?? this.dataTransactionSaved,
      selectedPartner: selectedPartner ?? selectedPartner,
      dataPartner: dataPartner ?? this.dataPartner,
      isSell: sell ?? this.isSell,
      editSelectedItem: editSelectedItem ?? this.editSelectedItem,
      itemOrdered: itemOrdered ?? this.itemOrdered,
      selectedItem: selectedItem,
      dataItem: dataItem ?? this.dataItem,
      dataBranch: dataBranch ?? this.dataBranch,
      dataCategory: dataCategory ?? this.dataCategory,
      filteredItem: filteredItem ?? this.filteredItem,
      idBranch: selectedIDBranch ?? this.idBranch,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [
    customPrice,
    dataItemBatch,
    revision,
    selectedTransaction,
    dataTransactionSaved,
    selectedPartner,
    dataPartner,
    isSell,
    dataItem,
    filteredItem,
    dataCategory,
    dataBranch,
    idBranch,
    selectedCategory,
    selectedItem,
    editSelectedItem,
    itemOrdered,
  ];
}
