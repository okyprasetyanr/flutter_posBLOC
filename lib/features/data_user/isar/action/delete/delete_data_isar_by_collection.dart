import 'package:flutter_pos/features/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_category_isar.dart';
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
import 'package:flutter_pos/service/isar_service.dart';

Future<void> deleteBatchCollection() async {
  await isar.writeTxn(() async {
    await isar.modelBatchIsars.clear();
  });
}

Future<void> deleteCategoryCollection() async {
  await isar.writeTxn(() async {
    await isar.modelCategoryIsars.clear();
  });
}

Future<void> deleteCounterCollection() async {
  await isar.writeTxn(() async {
    await isar.modelCounterIsars.clear();
  });
}

Future<void> deleteFinancialCollection() async {
  await isar.writeTxn(() async {
    await isar.modelIncomeIsars.clear();
    await isar.modelExpenseIsars.clear();
  });
}

Future<void> deleteItemCollection() async {
  await isar.writeTxn(() async {
    await isar.modelItemIsars.clear();
  });
}

Future<void> deletePartnerCollection() async {
  await isar.writeTxn(() async {
    await isar.modelSupplierIsars.clear();
    await isar.modelCustomerIsars.clear();
  });
}

Future<void> deleteTransactionBuyCollection() async {
  await isar.writeTxn(() async {
    await isar.modelTransactionBuyIsars.clear();
  });
}

Future<void> deleteTransactionSellCollection() async {
  await isar.writeTxn(() async {
    await isar.modelTransactionSellIsars.clear();
  });
}

Future<void> deleteTransactionFinancialIncomeCollection() async {
  await isar.writeTxn(() async {
    await isar.modelTransactionFinancialIncomeIsars.clear();
  });
}

Future<void> deleteTransactionFinancialExpenseCollection() async {
  await isar.writeTxn(() async {
    await isar.modelTransactionFinancialExpenseIsars.clear();
  });
}
