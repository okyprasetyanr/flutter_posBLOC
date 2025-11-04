import 'package:flutter_pos/features/data_user/data_user_repository.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class DataUserRepositoryCache {
  List<ModelBranch>? dataBranch;
  List<ModelItem>? dataItem;
  List<ModelCategory>? dataCategory;
  List<ModelPartner>? dataPartner;
  List<ModelTransaction>? dataTransactionSell;
  List<ModelTransaction>? dataTransactionBuy;

  final DataUserRepository repo;

  DataUserRepositoryCache(this.repo);

  Future<bool> initData() async {
    dataBranch = await initBranch();
    dataItem = await initItem();
    dataCategory = await initCategory();
    dataPartner = await initPartner();
    dataTransactionSell = await initTransactionSell();
    dataTransactionBuy = await initTransactionBuy();

    for (var a in dataBranch!) {
      print("Log DataUserRepositoryCache cabang: $a");
    }
    for (var a in dataItem!) {
      print("Log DataUserRepositoryCache item: $a");
    }
    for (var a in dataCategory!) {
      print("Log DataUserRepositoryCache kategori: $a");
    }
    for (var a in dataTransactionSell!) {
      print("Log DataUserRepositoryCache transactionSell: $a");
    }
    for (var a in dataTransactionBuy!) {
      print("Log DataUserRepositoryCache transactionBuy: $a");
    }

    return true;
  }

  Future<List<ModelBranch>> initBranch() async {
    return await repo.getBranch();
  }

  Future<List<ModelTransaction>> initTransactionSell() async {
    return await repo.getTransactionSell();
  }

    Future<List<ModelTransaction>> initTransactionBuy() async {
    return await repo.getTransactionBuy();
  }

  Future<List<ModelItem>> initItem() async {
    return await repo.getItem();
  }

  Future<List<ModelCategory>> initCategory() async {
    return await repo.getCategory();
  }

  Future<List<ModelPartner>> initPartner() async {
    return await repo.getPartner();
  }

  List<ModelBranch> getBranch() {
    return dataBranch!.toList();
  }

  List<ModelItem> getItem(String idBranch) {
    return dataItem!
        .where((element) => element.getidBranch == idBranch)
        .toList();
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

  List<ModelPartner> getSupplier(String idBranch) {
    return dataPartner!
        .where(
          (element) => element.isSupplier && element.getidBranch == idBranch,
        )
        .toList();
  }

  List<ModelTransaction> getTransaction(String idBranch) {
    return dataTransactionSell!
        .where((element) => element.getidBranch == idBranch)
        .toList();
  }
}
