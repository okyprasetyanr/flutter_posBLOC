import 'package:flutter_pos/features/data_user/isar/collection/model_category_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_income_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_customer_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_supplier_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_buy_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_expense_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_income_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_sell_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_user_isar.dart';
import 'package:flutter_pos/service/isar_service.dart';
import 'package:isar/isar.dart';

Future<void> deleteCategoryById(String idCategory) async {
  await isar.writeTxn(
    () async => await isar.modelCategoryIsars
        .filter()
        .idCategoryEqualTo(idCategory)
        .deleteAll(),
  );
}

Future<void> deleteIncomeById(String idFinancial) async {
  await isar.writeTxn(
    () async => await isar.modelIncomeIsars
        .filter()
        .idFinancialEqualTo(idFinancial)
        .deleteAll(),
  );
}

Future<void> deleteExpenseById(String idFinancial) async {
  await isar.writeTxn(
    () async => await isar.modelIncomeIsars
        .filter()
        .idFinancialEqualTo(idFinancial)
        .deleteAll(),
  );
}

Future<void> deleteItemById(String idItem) async {
  await isar.writeTxn(
    () async =>
        await isar.modelItemIsars.filter().idItemEqualTo(idItem).deleteAll(),
  );
}

Future<void> deletePartnerById(String idCustomer) async {
  await isar.writeTxn(
    () async => await isar.modelCustomerIsars
        .filter()
        .idPartnerEqualTo(idCustomer)
        .deleteAll(),
  );
}

Future<void> deleteSupplierById(String idSupplier) async {
  await isar.writeTxn(
    () async => await isar.modelSupplierIsars
        .filter()
        .idPartnerEqualTo(idSupplier)
        .deleteAll(),
  );
}

Future<void> deleteTransactionBuyById(String invoice) async {
  await isar.writeTxn(
    () async => await isar.modelTransactionBuyIsars
        .filter()
        .invoiceEqualTo(invoice)
        .deleteAll(),
  );
}

Future<void> deleteTransactionSellById(String invoice) async {
  await isar.writeTxn(
    () async => await isar.modelTransactionSellIsars
        .filter()
        .invoiceEqualTo(invoice)
        .deleteAll(),
  );
}

Future<void> deleteTransactionFinancialIncomeById(String invoice) async {
  await isar.writeTxn(
    () async => await isar.modelTransactionFinancialIncomeIsars
        .filter()
        .invoiceEqualTo(invoice)
        .deleteAll(),
  );
}

Future<void> deleteTransactionFinancialExpenseById(String invoice) async {
  await isar.writeTxn(
    () async => await isar.modelTransactionFinancialExpenseIsars
        .filter()
        .invoiceEqualTo(invoice)
        .deleteAll(),
  );
}

Future<void> deleteUserById(String invoice) async {
  await isar.writeTxn(
    () async =>
        await isar.modelUserIsars.filter().idUserEqualTo(invoice).deleteAll(),
  );
}
