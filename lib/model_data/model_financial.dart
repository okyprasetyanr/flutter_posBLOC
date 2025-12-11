import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/convert_to_map/convert_to_map.dart';

enum FinancialType { Income, Expense }

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

  bool get isIncome => _type == FinancialType.Income;
  bool get isExpense => _type == FinancialType.Expense;
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
}
