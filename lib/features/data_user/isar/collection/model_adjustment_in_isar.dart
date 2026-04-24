import 'package:isar/isar.dart';

part 'model_adjustment_in_isar.g.dart';

@collection
class ModelAdjustmentInIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String invoice;
  @Index()
  late String idBranch;

  late DateTime date;
  late double qty_in;
  late double sellPrice;
  late double buyPrice;
  late DateTime expiredDate;
  late String note;
}
