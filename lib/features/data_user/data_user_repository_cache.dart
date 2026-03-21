import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/data_user_repository.dart';
import 'package:flutter_pos/features/data_user/isar/action/delete/delete_data_isar_all.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/features/data_user/isar/action/save_update_data_isar.dart';
import 'package:flutter_pos/features/hive_setup/saved_transaction/model_transaction_save.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_company.dart';
import 'package:flutter_pos/model_data/model_counter.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:hive/hive.dart';

class DataUserRepositoryCache {
  List<ModelItem> dataItem = [];
  List<ModelCategory> dataCategory = [];
  List<ModelPartner> dataPartner = [];
  List<ModelTransaction> dataTransSell = [];
  List<ModelTransaction> dataTransBuy = [];
  List<ModelBatch> dataBatch = [];
  List<ModelFinancial> dataFinancial = [];
  List<ModelTransactionFinancial> dataTransIncome = [];
  List<ModelTransactionFinancial> dataTransExpense = [];
  List<ModelUser> dataUser = [];
  List<ModelCounter> dataCounter = [];
  ModelCompany? dataCompany;
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
    await deleteAllCommonDataIsar();
    await initCompany();
    await initFinancial();
    await initTransFinancial();
    await initItem();
    await initCategory();
    await initPartner();
    await initTransaction();
    await initBatch();
    await initUser();

    await saveToIsar();

    // notifyChanged();

    return true;
  }

  Future<void> initCompany() async {
    dataCompany = await repo.getCompany();
  }

  Future<void> initFinancial() async {
    dataFinancial = await repo.getFinancial();
  }

  Future<void> initTransFinancial() async {
    dataTransIncome = await repo.getTransIncome();
    dataTransExpense = await repo.getTransExpense();
    dataCounter = await repo.getCounter(dataCompany);
  }

  Future<void> initTransaction() async {
    dataTransSell = await repo.getTransactionSell();
    dataTransBuy = await repo.getTransactionBuy();
    dataCounter = await repo.getCounter(dataCompany);
  }

  Future<void> initItem() async {
    dataItem = await repo.getItem();
  }

  Future<void> initCategory() async {
    dataCategory = await repo.getCategory();
  }

  Future<void> initPartner() async {
    dataPartner = await repo.getPartner();
    for (var a in dataPartner) {
      debugPrint("Log DataUserRepositoryCache partner: $a");
    }
  }

  Future<void> initBatch() async {
    dataBatch = await repo.getBatch();
  }

  Future<void> initUser() async {
    dataUser = await repo.getUser();
  }

  Future<Box<TransactionSavedHive>> getHiveSavedTransaction() async {
    return await Hive.box<TransactionSavedHive>('saved_transaction');
  }

  Future<void> saveToIsar() async {
    for (final element in dataItem) {
      await saveItem_Isar(element);
    }

    for (final element in dataCategory) {
      await saveCategory_Isar(element);
    }

    for (final element in dataPartner.where((e) => e.isCustomer)) {
      await saveCustomer_Isar(element);
    }

    for (final element in dataPartner.where((e) => e.isSupplier)) {
      await saveSupplier_Isar(element);
    }

    for (final element in dataTransSell) {
      await saveTransactionSell_Isar(element);
    }

    for (final element in dataTransBuy) {
      await saveTransactionBuy_Isar(element);
    }

    for (final element in dataBatch) {
      await saveBatch_Isar(element);
    }

    for (final element in dataFinancial.where((e) => e.isIncome)) {
      await saveIncome_Isar(element);
    }

    for (final element in dataFinancial.where((e) => e.isExpense)) {
      await saveExpense_Isar(element);
    }

    for (final element in dataTransIncome) {
      await saveTransactionFinancialncome_Isar(element);
    }

    for (final element in dataTransExpense) {
      await saveTransactionFinancialExpense_Isar(element);
    }

    for (final element in dataUser) {
      await saveUser_Isar(element);
    }

    for (final element in dataCounter) {
      await saveCounter_Isar(element);
    }

    if (dataCompany != null) {
      await saveCompany_Isar(dataCompany!);
    }
  }
}
