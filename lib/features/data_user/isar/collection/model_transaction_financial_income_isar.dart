import 'package:flutter_pos/features/data_user/isar/ModelBase/model_transaction_financial_base_isar.dart';
import 'package:isar/isar.dart';
part 'model_transaction_financial_income_isar.g.dart';

@collection
class ModelTransactionFinancialIncomeIsar
    extends ModelTransactionFinancialBaseIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String invoice;
  @Index()
  late String idBranch;
}
