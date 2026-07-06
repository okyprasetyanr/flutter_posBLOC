import 'package:flutter_pos/core/data_user/isar/ModelBase/model_transaction_financial_base_isar.dart';
import 'package:isar/isar.dart';
part 'model_transaction_financial_expense_isar.g.dart';

@collection
class ModelTransactionFinancialExpenseIsar
    extends ModelTransactionFinancialBaseIsar {
  Id isarId = Isar.autoIncrement;
}
