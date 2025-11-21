import 'package:flutter_pos/model_data/model_transaction_financial.dart';

class TransFinanctialEvent {}

class TransFinancialGetData extends TransFinanctialEvent {
  final String? idBranch;
  final bool? isIncome;

  TransFinancialGetData({this.idBranch, this.isIncome});
}

class TransFinancialSelectedFinancial extends TransFinanctialEvent {
  final ModelTransactionFinancial selectedFinancial;

  TransFinancialSelectedFinancial({required this.selectedFinancial});
}

class TransFinancialUploadTrans extends TransFinanctialEvent {
  final ModelTransactionFinancial uploadTransFinancial;

  TransFinancialUploadTrans({required this.uploadTransFinancial});
}

class TransFinancialResetSelected extends TransFinanctialEvent {}

class TransFinancialStatusFinancial extends TransFinanctialEvent {}

class TransFinancialSearch extends TransFinanctialEvent {
  final String search;

  TransFinancialSearch({required this.search});
}
