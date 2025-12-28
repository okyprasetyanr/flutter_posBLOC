import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pos/features/data_user/data_user_repository.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_company.dart';
import 'package:flutter_pos/model_data/model_counter.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';

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
  ModelUser? dataAccount;
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
    // await Future.wait([
    // ]);

    await initCompany();
    await initFinancial();
    await initTransFinancial();
    await initItem();
    await initCategory();
    await initPartner();
    await initTransaction();
    await initBatch();
    await initUser();

    notifyChanged();

    for (var a in dataItem) {
      debugPrint("Log DataUserRepositoryCache item: $a");
    }
    for (var a in dataCategory) {
      debugPrint("Log DataUserRepositoryCache Category: $a");
    }
    for (var a in dataTransSell) {
      debugPrint("Log DataUserRepositoryCache transactionSell: $a");
    }
    for (var a in dataTransBuy) {
      debugPrint("Log DataUserRepositoryCache transactionBuy: $a");
    }
    for (var a in dataBatch) {
      debugPrint("Log DataUserRepositoryCache dataItemBatch: $a");
    }
    for (var a in dataPartner) {
      debugPrint("Log DataUserRepositoryCache dataPartner: $a");
    }

    return true;
  }

  Future<void> initCompany() async {
    dataCompany = await repo.getCompany();
    // dataAccount?.getIdBranchUser != null
    //     ? listBranch
    //           .where(
    //             (element) =>
    //                 element.getidBranch == dataAccount!.getIdBranchUser,
    //           )
    //           .toList()
    //     : listBranch;
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

  ModelUser getAccount() {
    return dataAccount!;
  }

  ModelCompany getCompany() {
    return dataCompany!;
  }

  List<ModelBranch> getBranch() {
    return dataCompany!.getListBranch.toList();
  }

  List<ModelItem> getItem(String idBranch) {
    final dataItemFinal = dataItem
        .where((element) => element.getidBranch == idBranch)
        .toList();

    for (int i = 0; i < dataItemFinal.length; i++) {
      final item = dataItemFinal[i];
      double qty = item.getqtyItem;
      final allBatchItems = dataBatch
          .expand((batch) => batch.getitems_batch)
          .where((element) => element.getidItem == item.getidItem);

      for (final itemBatch in allBatchItems) {
        qty += itemBatch.getqtyItem_in - itemBatch.getqtyItem_out;
      }
      dataItemFinal[i] = item.copyWith(qtyItem: qty);
    }
    debugPrint("Log DataUserRepositoryCache: getItem: ${dataItemFinal}");
    return dataItemFinal;
  }

  List<ModelCategory> getCategory(String idBranch) {
    return dataCategory
        .where((element) => element.getidBranch == idBranch)
        .toList();
  }

  List<ModelPartner> getCustomer(String idBranch) {
    return dataPartner
        .where(
          (element) => element.isCustomer && element.getidBranch == idBranch,
        )
        .toList();
  }

  List<ModelFinancial> getIncome(String idBranch) {
    return dataFinancial
        .where((element) => element.isIncome && element.getidBranch == idBranch)
        .toList();
  }

  List<ModelFinancial> getExpense(String idBranch) {
    return dataFinancial
        .where(
          (element) => element.isExpense && element.getidBranch == idBranch,
        )
        .toList();
  }

  List<ModelPartner> getSupplier(String idBranch) {
    return dataPartner
        .where(
          (element) => element.isSupplier && element.getidBranch == idBranch,
        )
        .toList();
  }

  List<ModelTransaction> getTransactionSell(String idBranch) {
    return dataTransSell
        .where((element) => element.getidBranch == idBranch)
        .toList();
  }

  List<ModelTransaction> getTransactionBuy(String idBranch) {
    return dataTransBuy
        .where((element) => element.getidBranch == idBranch)
        .toList();
  }

  List<ModelBatch> getBatch(String idBranch) {
    return dataBatch
        .where((element) => element.getidBranch == idBranch)
        .toList();
  }

  List<ModelTransactionFinancial> getTransactionIncome(String idBranch) {
    return dataTransIncome
        .where((element) => element.getidBranch == idBranch)
        .toList();
  }

  List<ModelTransactionFinancial> getTransactionExpense(String idBranch) {
    return dataTransExpense
        .where((element) => element.getidBranch == idBranch)
        .toList();
  }
}
