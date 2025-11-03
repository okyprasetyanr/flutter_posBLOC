import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState with EquatableMixin {
  final List<ModelTransaction> dataTransactionSaved;
  final ModelTransaction? selectedTransaction;
  final bool sell;
  final List<ModelItem>? dataItem;
  final List<ModelItem>? filteredItem;
  final List<ModelCategory>? dataCategory;
  final List<ModelBranch>? dataBranch;
  final String? selectedIDBranch;
  final ModelCategory? selectedCategory;
  final ModelItemOrdered? selectedItem;
  final ModelPartner? selectedPartner;
  final bool editSelectedItem;
  final List<ModelItemOrdered>? itemOrdered;
  final List<ModelPartner>? dataPartner;

  TransactionLoaded({
    this.dataTransactionSaved = const [],
    this.sell = true,
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
    this.selectedIDBranch,
    this.selectedCategory,
  });

  TransactionLoaded copyWith({
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
      selectedTransaction: selectedTransaction ?? this.selectedTransaction,
      dataTransactionSaved: dataTransactionSaved ?? this.dataTransactionSaved,
      selectedPartner: selectedPartner ?? selectedPartner,
      dataPartner: dataPartner ?? this.dataPartner,
      sell: sell ?? this.sell,
      editSelectedItem: editSelectedItem ?? this.editSelectedItem,
      itemOrdered: itemOrdered ?? this.itemOrdered,
      selectedItem: selectedItem,
      dataItem: dataItem ?? this.dataItem,
      dataBranch: dataBranch ?? this.dataBranch,
      dataCategory: dataCategory ?? this.dataCategory,
      filteredItem: filteredItem ?? this.filteredItem,
      selectedIDBranch: selectedIDBranch ?? this.selectedIDBranch,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [
    selectedTransaction,
    dataTransactionSaved,
    selectedPartner,
    dataPartner,
    sell,
    dataItem,
    filteredItem,
    dataCategory,
    dataBranch,
    selectedIDBranch,
    selectedCategory,
    selectedItem,
    editSelectedItem,
    itemOrdered,
  ];
}
