import 'package:isar/isar.dart';

part 'model_adjustment_out_isar.g.dart';

@collection
class ModelAdjustmentOutIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String invoice;
  @Index()
  late String idBranch;

  late DateTime date;
  late double qty_out;
  late String note;
}
