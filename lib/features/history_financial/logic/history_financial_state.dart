import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';

class HistoryFinancialState {}

class HistoryFinancialInitial extends HistoryFinancialState {}

class HistoryFinancialLoaded extends HistoryFinancialState with EquatableMixin {
  final List<ModelTransactionFinancial> dataTransaction;
  final List<ModelTransactionFinancial> filteredData;
  final String? idBranch;
  final ModelTransactionFinancial? selectedData;
  final bool isIncome;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String search;
  final int indexFilter;

  HistoryFinancialLoaded({
    this.indexFilter = 0,
    this.search = "",
    this.dataTransaction = const [],
    this.filteredData = const [],
    this.idBranch,
    this.selectedData,
    this.isIncome = true,
    this.dateStart,
    this.dateEnd,
  });

  HistoryFinancialLoaded copyWith({
    List<ModelTransactionFinancial>? dataTransaction,
    List<ModelTransactionFinancial>? filteredData,
    String? idBranch,
    ModelTransactionFinancial? selectedData,
    bool? isIncome,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? search,
    int? indexFilter,
  }) {
    return HistoryFinancialLoaded(
      indexFilter: indexFilter ?? this.indexFilter,
      search: search ?? this.search,
      dataTransaction: dataTransaction ?? this.dataTransaction,
      dateEnd: dateEnd,
      dateStart: dateStart,
      filteredData: filteredData ?? this.filteredData,
      idBranch: idBranch ?? this.idBranch,
      isIncome: isIncome ?? this.isIncome,
      selectedData: selectedData,
    );
  }

  @override
  List<Object?> get props => [
    search,
    indexFilter,
    dataTransaction,
    filteredData,
    idBranch,
    selectedData,
    isIncome,
    dateStart,
    dateEnd,
  ];
}
