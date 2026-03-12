import 'package:isar/isar.dart';
part 'model_financial_isar.g.dart';

@collection
class ModelFinancialIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String idFinancial;
  @Index()
  late String idBranch;

  late String type;
  late String nameFinancial;
}
