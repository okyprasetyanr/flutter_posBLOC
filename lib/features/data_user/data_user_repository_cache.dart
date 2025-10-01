import 'package:flutter_pos/features/data_user/data_user_repository.dart';
import 'package:flutter_pos/model_data/model_cabang.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';

class DataUserRepositoryCache {
  List<ModelCabang>? dataCabang;
  List<ModelItem>? dataItem;
  List<ModelKategori>? dataKategori;

  final DataUserRepository repo;

  DataUserRepositoryCache(this.repo);

  Future<bool> initData() async {
    dataCabang = await initCabang();
    dataItem = await initItem();
    dataKategori = await initKategori();

    for (var a in dataCabang!) {
      print("datanya: $a");
    }
    for (var a in dataItem!) {
      print("datanya item: $a");
    }
    for (var a in dataKategori!) {
      print("datanya kategori: $a");
    }

    return true;
  }

  Future<List<ModelCabang>> initCabang() async {
    return await repo.ambilCabang();
  }

  Future<List<ModelItem>> initItem() async {
    return await repo.ambilItem();
  }

  Future<List<ModelKategori>> initKategori() async {
    return await repo.ambilKategori();
  }

  List<ModelCabang> ambilCabang() {
    return dataCabang!.toList();
  }

  List<ModelItem> ambilItem(String idCabang) {
    return dataItem!
        .where((element) => element.getidCabang == idCabang)
        .toList();
  }

  List<ModelKategori> ambilKategori(String idCabang) {
    return dataKategori!
        .where((element) => element.getidCabang == idCabang)
        .toList();
  }
}
