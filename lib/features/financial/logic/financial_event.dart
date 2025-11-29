import 'package:flutter_pos/model_data/model_financial.dart';

class FinancialEvent {}

class FinancialGetData extends FinancialEvent {
  final bool? isIncome;
  final String? idBranch;

  FinancialGetData({this.isIncome, this.idBranch});
}

class FinancialSelectedFinancial extends FinancialEvent {
  final ModelFinancial selectedFinancial;

  FinancialSelectedFinancial({required this.selectedFinancial});
}

class FinancialUploadDataFinancial extends FinancialEvent {
  final ModelFinancial financial;

  FinancialUploadDataFinancial({required this.financial});
}

class FinancialStatusFinancial extends FinancialEvent {}

class FinancialResetSelectedFinancial extends FinancialEvent {}

class FinancialDeleteFinancial extends FinancialEvent {
  final ModelFinancial data;

  FinancialDeleteFinancial({required this.data});
}

class FinancialIsIncome extends FinancialEvent {}

class FinancialSearch extends FinancialEvent {
  final String search;

  FinancialSearch({required this.search});
}
