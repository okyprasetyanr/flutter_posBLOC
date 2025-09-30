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

  Future<void> initData() async {
    await Future.wait([
      initCabang(),
      initItem(dataCabang!.first),
      initKategori(dataCabang!.first),
    ]);
  }

  Future<List<ModelCabang>> initCabang() async {
    dataCabang ??= await repo.ambilCabang();
    return dataCabang!;
  }

  Future<List<ModelItem>> initItem(ModelCabang dataCabang) async {
    dataItem ??= await repo.ambilItem();
    return dataItem!;
  }

  Future<List<ModelKategori>> initKategori(ModelCabang dataCabang) async {
    dataKategori ??= await repo.ambilKategori();
    return dataKategori!;
  }

  List<ModelCabang> ambilCabang() {
    return dataCabang!;
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
