import 'package:flutter_pos/features/data_user/isar/collection/model_user_isar.dart';
import 'package:flutter_pos/service/isar_service.dart';
import 'package:isar/isar.dart';

Future<bool> checkUserById_Isar(String idUser) async {
  return await isar.modelUserIsars.where().idUserEqualTo(idUser).count() > 0;
}
