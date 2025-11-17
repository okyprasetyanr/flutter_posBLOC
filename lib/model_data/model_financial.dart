import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/convert_to_map/convert_to_map.dart';

enum FinancialType { income, expense }

class ModelFinancial {
  final String _idFinancial, _nameFinancial, _idBranch;
  final FinancialType _type;

  ModelFinancial({
    required FinancialType type,
    required String idFinancial,
    required String nameFinancial,
    required String idBranch,
  }) : _type = type,
       _idFinancial = idFinancial,
       _nameFinancial = nameFinancial,
       _idBranch = idBranch;

  bool get isIncome => _type == FinancialType.income;
  bool get isExpense => _type == FinancialType.expense;
  String get getidFinancial => _idFinancial;
  String get getnameFinancial => _nameFinancial;
  String get getidBranch => _idBranch;
  FinancialType get getfinancialType => _type;

  Future<void> pushDataFinancial() async {
    await FirebaseFirestore.instance
        .collection("financial")
        .doc(_idFinancial)
        .set(
          convertToMapFinancial(
            ModelFinancial(
              type: _type,
              nameFinancial: _nameFinancial,
              idFinancial: _idFinancial,
              idBranch: _idBranch,
            ),
          ),
        );
  }

  factory ModelFinancial.fromMap(Map<String, dynamic> map, String id) {
    return ModelFinancial(
      idFinancial: id,
      nameFinancial: map['name_financial'],
      idBranch: map['id_branch'],
      type: FinancialType.values.firstWhere(
        (element) => element.name == map['type'],
      ),
    );
  }

  static List<ModelFinancial> getDataListFinancial(QuerySnapshot data) {
    return data.docs.map((map) {
      final dataFinancial = map.data() as Map<String, dynamic>;
      return ModelFinancial.fromMap(dataFinancial, map.id);
    }).toList();
  }
}
