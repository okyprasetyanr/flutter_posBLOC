import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class HistoryTransactionState {}

class HistoryTransactionInitial extends HistoryTransactionState {}

class HistoryTransactionLoading extends HistoryTransactionState {}

class HistoryTransactionLoaded extends HistoryTransactionState
    with EquatableMixin {
  final String? idBranch;
  final List<ModelTransaction> filteredData;
  final List<ModelTransaction> dataTransaction;
  final ModelTransaction? selectedData;
  final bool isSell;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  HistoryTransactionLoaded({
    this.dateEnd,
    this.dateStart,
    this.filteredData = const [],
    this.dataTransaction = const [],
    this.selectedData,
    this.idBranch,
    this.isSell = true,
  });

  HistoryTransactionLoaded copyWith({
    DateTime? dateFiltered,
    DateTime? dateEnd,
    String? idBranch,
    List<ModelTransaction>? filteredData,
    List<ModelTransaction>? dataTransaction,
    ModelTransaction? selectedData,
    bool? isSell,
  }) => HistoryTransactionLoaded(
    dateEnd: dateEnd,
    dateStart: dateFiltered,
    idBranch: idBranch ?? this.idBranch,
    filteredData: filteredData ?? this.filteredData,
    dataTransaction: dataTransaction ?? this.dataTransaction,
    isSell: isSell ?? this.isSell,
    selectedData: selectedData,
  );

  @override
  List<Object?> get props => [
    dateStart,
    dateEnd,
    idBranch,
    filteredData,
    dataTransaction,
    selectedData,
    isSell,
  ];
}
