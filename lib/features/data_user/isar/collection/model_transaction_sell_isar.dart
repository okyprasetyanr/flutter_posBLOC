import 'package:flutter_pos/features/data_user/isar/ModelBase/model_transaction_base_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_item_ordered_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_item_ordered_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_split_isar.dart';
import 'package:isar/isar.dart';

part 'model_transaction_sell_isar.g.dart';

@collection
class ModelTransactionSellIsar extends ModelTransactionBaseIsar {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  late String invoice;

  @Index()
  late String idBranch;
}
