import 'package:flutter_pos/features/data_user/isar/ModelBase/model_user_base_isar.dart';
import 'package:isar/isar.dart';

part 'model_user_isar.g.dart';

@collection
class ModelUserIsar extends ModelUserBaseIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String idUser;
  @Index()
  late String? idBranchUser;
}
