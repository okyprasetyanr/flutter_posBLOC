import 'package:flutter_pos/service/isar_service.dart';

Future<void> deleteAllDataIsar() async {
  await isar.writeTxn(() async => await isar.clear());
}
