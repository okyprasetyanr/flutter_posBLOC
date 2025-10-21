class PaymentEvent {}

class PaymentAdjust extends PaymentEvent {
  final int? discount;
  final int? ppn;
  final int? paymentMethod;
  final int? charge;
  final int? billPaid;

  PaymentAdjust({
    this.discount,
    this.ppn,
    this.paymentMethod,
    this.charge,
    this.billPaid,
  });
}

class PaymentNote {
  final String note;

  PaymentNote({required this.note});
}

class PaymentGetItem extends PaymentEvent {}
