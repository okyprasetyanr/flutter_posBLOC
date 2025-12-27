import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';

class HistoryFinancialEvent {}

class HistoryFinancialGetData extends HistoryFinancialEvent {
  final bool? isIncome;
  final String? idBranch;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  HistoryFinancialGetData({
    this.isIncome,
    this.idBranch,
    this.dateStart,
    this.dateEnd,
  });
}

class HistoryFinancialSelectedData extends HistoryFinancialEvent {
  final ModelTransactionFinancial selectedData;

  HistoryFinancialSelectedData({required this.selectedData});
}

class HistoryFinancialResetSelectedData extends HistoryFinancialEvent {}

class HistoryFinancialPrint extends HistoryFinancialEvent {}

class HistoryFinancialSearchData extends HistoryFinancialEvent {
  final String search;

  HistoryFinancialSearchData({required this.search});
}

class HistoryFinancialCancelData extends HistoryFinancialEvent {}

class HistoryFinancialSelectedFilter extends HistoryFinancialEvent {
  final ListStatusTransactionFinancial filter;

  HistoryFinancialSelectedFilter({required this.filter});
}
