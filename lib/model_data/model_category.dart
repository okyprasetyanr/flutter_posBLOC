import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/convert_to_map/convert_to_map.dart';

class ModelCategory extends Equatable {
  final String _nameCategory, _idCategory, _idBranch;
  ModelCategory({
    required String nameCategory,
    required String idCategory,
    required String idBranch,
  }) : _nameCategory = nameCategory,
       _idCategory = idCategory,
       _idBranch = idBranch;

  String get getnameCategory => _nameCategory;
  String get getidCategory => _idCategory;
  String get getidBranch => _idBranch;

  Future<void> pushDataCategory() async {
    await FirebaseFirestore.instance
        .collection("category")
        .doc(_idCategory)
        .set(
          convertToMapCategory(
            ModelCategory(
              nameCategory: _nameCategory,
              idCategory: _idCategory,
              idBranch: _idBranch,
            ),
          ),
        );
  }

  @override
  List<Object?> get props => [_nameCategory, _idCategory, _idBranch];
}
