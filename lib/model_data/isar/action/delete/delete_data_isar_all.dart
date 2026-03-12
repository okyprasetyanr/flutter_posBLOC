import 'package:flutter_pos/service/isar_service.dart';

Future<void> deleteAllDataIsar(String idCategory) async {
  await isar.writeTxn(() async => await isar.clear());
}
