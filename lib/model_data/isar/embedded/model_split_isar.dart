import 'package:isar/isar.dart';

part 'model_split_isar.g.dart';

@embedded
class ModelSplitIsar {
  late String paymentInvoice;
  late String paymentName;

  late String? paymentDebitName;
  late double paymentTotal;
}
