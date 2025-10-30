import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/function/function.dart';

class ModelKategori extends Equatable {
  final String _nameCategory, _idCategory, _idBranch;
  ModelKategori({
    required String nameCategory,
    required String idCategory,
    required String idBranch,
  }) : _nameCategory = nameCategory,
       _idCategory = idCategory,
       _idBranch = idBranch;

  String get getnameCategory => _nameCategory;
  String get getidCategory => _idCategory;
  String get getidBranch => _idBranch;

  Map<String, dynamic> convertToMapCategory() {
    return {
      'nama_kategori': _nameCategory,
      'id_kategori': _idCategory,
      'id_cabang': _idBranch,
      'uid_user': UserSession.ambilUidUser(),
    };
  }

  Future<void> pushDataCategory() async {
    await FirebaseFirestore.instance
        .collection("kategori")
        .doc(_idCategory)
        .set(convertToMapCategory());
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
