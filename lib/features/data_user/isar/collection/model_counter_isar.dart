import 'package:isar/isar.dart';

part 'model_counter_isar.g.dart';

@collection
class ModelCounterIsar {
  Id isarId = Isar.autoIncrement;
  @Index()
  late String idBranch;

  late int counterSell;
  late int counterSellSaved;
  late int counterBuy;
  late int counterIncome;
  late int counterExpense;
}
