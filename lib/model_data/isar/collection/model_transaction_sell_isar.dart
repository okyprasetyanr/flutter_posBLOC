import 'package:flutter_pos/model_data/isar/ModelBase/model_transaction_base_isar.dart';
import 'package:flutter_pos/model_data/isar/embedded/model_item_ordered_batch_isar.dart';
import 'package:flutter_pos/model_data/isar/embedded/model_item_ordered_isar.dart';
import 'package:flutter_pos/model_data/isar/embedded/model_split_isar.dart';
import 'package:isar/isar.dart';

part 'model_transaction_sell_isar.g.dart';

@collection
class ModelTransactionSellIsar extends ModelTransactionIsarBase {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  @override
  late String invoice;

  @Index()
  @override
  late String idBranch;
}
