import 'package:flutter_pos/features/data_user/isar/embedded/model_item_ordered_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_split_isar.dart';

abstract class ModelTransactionBaseIsar {
  late String invoice;
  late String idBranch;
  late String statusTransaction;
  late String paymentMethod;
  late DateTime date;

  String? bankName;
  late String note;

  String? namePartner;
  String? idPartner;
  String? nameOperator;
  String? idOperator;

  late int discount;
  late int ppn;
  late int totalItem;
  late int charge;

  late double subTotal;
  late double billPaid;
  late double totalCharge;
  late double totalPpn;
  late double totalDiscount;
  late double total;

  List<ModelItemOrderedIsar> itemsOrdered = [];
  List<ModelSplitIsar> dataSplit = [];
}
