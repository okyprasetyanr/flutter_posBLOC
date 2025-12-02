import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/convert_to_map/convert_to_map.dart';
import 'package:flutter_pos/function/function.dart';

class ModelCounter {
  final int _counterSell, _counterBuy, _counterIncome, _counterExpense;
  final String _idBranch;

  ModelCounter({
    required int counterSell,
    required int counterBuy,
    required int counterIncome,
    required int counterExpense,
    required String idBranch,
  }) : _counterSell = counterSell,
       _counterBuy = counterBuy,
       _counterIncome = counterIncome,
       _counterExpense = counterExpense,
       _idBranch = idBranch;

  ModelCounter copyWith({
    int? counterSell,
    int? counterBuy,
    int? counterIncome,
    int? counterExpense,
    String? idBranch,
  }) => ModelCounter(
    idBranch: idBranch ?? this._idBranch,
    counterSell: counterSell ?? this._counterSell,
    counterBuy: counterBuy ?? this._counterBuy,
    counterIncome: counterIncome ?? this._counterIncome,
    counterExpense: counterExpense ?? this._counterExpense,
  );

  int get getcounterSell => _counterSell;
  int get getcounterBuy => _counterBuy;
  int get getcounterIncome => _counterIncome;
  int get getcounterExpense => _counterExpense;
  String get getidBranch => _idBranch;

  static Future<void> pushDataCounter(ModelCounter dataCounter) async {
    final writeBatch = FirebaseFirestore.instance.batch();

    final datacounterRef = FirebaseFirestore.instance
        .collection('counter')
        .doc(UserSession.getUidOwner())
        .collection('branch')
        .doc(dataCounter.getidBranch);

    writeBatch.set(datacounterRef, convertToMapCounter(dataCounter));
    await writeBatch.commit();
  }

  static List<ModelCounter> getDataCounter(
    QuerySnapshot<Map<String, dynamic>> dataCounter,
  ) {
    return dataCounter.docs
        .map(
          (counter) => ModelCounter(
            idBranch: counter.id,
            counterSell: counter['counter_sell'],
            counterBuy: counter['counter_buy'],
            counterIncome: counter['counter_income'],
            counterExpense: counter['counter_expense'],
          ),
        )
        .toList();
  }
}
