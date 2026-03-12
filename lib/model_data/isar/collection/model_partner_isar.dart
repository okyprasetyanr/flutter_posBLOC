import 'package:isar/isar.dart';
part 'model_partner_isar.g.dart';

@collection
class ModelPartnerIsar {
  Id isarId = Isar.autoIncrement;
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
