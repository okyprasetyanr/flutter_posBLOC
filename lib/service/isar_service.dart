import 'package:flutter_pos/features/data_user/isar/collection/model_account_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_category_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_company_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_counter_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_expense_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_income_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_customer_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_supplier_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_buy_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_expense_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_income_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_sell_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_user_isar.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

late final Isar isar;

class IsarService {
  static Future<void> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [
        ModelBatchIsarSchema,
        ModelCategoryIsarSchema,
        ModelCompanyIsarSchema,
        ModelCounterIsarSchema,
        ModelIncomeIsarSchema,
        ModelExpenseIsarSchema,
        ModelItemIsarSchema,
        ModelTransactionBuyIsarSchema,
        ModelTransactionFinancialExpenseIsarSchema,
        ModelTransactionFinancialIncomeIsarSchema,
        ModelTransactionSellIsarSchema,
        ModelUserIsarSchema,
        ModelAccountIsarSchema,
        ModelCustomerIsarSchema,
        ModelSupplierIsarSchema,
      ],
      directory: dir.path,
      inspector: true,
    );
  }
}
