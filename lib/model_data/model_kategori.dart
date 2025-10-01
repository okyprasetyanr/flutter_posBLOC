import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ModelKategori extends Equatable {
  final String _namaKategori, _idkategori, _idCabang;
  ModelKategori({
    required String namaKategori,
    required String idkategori,
    required String idCabang,
  }) : _namaKategori = namaKategori,
       _idkategori = idkategori,
       _idCabang = idCabang;

  static reset() {
    ModelKategori(namaKategori: "", idkategori: "", idCabang: "");
  }

  Map<String, dynamic> convertMap() {
    return {
      'nama_kategori': _namaKategori,
      'id_kategori': _idkategori,
      'id_cabang': _idCabang,
    };
  }

  String get getnamaKategori => _namaKategori;
  String get getidKategori => _idkategori;
  String get getidCabang => _idCabang;

  set setnamKategori(String value) => _namaKategori;
  set setidKategori(String value) => _idkategori;
  set setidCabang(String value) => _idCabang;

  Map<String, dynamic> convertToMap() {
    return {
      'nama_kategori': getnamaKategori,
      'id_kategori': getidKategori,
      'id_cabang': getidCabang,
    };
  }

  Future<void> pushData(String uidUser) async {
    await FirebaseFirestore.instance.collection("kategori").add(convertToMap());
  }

  static List<ModelKategori> getDataListKategori(QuerySnapshot data) {
    return data.docs.map((map) {
      final dataKetegori = map.data() as Map<String, dynamic>;
      return ModelKategori(
        namaKategori: dataKetegori['nama_kategori'],
        idkategori: map.id,
        idCabang: dataKetegori['id_cabang'],
      );
    }).toList();
  }

  @override
  List<Object?> get props => [_namaKategori, _idkategori, _idCabang];
}
