import 'package:isar/isar.dart';
part 'model_partner_isar.g.dart';

@collection
class ModelPartnerIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String id;
  @Index()
  late String idBranch;
  late String type;

  late String name;
  late String phone;
  late String email;
  late double balance;
  late DateTime date;
}
