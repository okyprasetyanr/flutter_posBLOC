import 'dart:async';

import 'package:flutter_pos/features/data_user/data_user_repository.dart';
import 'package:flutter_pos/features/data_user/isar/action/delete/delete_data_isar_all.dart';
import 'package:flutter_pos/features/data_user/isar/action/delete/delete_data_isar_by_collection.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/features/data_user/isar/action/save_update_data_isar.dart';
import 'package:flutter_pos/features/hive_setup/saved_transaction/model_transaction_save.dart';

import 'package:hive/hive.dart';

class DataUserRepositoryCache {
  final DataUserRepository repo;

  DataUserRepositoryCache(this.repo);

  final _changeController = StreamController<void>.broadcast();

  Stream<void> get onChanged => _changeController.stream;

  void notifyChanged() {
    if (!_changeController.isClosed) {
      _changeController.add(null);
    }
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

    // notifyChanged();

    return true;
  }

  Future<void> initCompany() async {
    await saveCompany_Isar(await repo.getCompany());
  }

  Future<void> initFinancial() async {
    await deleteFinancialCollection();
    final dataFinancial = await repo.getFinancial();
    for (final element in dataFinancial.where((e) => e.isIncome)) {
      await saveIncome_Isar(element);
    }

    for (final element in dataFinancial.where((e) => e.isExpense)) {
      await saveExpense_Isar(element);
    }
  }

  Future<void> initTransaction() async {
    await deleteCounterCollection();
    await deleteTransactionSellCollection();
    await deleteTransactionBuyCollection();
    for (final element in await repo.getTransactionSell()) {
      await saveTransactionSell_Isar(element);
    }

    for (final element in await repo.getTransactionBuy()) {
      await saveTransactionBuy_Isar(element);
    }
    for (final element in await repo.getTransIncome()) {
      await saveTransactionFinancialncome_Isar(element);
    }

    for (final element in await repo.getTransExpense()) {
      await saveTransactionFinancialExpense_Isar(element);
    }
    await saveCounterToIsar();
  }

  Future<void> initItem() async {
    await deleteItemCollection();
    for (final element in await repo.getItem()) {
      await saveItem_Isar(element);
    }
  }

  Future<void> initCategory() async {
    await deleteCategoryCollection();
    for (final element in await repo.getCategory()) {
      await saveCategory_Isar(element);
    }
  }

  Future<void> initPartner() async {
    await deletePartnerCollection();
    final dataPartner = await repo.getPartner();
    for (final element in dataPartner.where((e) => e.isCustomer)) {
      await saveCustomer_Isar(element);
    }
    for (final element in dataPartner.where((e) => e.isSupplier)) {
      await saveSupplier_Isar(element);
    }
  }

  Future<void> initBatch() async {
    await deleteBatchCollection();
    for (final element in await repo.getBatch()) {
      await saveBatch_Isar(element);
    }
  }

  Future<void> initUser() async {
    await deleteOperatorCollection();
    for (final element in await repo.getUser()) {
      await saveUser_Isar(element);
    }
  }

  Future<Box<TransactionSavedHive>> getHiveSavedTransaction() async {
    return await Hive.box<TransactionSavedHive>('saved_transaction');
  }

  Future<void> saveCounterToIsar() async {
    final data = await repo.getCounter(await getAllCompanyIsar());
    for (final element in data) {
      await saveCounter_Isar(element);
    }
  }
}
