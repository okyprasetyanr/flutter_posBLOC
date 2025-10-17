import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ModelKategori extends Equatable {
  final String _nameCategory, _idCategory, _idBranch;
  ModelKategori({
    required String nameCategory,
    required String idCategory,
    required String idBranch,
  }) : _nameCategory = nameCategory,
       _idCategory = idCategory,
       _idBranch = idBranch;

  static reset() {
    ModelKategori(nameCategory: "", idCategory: "", idBranch: "");
  }

  Map<String, dynamic> convertMap() {
    return {
      'nama_kategori': _nameCategory,
      'id_kategori': _idCategory,
      'id_cabang': _idBranch,
    };
  }

  String get getnameCategory => _nameCategory;
  String get getidCategory => _idCategory;
  String get getidBranch => _idBranch;

  set setnameCategory(String value) => _nameCategory;
  set setidCategory(String value) => _idCategory;
  set setidBranch(String value) => _idBranch;

  Map<String, dynamic> convertToMap() {
    return {
      'nama_kategori': getnameCategory,
      'id_kategori': getidCategory,
      'id_cabang': getidBranch,
    };
  }

  Future<void> pushData(String uidUser) async {
    await FirebaseFirestore.instance.collection("kategori").add(convertToMap());
  }

  static List<ModelKategori> getDataListKategori(QuerySnapshot data) {
    return data.docs.map((map) {
      final dataKetegori = map.data() as Map<String, dynamic>;
      return ModelKategori(
        nameCategory: dataKetegori['nama_kategori'],
        idCategory: map.id,
        idBranch: dataKetegori['id_cabang'],
      );
    }).toList();
  }

  @override
  List<Object?> get props => [_nameCategory, _idCategory, _idBranch];
}
