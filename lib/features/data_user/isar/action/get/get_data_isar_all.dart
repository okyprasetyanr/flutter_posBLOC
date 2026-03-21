import 'package:flutter/material.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_account_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_category_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_company_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_customer_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_expense_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_income_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_supplier_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_buy_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_expense_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_income_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_sell_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_user_isar.dart';
import 'package:flutter_pos/from_and_to_map/from_isar.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_company.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/service/isar_service.dart';
import 'package:isar/isar.dart';

Future<List<ModelUser>> getAllUserIsar() async {
  final allUser = await isar.modelUserIsars.where().findAll();
  final finalAllUser = await allUser.map((e) => fromIsarUser(e)).toList();
  finalAllUser.add(await getAllAccountIsar());
  return await finalAllUser;
}

Future<ModelCompany> getAllCompanyIsar() async {
  final company = await isar.modelCompanyIsars.where().findFirst();
  return await fromIsarCompany(company!);
}

Future<ModelUser> getAllAccountIsar() async {
  final account = await isar.modelAccountIsars.where().findFirst();
  return await fromIsarUser(account!);
}

Future<List<ModelBranch>> getAllListBranchIsar() async {
  final company = await getAllCompanyIsar();
  return await company.getListBranch;
}

Future<List<ModelBatch>> getAllBatchIsar() async {
  return await fromIsarBatchToList(
    await isar.modelBatchIsars.where().findAll(),
  );
}

Future<List<ModelItem>> getAllItemIsar() async {
  return await fromIsarItem(
    await isar.modelItemIsars.where().findAll(),
    null,
    getAll: false,
  );
}

Future<List<ModelCategory>> getAllCategoryIsar() async {
  final dataCategory = await isar.modelCategoryIsars.where().findAll();
  return await dataCategory.map((e) => fromIsarCategory(e)).toList();
}

Future<List<ModelPartner>> getAllCustomer_Isar() async {
  final dataCustomer = await isar.modelCustomerIsars.where().findAll();
  return await dataCustomer.map((e) => fromIsarPartner(object: e)).toList();
}

Future<List<ModelPartner>> getAllSupplier_Isar() async {
  final dataSupplier = await isar.modelSupplierIsars.where().findAll();
  return await dataSupplier.map((e) => fromIsarPartner(object: e)).toList();
}

Future<List<ModelFinancial>> getAllIncome_Isar() async {
  final dataIncome = await isar.modelIncomeIsars.where().findAll();
  return await dataIncome.map((e) => fromIsarFinancial(object: e)).toList();
}

Future<List<ModelFinancial>> getAllExpense_Isar() async {
  final dataExpense = await isar.modelExpenseIsars.where().findAll();
  return await dataExpense.map((e) => fromIsarFinancial(object: e)).toList();
}

Future<List<ModelTransaction>> getAllTransactionSell_Isar() async {
  final dataTransactionSell = await isar.modelTransactionSellIsars
      .where()
      .findAll();
  return await dataTransactionSell
      .map((e) => fromIsarTransaction(object: e))
      .toList();
}

Future<List<ModelTransaction>> getAllTransactionBuy_Isar() async {
  final dataTransactionBuy = await isar.modelTransactionBuyIsars
      .where()
      .findAll();
  return await dataTransactionBuy
      .map((e) => fromIsarTransaction(object: e))
      .toList();
}

Future<List<ModelTransactionFinancial>> getAllTransactionIncome_Isar() async {
  final dataIncome = await isar.modelTransactionFinancialIncomeIsars
      .where()
      .findAll();
  return await dataIncome
      .map((e) => fromIsarTransactionFinancial(object: e))
      .toList();
}

Future<List<ModelTransactionFinancial>> getAllTransactionExpense_Isar() async {
  final dataExpense = await isar.modelTransactionFinancialExpenseIsars
      .where()
      .findAll();
  return await dataExpense
      .map((e) => fromIsarTransactionFinancial(object: e))
      .toList();
}
