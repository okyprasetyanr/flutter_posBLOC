import 'package:flutter/widgets.dart';
import 'package:flutter_pos/enum/enum.dart';

class PaymentEvent {}

class PaymentAdjust extends PaymentEvent {
  final String? bankName;
  final int? discount;
  final int? ppn;
  final String? paymentMethod;
  final int? charge;
  final double? billPaid;
  final double? billPaidSplitCash;
  final double? billPaidSplitDebit;

  PaymentAdjust({
    this.billPaidSplitCash,
    this.billPaidSplitDebit,
    this.discount,
    this.ppn,
    this.paymentMethod,
    this.charge,
    this.billPaid,
    this.bankName,
  });
}

class PaymentNote extends PaymentEvent {
  final String note;

  PaymentNote({required this.note});
}

class PaymentGetTransaction extends PaymentEvent {
  final BuildContext context;

  PaymentGetTransaction({required this.context});
}

class PaymentProcess extends PaymentEvent {
  final ListStatusTransaction statusTransaction;
  final BuildContext context;

  PaymentProcess({required this.statusTransaction, required this.context});
}

class PaymentResetSplit extends PaymentEvent {}

class PaymentResetTransaction extends PaymentEvent {}
