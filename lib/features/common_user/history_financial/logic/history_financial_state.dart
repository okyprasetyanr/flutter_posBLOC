import 'package:equatable/equatable.dart';
import 'package:flutter_pos/enum/enum.dart';
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
  final ListStatusTransactionFinancial filter;
  final String displayDate;

  HistoryFinancialLoaded({
    this.displayDate = "Hari ini",
    this.filter = ListStatusTransactionFinancial.All,
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
    String? displayDate,
    List<ModelTransactionFinancial>? dataTransaction,
    List<ModelTransactionFinancial>? filteredData,
    String? idBranch,
    ModelTransactionFinancial? selectedData,
    bool? isIncome,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? search,
    ListStatusTransactionFinancial? indexFilter,
  }) {
    return HistoryFinancialLoaded(
      displayDate: displayDate ?? this.displayDate,
      filter: indexFilter ?? this.filter,
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
    displayDate,
    search,
    filter,
    dataTransaction,
    filteredData,
    idBranch,
    selectedData,
    isIncome,
    dateStart,
    dateEnd,
  ];
}
