import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/from_and_to_map/from_isar.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/service/isar_service.dart';
import 'package:isar/isar.dart';

Future<List<ModelItem>> getItembyStatus({
  required StatusData status,
  required String idBranch,
}) async {
  final allItem = await isar.writeTxn(
    () async => await isar.modelItemIsars
        .where()
        .idBranchEqualTo(idBranch)
        .filter()
        .statusItemEqualTo(status.name)
        .findAll(),
  );
  return fromIsarItem(allItem);
}
