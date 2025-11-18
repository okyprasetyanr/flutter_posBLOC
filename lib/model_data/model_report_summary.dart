import 'package:equatable/equatable.dart';
import 'package:flutter_pos/function/function.dart';

class ModelReportSummary extends Equatable {
  final double cash;
  final double qris;
  final double debit;

  ModelReportSummary({
    required this.cash,
    required this.qris,
    required this.debit,
  });

  String get getcash => formatPriceRp(cash);
  String get getdebit => formatPriceRp(debit);
  String get getqris => formatPriceRp(qris);

  double get gettotal => cash + qris + debit;

  @override
  List<Object?> get props => [cash, qris, debit];
}
