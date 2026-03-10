import 'package:flutter_pos/model_data/isar/ModelBase/model_transaction_financial_isar_isar.dart';
import 'package:isar/isar.dart';
part 'model_transaction_financial_expense_isar.g.dart';

@collection
class ModelTransactionFinancialExpenseIsar
    extends ModelTransactionFinancialBaseIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String invoice;
  @Index()
  late String idBranch;
}
