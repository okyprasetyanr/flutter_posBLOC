import 'package:isar/isar.dart';

part 'model_transaction_adjustment_out_isar.g.dart';

@collection
class ModelTransactionAdjustmentOutIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String invoice;
  @Index()
  late String idBranch;

  late String itemName;
  late String itemInvoice;
  late DateTime date;
  late double? qty_out_after;
  late double? qty_out_before;
  late String note;
}
