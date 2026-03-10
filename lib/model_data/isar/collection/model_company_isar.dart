import 'package:flutter_pos/model_data/isar/embedded/model_branch_isar.dart';
import 'package:isar/isar.dart';
part 'model_company_isar.g.dart';

@collection
class ModelCompanyIsar {
  Id isarId = Isar.autoIncrement;

  late String nameCompany;
  late String phoneCompany;
  late DateTime created;
  List<ModelBranchIsar> listBranch = [];
  late String header;
  late String footer;
}
