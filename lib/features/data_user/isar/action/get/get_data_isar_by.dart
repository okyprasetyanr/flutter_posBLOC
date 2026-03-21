import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_expense_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_supplier_isar.dart';
import 'package:flutter_pos/features/hive_setup/saved_transaction/model_transaction_save.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_category_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_counter_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_income_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_customer_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_buy_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_expense_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_income_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_sell_isar.dart';
import 'package:flutter_pos/from_and_to_map/from_isar.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_counter.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/service/isar_service.dart';
import 'package:hive/hive.dart';
import 'package:isar/isar.dart';

Future<List<ModelBatch>> getBatchIsar(String idBranch) async {
  return fromIsarBatchToList(
    await isar.modelBatchIsars.where().idBranchEqualTo(idBranch).findAll(),
  );
}

Future<List<ModelBatchIsar>> getBatchIsarRaw(String idBranch) async {
  return await isar.modelBatchIsars.where().idBranchEqualTo(idBranch).findAll();
}

Future<ModelBatchIsar> getBatchIsarByInvoice(String invoice) async {
  return (await isar.modelBatchIsars
      .where()
      .invoiceEqualTo(invoice)
      .findFirst())!;
}

Future<List<ModelItem>> getItembyStatus({
  required StatusData status,
  required String idBranch,
}) async {
  final allItem = await isar.writeTxn(
    () async => await isar.modelItemIsars
        .where()
        .idBranchEqualTo(idBranch)
        .filter()
        .statusItemEqualTo(status.name)
        .findAll(),
  );
  return fromIsarItem(allItem, idBranch);
}

Future<List<ModelItemBatch>> getItemBatchIsar(String idBranch) async {
  final itemBatchProperty = await isar.modelBatchIsars
      .where()
      .idBranchEqualTo(idBranch)
      .itemsBatchProperty()
      .findAll();

  final flatData = itemBatchProperty.expand((list) => list).toList();

  return await flatData.map((e) => fromIsarItemBatch(e)).toList();
}

Future<List<ModelCategory>> getCategoryIsar(String idBranch) async {
  final allCategory = await isar.modelCategoryIsars
      .filter()
      .idBranchEqualTo(idBranch)
      .findAll();

  return allCategory.map((element) => fromIsarCategory(element)).toList();
}

Future<ModelCounter> getCounterIsar(String idBranch) async {
  final allCounter = await isar.modelCounterIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findFirst();
  return ModelCounter(
    counterSellSaved: await Hive.box<TransactionSavedHive>(
      'saved_transaction',
    ).length,
    counterSell: allCounter!.counterSell,
    counterBuy: allCounter.counterBuy,
    counterIncome: allCounter.counterIncome,
    counterExpense: allCounter.counterExpense,
    idBranch: allCounter.idBranch,
  );
}

Future<List<ModelFinancial>> getIncomeIsar(String idBranch) async {
  final allIncome = await isar.modelIncomeIsars.where().findAll();
  return allIncome.map((e) => fromIsarFinancial(object: e)).toList();
}

Future<List<ModelFinancial>> getExpenseIsar(String idBranch) async {
  final allExpense = await isar.modelExpenseIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return allExpense.map((e) => fromIsarFinancial(object: e)).toList();
}

Future<List<ModelItem>> getItemIsar(String idBranch) async {
  final allItem = await fromIsarItem(
    await isar.modelItemIsars.where().idBranchEqualTo(idBranch).findAll(),
    idBranch,
  );

  return allItem;
}

Future<List<ModelPartner>> getCustomerIsar(String idBranch) async {
  final allCustomer = await isar.modelCustomerIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return allCustomer.map((e) => fromIsarPartner(object: e)).toList();
}

Future<List<ModelPartner>> getSupplierIsar(String idBranch) async {
  final allSupplier = await isar.modelSupplierIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return allSupplier.map((e) => fromIsarPartner(object: e)).toList();
}

Future<List<ModelTransaction>> getTransactionBuyIsar(String idBranch) async {
  final allTransactionBuy = await isar.modelTransactionBuyIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return allTransactionBuy.map((e) => fromIsarTransaction(object: e)).toList();
}

Future<List<ModelTransaction>> getTransactionSellIsar(String idBranch) async {
  final allTransactionSell = await isar.modelTransactionSellIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return allTransactionSell.map((e) => fromIsarTransaction(object: e)).toList();
}

Future<List<ModelTransactionFinancial>> getTransactionFinancialIncome(
  String idBranch,
) async {
  final allTransactionFinancialIncome = await isar
      .modelTransactionFinancialIncomeIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return allTransactionFinancialIncome
      .map((e) => fromIsarTransactionFinancial(object: e))
      .toList();
}

Future<List<ModelTransactionFinancial>> getTransactionFinancialExpense(
  String idBranch,
) async {
  final allTransactionFinancialExpense = await isar
      .modelTransactionFinancialExpenseIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return allTransactionFinancialExpense
      .map((e) => fromIsarTransactionFinancial(object: e))
      .toList();
}
