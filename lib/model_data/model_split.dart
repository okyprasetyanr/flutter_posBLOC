import 'package:equatable/equatable.dart';
import 'package:flutter_pos/enum/enum.dart';

class ModelSplit extends Equatable {
  final String? paymentInvoice;
  final LabelPaymentMethod _paymentName;
  final String? paymentDebitName;
  final double _paymentTotal;

  ModelSplit({
    this.paymentInvoice,
    this.paymentDebitName,
    required LabelPaymentMethod paymentName,
    required double paymentTotal,
  }) : _paymentName = paymentName,
       _paymentTotal = paymentTotal;

  String? get getpaymentInvoice => paymentInvoice;
  LabelPaymentMethod get getpaymentName => _paymentName;
  String? get getpaymentDebitName => paymentDebitName;
  double get getpaymentTotal => _paymentTotal;

  ModelSplit copyWith({
    String? paymentInvoice,
    LabelPaymentMethod? paymentName,
    String? paymentDebitName,
    double? paymentTotal,
  }) {
    return ModelSplit(
      paymentInvoice: paymentInvoice ?? this.paymentInvoice,
      paymentDebitName: paymentDebitName ?? this.paymentDebitName,
      paymentName: paymentName ?? _paymentName,
      paymentTotal: paymentTotal ?? _paymentTotal,
    );
  }

  @override
  List<Object?> get props => [
    _paymentName,
    _paymentTotal,
    paymentDebitName,
    paymentInvoice,
  ];
}
