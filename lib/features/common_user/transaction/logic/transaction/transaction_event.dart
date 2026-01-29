import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class TransactionEvent {}

class TransactionGetData extends TransactionEvent {
  final String? idBranch;

  TransactionGetData({this.idBranch});
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

class TransactionSelectedCategoryItem extends TransactionEvent {
  final ModelCategory selectedCategory;

  TransactionSelectedCategoryItem({required this.selectedCategory});
}

class TransactionUpdateOrderedItem extends TransactionEvent {
  final ModelItemOrdered updatedItem;

  TransactionUpdateOrderedItem({required this.updatedItem});
}

class TransactionAddOrderedItem extends TransactionEvent {
  final List<ModelItemOrdered>? orderedItem;

  TransactionAddOrderedItem({this.orderedItem});
}

class TransactionLoadTransaction extends TransactionEvent {
  final ModelTransaction currentTransaction;
  final bool? revision;

  TransactionLoadTransaction({this.revision, required this.currentTransaction});
}

class TransactionAdjustItem extends TransactionEvent {
  ModelItemOrdered? selectedItem;
  bool? mode;
  double? qty;
  int? discount;
  double? customPrice;
  double? secondCustomPrice;
  String? note;
  String? expiredDate;

  TransactionAdjustItem({
    this.selectedItem,
    this.expiredDate,
    this.mode,
    this.qty,
    this.discount,
    this.customPrice,
    this.secondCustomPrice,
    this.note,
  });
}

class TransactionSelectedPartner extends TransactionEvent {
  final ModelPartner selectedPartner;

  TransactionSelectedPartner({required this.selectedPartner});
}

class TransactionDeleteItemOrdered extends TransactionEvent {}

class TransactionDeleteItemSaved extends TransactionEvent {
  final String invoice;

  TransactionDeleteItemSaved({required this.invoice});
}

class TransactionStatusTransaction extends TransactionEvent {}
