import 'package:flutter_pos/features/data_user/isar/ModelBase/model_financial_base_isar.dart';
import 'package:isar/isar.dart';
part 'model_income_isar.g.dart';

@collection
class ModelIncomeIsar extends ModelFinancialBaseIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String idFinancial;
  @Index()
  late String idBranch;
}
