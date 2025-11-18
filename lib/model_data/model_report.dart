import 'package:equatable/equatable.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_report_summary.dart';

class ModelReport extends Equatable {
  final double ppnAmount,
      chargeAmount,
      discountAmount,
      grossSales,
      netSales,
      cashInDrawer,
      openingBalance,
      income,
      expense;
  final ModelReportSummary summary;

  ModelReport({
    required this.summary,
    required this.ppnAmount,
    required this.chargeAmount,
    required this.discountAmount,
    required this.grossSales,
    required this.netSales,
    required this.cashInDrawer,
    required this.openingBalance,
    required this.income,
    required this.expense,
  });

  ModelReportSummary get getsummary => summary;
  String get getppnAmount => formatPriceRp(ppnAmount);
  String get getchargeAmount => formatPriceRp(chargeAmount);
  String get getdiscountAmount => formatPriceRp(discountAmount);
  String get getgrossSales => formatPriceRp(grossSales);
  String get getnetSales => formatPriceRp(netSales);
  String get getcashInDrawer => formatPriceRp(cashInDrawer);
  String get getopeningBalance => formatPriceRp(openingBalance);
  String get getincome => formatPriceRp(income);
  String get getexpense => formatPriceRp(expense);

  @override
  List<Object?> get props => [
    ppnAmount,
    chargeAmount,
    discountAmount,
    grossSales,
    netSales,
    cashInDrawer,
    openingBalance,
    income,
    expense,
    summary,
  ];
}
