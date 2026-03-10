import 'package:flutter_pos/model_data/isar/embedded/model_item_ordered_batch_isar.dart';
import 'package:isar/isar.dart';
part 'model_item_ordered_isar.g.dart';

@embedded
class ModelItemOrderedIsar {
  late String idOrdered;
  late String? invoice;

  late DateTime? dateBuy;
  late DateTime? expiredDate;
  late double priceItemFinal;
  late double subTotal;
  late String nameItem;
  late String idItem;
  late String idBranch;
  late double qtyItem;
  late double priceItem;
  late double priceItemBuy;
  late int discountItem;
  late String idCategoryItem;
  late String note;
  List<ModelItemOrderedBatchIsar> itemOrderedBatch = [];
  List<ModelItemOrderedIsar> condiment = [];
}
