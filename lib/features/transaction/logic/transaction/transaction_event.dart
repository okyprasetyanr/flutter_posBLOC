import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_partner.dart';

class TransactionEvent {}

class TransactionGetData extends TransactionEvent {
  final String? idBranch;

  TransactionGetData({required this.idBranch});
}

class TransactionResetSelectedItem extends TransactionEvent {}

class TransactionResetOrderedItem extends TransactionEvent {}

class TransactionSelectedItem extends TransactionEvent {
  final ModelItemOrdered selectedItem;
  final bool edit;

  TransactionSelectedItem({required this.edit, required this.selectedItem});
}

class TransactionSelectedCondiment extends TransactionEvent {
  final ModelItemOrdered selectedCondiment;
  final bool add;

  TransactionSelectedCondiment({
    required this.selectedCondiment,
    required this.add,
  });
}

class TransactionSearchItem extends TransactionEvent {
  final String text;

  TransactionSearchItem({required this.text});
}

class TransactionSelectedKategoriItem extends TransactionEvent {
  final ModelKategori selectedKategori;

  TransactionSelectedKategoriItem({required this.selectedKategori});
}

class TransactionUpdateOrderedItem extends TransactionEvent {
  final ModelItemOrdered updatedItem;

  TransactionUpdateOrderedItem({required this.updatedItem});
}

class TransactionAddOrderedItem extends TransactionEvent {}

class TransactionAdjustItem extends TransactionEvent {
  bool? mode;
  double? qty;
  int? discount;
  double? customprice;
  String? note;

  TransactionAdjustItem({
    this.mode,
    this.qty,
    this.discount,
    this.customprice,
    this.note,
  });
}

class TransactionSelectedPartner extends TransactionEvent {
  final ModelPartner selectedPartner;

  TransactionSelectedPartner({required this.selectedPartner});
}

class TransactionDeleteItemOrdered extends TransactionEvent {}

class TransactionStatusTransaction extends TransactionEvent {}
