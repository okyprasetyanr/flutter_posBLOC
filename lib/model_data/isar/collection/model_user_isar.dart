import 'package:flutter_pos/model_data/isar/embedded/model_permission_user_isar.dart';
import 'package:isar/isar.dart';

part 'model_user_isar.g.dart';

@collection
class ModelUserIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String idUser;
  @Index()
  late String? idBranchUser;

  late String statusUser;
  late String roleUser;
  late String nameUser;
  late String emailUser;
  late String phoneUser;
  List<ModelPermissionUserIsar> permissionsUser = [];
  late DateTime? createdUser;
  late String? noteUser;
}
