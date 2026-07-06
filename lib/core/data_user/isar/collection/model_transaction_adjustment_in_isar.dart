import 'package:isar/isar.dart';

part 'model_transaction_adjustment_in_isar.g.dart';

@collection
class ModelTransactionAdjustmentInIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String invoice;
  @Index()
  late String idBranch;

  late DateTime date;
  late String itemName;
  late String itemInvoice;
  late double? qty_in_after;
  late double? qty_in_before;
  late double? sellPriceAfter;
  late double? buyPriceAfter;
  late double? sellPriceBefore;
  late double? buyPriceBefore;
  late DateTime? expiredDateAfter;
  late DateTime? expiredDateBefore;
  late String note;
}
