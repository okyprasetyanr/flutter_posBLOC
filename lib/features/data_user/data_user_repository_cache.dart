import 'package:flutter_pos/features/data_user/data_user_repository.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_category.dart';

class DataUserRepositoryCache {
  List<ModelCabang>? dataBranch;
  List<ModelItem>? dataItem;
  List<ModelKategori>? dataCategory;

  final DataUserRepository repo;

  DataUserRepositoryCache(this.repo);

  Future<bool> initData() async {
    dataBranch = await initBranch();
    dataItem = await initItem();
    dataCategory = await initCategory();

    for (var a in dataBranch!) {
      print("Log DataUserRepositoryCache cabang: $a");
    }
    for (var a in dataItem!) {
      print("Log DataUserRepositoryCache item: $a");
    }
    for (var a in dataCategory!) {
      print("Log DataUserRepositoryCache kategori: $a");
    }

    return true;
  }

  Future<List<ModelCabang>> initBranch() async {
    return await repo.getBranch();
  }

  Future<List<ModelItem>> initItem() async {
    return await repo.getItem();
  }

  Future<List<ModelKategori>> initCategory() async {
    return await repo.getCategory();
  }

  List<ModelCabang> getBranch() {
    return dataBranch!.toList();
  }

  List<ModelItem> getItem(String idCabang) {
    return dataItem!
        .where((element) => element.getidBranch == idCabang)
        .toList();
  }

  List<ModelKategori> getCategory(String idCabang) {
    return dataCategory!
        .where((element) => element.getidBranch == idCabang)
        .toList();
  }
}
