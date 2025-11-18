import 'package:flutter_pos/model_data/model_financial.dart';

class FinancialEvent {}

class FinancialGetData extends FinancialEvent {
  final bool? isIncome;
  final String? idBranch;

  FinancialGetData({required this.isIncome, required this.idBranch});
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

class FinancialDeleteFinancial extends FinancialEvent {}

class FinancialIsIncome extends FinancialEvent {}
