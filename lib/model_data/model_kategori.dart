import 'package:cloud_firestore/cloud_firestore.dart';

class ModelKategori {
  final String _namaKategori, _idkategori, _idCabang;
  ModelKategori({
    required String namaKategori,
    required String idkategori,
    required String idCabang,
  }) : _namaKategori = namaKategori,
       _idkategori = idkategori,
       _idCabang = idkategori;

  Map<String, dynamic> convertMap() {
    return {'nama_kategori': _namaKategori, 'id_kategori': _idkategori};
  }

  String get getnamaKategori => _namaKategori;
  String get getidKategori => _idkategori;
  String get getidCabang => _idCabang;

  set setnamKategori(String value) => _namaKategori;
  set setidKategori(String value) => _idkategori;
  set setidCaabng(String value) => _idCabang;

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
        idCabang: map['id_cabang'],
      );
    }).toList();
  }
}
