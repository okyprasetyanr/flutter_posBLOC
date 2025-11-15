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
  final DateTime? dateStart;
  final DateTime? dateEnd;

  HistoryTransactionLoaded({
    this.dateEnd,
    this.dateStart,
    this.filteredSell = const [],
    this.filteredBuy = const [],
    this.selectedData,
    this.idBranch,
    this.isSell = true,
  });

  HistoryTransactionLoaded copyWith({
    DateTime? dateFiltered,
    DateTime? dateEnd,
    String? idBranch,
    List<ModelTransaction>? filteredSell,
    List<ModelTransaction>? filteredBuy,
    ModelTransaction? selectedData,
    bool? isSell,
  }) => HistoryTransactionLoaded(
    dateEnd: dateEnd,
    dateStart: dateFiltered,
    idBranch: idBranch ?? this.idBranch,
    filteredBuy: filteredBuy ?? this.filteredBuy,
    filteredSell: filteredSell ?? this.filteredSell,
    isSell: isSell ?? this.isSell,
    selectedData: selectedData,
  );

  @override
  List<Object?> get props => [
    dateStart,
    dateEnd,
    idBranch,
    filteredSell,
    filteredBuy,
    selectedData,
    isSell,
  ];
}
