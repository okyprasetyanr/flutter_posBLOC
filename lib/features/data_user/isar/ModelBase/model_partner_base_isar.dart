import 'package:isar/isar.dart';

abstract class ModelPartnerBaseIsar {
  @Index(unique: true)
  late String idPartner;
  @Index()
  late String idBranch;
  late String typePartner;
  late String namePartner;
  late String phonePartner;
  late String emailPartner;
  late double balancePartner;
  late DateTime date;
}
