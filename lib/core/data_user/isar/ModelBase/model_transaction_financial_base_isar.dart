import 'package:isar/isar.dart';

abstract class ModelTransactionFinancialBaseIsar {
  @Index(unique: true)
  late String invoice;
  @Index()
  late String idBranch;

  late String statusTransaction;
  late String idFinancial;
  late String nameFinancial;
  late String note;
  late DateTime date;
  late double amount;
}
