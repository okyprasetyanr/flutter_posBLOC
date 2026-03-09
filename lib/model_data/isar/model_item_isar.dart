import 'package:isar/isar.dart';
import 'package:flutter_pos/enum/enum.dart';

part 'model_item_isar.g.dart';

@collection
class ModelItemIsar {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  late String idItem;

  late String nameItem;
  late String idCategoryItem;
  late String urlImage;
  late String idBranch;
  late String barcode;

  late DateTime date;

  late double priceItem;
  late double qtyItem;
  late double priceItemBuybyBatch;
  late double priceItemByBatch;

  @enumerated
  late StatusData statusCondiment;

  @enumerated
  late StatusData statusItem;
}
