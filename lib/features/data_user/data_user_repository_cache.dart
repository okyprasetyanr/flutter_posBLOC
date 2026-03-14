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
    await deleteAllDataIsar();
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

    notifyChanged();

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
    dataUser = [];
    final dataAccount = await getAllAccountIsar();
    if (dataAccount.getRoleUser == RoleType.Pemilik) {
      dataUser.add(dataAccount);
    }
    dataUser.addAll(await repo.getUser());

    debugPrint(
      "Log DataUserRepositoryCache: dataUser: ${dataUser.map((e) => e.getNameUser)}, roleAccount: ${dataAccount.getRoleUser}",
    );
  }

  Future<Box<TransactionSavedHive>> getHiveSavedTransaction() async {
    return await Hive.box<TransactionSavedHive>('saved_transaction');
  }

  Future<void> saveToIsar() async {
    dataItem.forEach((element) async => await saveItem_Isar(element));
    dataCategory.forEach((element) async => await saveCategory_Isar(element));
    dataPartner
        .where((element) => element.isCustomer)
        .forEach((element) async => await saveCustomer_Isar(element));
    dataPartner
        .where((element) => element.isSupplier)
        .forEach((element) async => await saveSupplier_Isar(element));
    dataTransSell.forEach(
      (element) async => await saveTransactionSell_Isar(element),
    );
    dataTransBuy.forEach(
      (element) async => await saveTransactionBuy_Isar(element),
    );
    dataBatch.forEach((element) async => await saveBatch_Isar(element));
    dataFinancial
        .where((element) => element.isIncome)
        .forEach((element) async => await saveIncome_Isar(element));
    dataFinancial
        .where((element) => element.isExpense)
        .forEach((element) async => await saveExpense_Isar(element));
    dataTransIncome.forEach(
      (element) async => await saveTransactionFinancialncome_Isar(element),
    );
    dataTransExpense.forEach(
      (element) async => await saveTransactionFinancialExpense_Isar(element),
    );
    dataUser.forEach((element) async => await saveUser_Isar(element));
    dataCounter.forEach((element) async => await saveCounter_Isar(element));
    saveCompany_Isar(dataCompany!);
  }
}
