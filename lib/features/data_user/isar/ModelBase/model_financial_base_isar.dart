import 'package:isar/isar.dart';

abstract class ModelFinancialBaseIsar {
  @Index(unique: true)
  late String idFinancial;
  @Index()
  late String idBranch;

  late String type;
  late String nameFinancial;
}
