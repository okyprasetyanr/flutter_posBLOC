import 'package:isar/isar.dart';

part 'model_item_batch_isar.g.dart';

@embedded
class ModelItemBatchIsar {
  late String invoice;
  late String idOrdered;

  late double priceitemBuy;
  late String nameItem;
  late String idBranch;
  late String idItem;
  late String idCategoryItem;
  late String note;
  late DateTime date_buy;
  late DateTime? expiredDate;
  late int discountItem;
  late double qtyItem_in;
  late double qtyItem_out;
  late double priceItem;
  late double subTotal;
  late double priceItemFinal;
}
