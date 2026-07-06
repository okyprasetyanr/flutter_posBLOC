import 'dart:async';

import 'package:flutter_pos/core/data_user/data_user_repository.dart';
import 'package:flutter_pos/core/data_user/isar/action/delete/delete_data_isar_by_collection.dart';
import 'package:flutter_pos/core/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/core/data_user/isar/action/save/save_list_data_isar.dart';
import 'package:flutter_pos/core/data_user/isar/action/save/save_update_data_isar.dart';
import 'package:flutter_pos/core/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/core/data_user/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/core/data_user/isar/collection/model_transaction_buy_isar.dart';
import 'package:flutter_pos/core/data_user/isar/collection/model_transaction_financial_expense_isar.dart';
import 'package:flutter_pos/core/data_user/isar/collection/model_transaction_financial_income_isar.dart';
import 'package:flutter_pos/core/data_user/isar/collection/model_transaction_sell_isar.dart';
import 'package:flutter_pos/core/hive_setup/model_transaction_save.dart';

import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';
import 'package:isar/isar.dart';

class DataUserRepositoryCache {
  final DataUserRepository repo;
  final Isar isar;

  late final Stream<void> onChanged;

  DataUserRepositoryCache(this.repo, this.isar) {
    onChanged = MergeStream([
      isar.modelItemIsars.watchLazy(),
      isar.modelTransactionSellIsars.watchLazy(),
      isar.modelTransactionFinancialIncomeIsars.watchLazy(),
      isar.modelTransactionFinancialExpenseIsars.watchLazy(),
      isar.modelTransactionBuyIsars.watchLazy(),
      isar.modelBatchIsars.watchLazy(),
    ]).debounceTime(const Duration(milliseconds: 200)).asBroadcastStream();
  }

  Future<bool> initData() async {
    await initCompany();
    await initFinancial();
    await initItem();
    await initCategory();
    await initPartner();
    await initTransaction();
    await initBatch();
    await initUser();

    return true;
  }

  Future<void> initCompany() async {
    await saveCompany_Isar(await repo.getCompany());
  }

  Future<void> initFinancial() async {
    await deleteFinancialCollection();
    final dataFinancial = await repo.getFinancial();
    await saveExpense_List_Isar(
      dataFinancial.where((e) => e.isExpense).toList(),
    );
    await saveIncome_List_Isar(dataFinancial.where((e) => e.isIncome).toList());
  }

  Future<void> initTransaction() async {
    await deleteCounterCollection();
    await deleteTransactionSellCollection();
    await deleteTransactionBuyCollection();
    await deleteTransactionFinancialIncomeCollection();
    await deleteTransactionFinancialExpenseCollection();
    await deleteTransactionAdjustmentIn();
    await deleteTransactionAdjustmentOut();
    await saveTransactionSell_List_Isar(await repo.getTransactionSell());
    await saveTransactionBuy_List_Isar(await repo.getTransactionBuy());
    await saveTransactionFinancialncome_List_Isar(await repo.getTransIncome());
    await saveTransactionFinancialExpense_List_Isar(
      await repo.getTransExpense(),
    );
    await saveTransactionAdjustmentIn_List_Isar(
      await repo.getTransactionAdjustmentIn(),
    );
    await saveTransactionAdjustmentOut_List_Isar(
      await repo.getTransactionAdjustmentOut(),
    );

    await saveCounterToIsar();
  }

  Future<void> initItem() async {
    await deleteItemCollection();
    await saveItem_List_Isar(await repo.getItem());
  }

  Future<void> initCategory() async {
    await deleteCategoryCollection();
    await saveCategory_List_Isar(await repo.getCategory());
  }

  Future<void> initPartner() async {
    await deletePartnerCollection();
    final dataPartner = await repo.getPartner();
    await saveCustomer_List_Isar(
      dataPartner.where((e) => e.isCustomer).toList(),
    );
    await saveSupplier_List_Isar(
      dataPartner.where((e) => e.isSupplier).toList(),
    );
  }

  Future<void> initBatch() async {
    await deleteBatchCollection();
    await saveBatch_List_Isar(await repo.getBatch());
  }

  Future<void> initUser() async {
    await deleteOperatorCollection();
    await saveUser_List_Isar(await repo.getUser());
  }

  Future<Box<TransactionSavedHive>> getHiveSavedTransaction() async {
    return await Hive.box<TransactionSavedHive>('saved_transaction');
  }

  Future<void> saveCounterToIsar() async {
    await saveCounter_List_Isar(
      await repo.getCounter(await getAllCompanyIsar()),
    );
  }
}
