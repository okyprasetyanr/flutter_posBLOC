import 'package:flutter/widgets.dart';

class PaymentEvent {}

class PaymentAdjust extends PaymentEvent {
  final int? discount;
  final int? ppn;
  final String? paymentMethod;
  final int? charge;
  final double? billPaid;

  PaymentAdjust({
    this.discount,
    this.ppn,
    this.paymentMethod,
    this.charge,
    this.billPaid,
  });
}

class PaymentNote extends PaymentEvent {
  final String note;

  PaymentNote({required this.note});
}

class PaymentGetItem extends PaymentEvent {
  final BuildContext context;

  PaymentGetItem({required this.context});
}
