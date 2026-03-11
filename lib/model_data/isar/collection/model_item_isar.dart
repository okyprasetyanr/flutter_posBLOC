import 'package:isar/isar.dart';

part 'model_item_isar.g.dart';

@collection
class ModelItemIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String idItem;
  @Index()
  late String idBranch;

  late String nameItem;
  late String idCategoryItem;
  late String urlImage;
  late String barcode;
  late DateTime date;
  late double priceItem;
  late double qtyItem;
  late double priceItemBuybyBatch;
  late double priceItemByBatch;
  late String statusCondiment;
  late String statusItem;
}
