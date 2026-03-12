import 'package:flutter_pos/features/data_user/isar/ModelBase/model_partner_base_isar.dart';
import 'package:isar/isar.dart';
part 'model_customer_isar.g.dart';

@collection
class ModelCustomerIsar extends ModelPartnerBaseIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String idPartner;
  @Index()
  late String idBranch;
}
