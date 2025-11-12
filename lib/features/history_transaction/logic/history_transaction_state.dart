import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class HistoryTransactionState {}

class HistoryTransactionInitial extends HistoryTransactionState {}

class HistoryTransactionLoading extends HistoryTransactionState {}

class HistoryTransactionLoaded extends HistoryTransactionState
    with EquatableMixin {
  final String? idBranch;
  final List<ModelTransaction> filteredSell;
  final List<ModelTransaction> filteredBuy;
  final ModelTransaction? selectedData;
  final bool isSell;

  HistoryTransactionLoaded({
    this.filteredSell = const [],
    this.filteredBuy = const [],
    this.selectedData,
    this.idBranch,
    this.isSell = true,
  });

  HistoryTransactionLoaded copyWith({
    String? idBranch,
    List<ModelTransaction>? filteredSell,
    List<ModelTransaction>? filteredBuy,
    ModelTransaction? selectedData,
    bool? isSell,
  }) => HistoryTransactionLoaded(
    idBranch: idBranch??this.idBranch,
    filteredBuy: filteredBuy ?? this.filteredBuy,
    filteredSell: filteredSell ?? this.filteredSell,
    isSell: isSell ?? this.isSell,
    selectedData: selectedData ?? this.selectedData,
  );

  @override
  List<Object?> get props => [idBranch,filteredSell, filteredBuy, selectedData, isSell];
}
