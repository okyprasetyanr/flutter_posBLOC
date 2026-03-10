import 'package:flutter_pos/model_data/isar/embedded/model_item_batch_isar.dart';
import 'package:isar/isar.dart';

part 'model_batch_isar.g.dart';

@collection
class ModelBatchIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String invoice;
  late String idBranch;
  late DateTime dateBuy;

  List<ModelItemBatchIsar> itemsBatch = [];
}
