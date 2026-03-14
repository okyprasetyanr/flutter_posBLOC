import 'package:flutter_pos/features/data_user/isar/collection/model_batch_isar.dart';
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

Future<void> deleteCategoryById_Isar(String idCategory) async {
  await isar.writeTxn(
    () async => await isar.modelCategoryIsars.deleteByIdCategory(idCategory),
  );
}

Future<void> deleteIncomeById_Isar(String idFinancial) async {
  await isar.writeTxn(
    () async => await isar.modelIncomeIsars.deleteByIdFinancial(idFinancial),
  );
}

Future<void> deleteExpenseById_Isar(String idFinancial) async {
  await isar.writeTxn(
    () async => await isar.modelIncomeIsars.deleteByIdFinancial(idFinancial),
  );
}

Future<void> deleteItemById_Isar(String idItem) async {
  await isar.writeTxn(
    () async => await isar.modelItemIsars.deleteByIdItem(idItem),
  );
}

Future<void> deletePartnerById_Isar(String idPartner) async {
  await isar.writeTxn(
    () async => await isar.modelCustomerIsars.deleteByIdPartner(idPartner),
  );
}

Future<void> deleteSupplierById_Isar(String idPartner) async {
  await isar.writeTxn(
    () async => await isar.modelSupplierIsars.deleteByIdPartner(idPartner),
  );
}

Future<void> deleteTransactionBuyById_Isar(String invoice) async {
  await isar.writeTxn(
    () async => await isar.modelTransactionBuyIsars.deleteByInvoice(invoice),
  );
}

Future<void> deleteTransactionSellById_Isar(String invoice) async {
  await isar.writeTxn(
    () async => await isar.modelTransactionSellIsars.deleteByInvoice(invoice),
  );
}

Future<void> deleteTransactionFinancialIncomeById_Isar(String invoice) async {
  await isar.writeTxn(
    () async => await isar.modelTransactionFinancialIncomeIsars.deleteByInvoice(
      invoice,
    ),
  );
}

Future<void> deleteTransactionFinancialExpenseById_Isar(String invoice) async {
  await isar.writeTxn(
    () async => await isar.modelTransactionFinancialExpenseIsars
        .deleteByInvoice(invoice),
  );
}

Future<void> deleteUserById_Isar(String idUser) async {
  await isar.writeTxn(
    () async => await isar.modelUserIsars.deleteByIdUser(idUser),
  );
}

Future<void> deleteBatchByInvoice_Isar(String invoice) async {
  await isar.writeTxn(
    () async => await isar.modelBatchIsars.deleteByInvoice(invoice),
  );
}
