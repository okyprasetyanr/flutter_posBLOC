import 'package:flutter_pos/model_data/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_category_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_company_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_counter_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_financial_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_partner_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_transaction_buy_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_transaction_financial_expense_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_transaction_financial_income_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_transaction_sell_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_user_isar.dart';
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
        ModelFinancialIsarSchema,
        ModelItemIsarSchema,
        ModelPartnerIsarSchema,
        ModelTransactionBuyIsarSchema,
        ModelTransactionFinancialExpenseIsarSchema,
        ModelTransactionFinancialIncomeIsarSchema,
        ModelTransactionSellIsarSchema,
        ModelUserIsarSchema,
      ],
      directory: dir.path,
      inspector: true,
    );
  }
}
