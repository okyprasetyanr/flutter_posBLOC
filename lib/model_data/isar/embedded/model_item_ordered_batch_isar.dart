import 'package:isar/isar.dart';
part 'model_item_ordered_batch_isar.g.dart';

@embedded
class ModelItemOrderedBatchIsar {
  late String id_ordered;
  late String invoice;

  late String id_item;
  late double qty_item;
  late double price_item;
  late double price_itemBuy;
  late bool isNegative;
}
