import 'package:flutter/material.dart';
import 'package:flutter_pos/features/data_user/data_user_repository.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';

class DataUserRepositoryCache {
  List<ModelBranch>? dataBranch;
  List<ModelItem>? dataItem;
  List<ModelCategory>? dataCategory;
  List<ModelPartner>? dataPartner;
  List<ModelTransaction>? dataTransactionSell;
  List<ModelTransaction>? dataTransactionBuy;
  List<ModelBatch>? dataBatch;
  List<ModelFinancial>? dataFinancial;
  List<ModelTransactionFinancial>? dataTransIncome;
  List<ModelTransactionFinancial>? dataTransExpense;

  final DataUserRepository repo;

  DataUserRepositoryCache(this.repo);

  Future<bool> initData() async {
    await Future.wait([
      initBranch(),
      initFinancial(),
      initTransIncome(),
      initTransExpense(),
      initItem(),
      initCategory(),
      initPartner(),
      initTransactionSell(),
      initTransactionBuy(),
      initBatch(),
    ]);

    for (var a in dataBranch!) {
      debugPrint("Log DataUserRepositoryCache branch: $a");
    }
    for (var a in dataItem!) {
      debugPrint("Log DataUserRepositoryCache item: $a");
    }
    for (var a in dataCategory!) {
      debugPrint("Log DataUserRepositoryCache Category: $a");
    }
    for (var a in dataTransactionSell!) {
      debugPrint("Log DataUserRepositoryCache transactionSell: $a");
    }
    for (var a in dataTransactionBuy!) {
      debugPrint("Log DataUserRepositoryCache transactionBuy: $a");
    }
    for (var a in dataBatch!) {
      debugPrint("Log DataUserRepositoryCache dataItemBatch: $a");
    }
    for (var a in dataPartner!) {
      debugPrint("Log DataUserRepositoryCache dataPartner: $a");
    }

    return true;
  }

  Future<void> initBranch() async {
    dataBranch = await repo.getBranch();
  }

  Future<void> initFinancial() async {
    dataFinancial = await repo.getFinancial();
  }

  Future<void> initTransIncome() async {
    dataTransIncome = await repo.getTransIncome();
  }

  Future<void> initTransExpense() async {
    dataTransIncome = await repo.getTransExpense();
  }

  Future<void> initTransactionSell() async {
    dataTransactionSell = await repo.getTransactionSell();
  }

  Future<void> initTransactionBuy() async {
    dataTransactionBuy = await repo.getTransactionBuy();
  }

  Future<void> initItem() async {
    dataItem = await repo.getItem();
  }

  Future<void> initCategory() async {
    dataCategory = await repo.getCategory();
  }

  Future<void> initPartner() async {
    dataPartner = await repo.getPartner();
    for (var a in dataPartner!) {
      debugPrint("Log DataUserRepositoryCache partner: $a");
    }
  }

  Future<void> initBatch() async {
    dataBatch = await repo.getBatch();
  }

  List<ModelBranch> getBranch() {
    return dataBranch!.toList();
  }

  List<ModelItem> getItem(String idBranch) {
    final dataItemFinal = dataItem!
        .where((element) => element.getidBranch == idBranch)
        .toList();

    for (int i = 0; i < dataItemFinal.length; i++) {
      final item = dataItemFinal[i];
      double qty = item.getqtyItem;
      final allBatchItems = dataBatch!
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
    return dataCategory!
        .where((element) => element.getidBranch == idBranch)
        .toList();
  }

  List<ModelPartner> getCustomer(String idBranch) {
    return dataPartner!
        .where(
          (element) => element.isCustomer && element.getidBranch == idBranch,
        )
        .toList();
  }

  List<ModelFinancial> getIncome(String idBranch) {
    return dataFinancial!
        .where((element) => element.isIncome && element.getidBranch == idBranch)
        .toList();
  }

  List<ModelFinancial> getExpense(String idBranch) {
    return dataFinancial!
        .where(
          (element) => element.isExpense && element.getidBranch == idBranch,
        )
        .toList();
  }

  List<ModelPartner> getSupplier(String idBranch) {
    return dataPartner!
        .where(
          (element) => element.isSupplier && element.getidBranch == idBranch,
        )
        .toList();
  }

  List<ModelTransaction> getTransactionSell(String idBranch) {
    return dataTransactionSell!
        .where((element) => element.getidBranch == idBranch)
        .toList();
  }

  List<ModelTransaction> getTransactionBuy(String idBranch) {
    return dataTransactionBuy!
        .where((element) => element.getidBranch == idBranch)
        .toList();
  }

  List<ModelBatch> getBatch(String idBranch) {
    return dataBatch!
        .where((element) => element.getidBranch == idBranch)
        .toList();
  }
}
