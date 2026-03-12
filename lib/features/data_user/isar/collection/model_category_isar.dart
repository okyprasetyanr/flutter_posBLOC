import 'package:isar/isar.dart';
part 'model_category_isar.g.dart';

@collection
class ModelCategoryIsar {
  Id isarId = Isar.autoIncrement;
  @Index(unique: true)
  late String idCategory;
  @Index()
  late String idBranch;

  late String nameCategory;
}
