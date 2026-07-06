import 'package:equatable/equatable.dart';

class ModelCounter extends Equatable {
  final int counterSell,
      counterBuy,
      counterIncome,
      counterExpense,
      counterAdjustmentIn,
      counterAdjustmentOut;
  final int? counterSellSaved;
  final String idBranch;

  ModelCounter({
    required this.counterSell,
    this.counterSellSaved,
    required this.counterBuy,
    required this.counterIncome,
    required this.counterExpense,
    required this.counterAdjustmentIn,
    required this.counterAdjustmentOut,
    required this.idBranch,
  });

  ModelCounter copyWith({
    int? counterSellSaved,
    int? counterSell,
    int? counterBuy,
    int? counterIncome,
    int? counterExpense,
    int? counterAdjustmentIn,
    int? counterAdjustmentOut,
    String? idBranch,
  }) => ModelCounter(
    counterAdjustmentIn: counterAdjustmentIn ?? this.counterAdjustmentIn,
    counterAdjustmentOut: counterAdjustmentOut ?? this.counterAdjustmentOut,
    counterSellSaved: counterSellSaved ?? this.counterSellSaved,
    idBranch: idBranch ?? this.idBranch,
    counterSell: counterSell ?? this.counterSell,
    counterBuy: counterBuy ?? this.counterBuy,
    counterIncome: counterIncome ?? this.counterIncome,
    counterExpense: counterExpense ?? this.counterExpense,
  );

  int get getcounterSell => counterSell;
  int get getcounterSellSaved => counterSellSaved ?? 0;
  int get getcounterBuy => counterBuy;
  int get getcounterIncome => counterIncome;
  int get getcounterExpense => counterExpense;
  int get getcounterAdjustmentIn => counterAdjustmentIn;
  int get getcounterAdjustmentOut => counterAdjustmentOut;
  String get getidBranch => idBranch;

  @override
  List<Object?> get props => [
    idBranch,
    counterSell,
    counterSellSaved,
    counterBuy,
    counterIncome,
    counterExpense,
    counterAdjustmentIn,
    counterAdjustmentOut,
  ];
}
