import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_category.dart';

class InventoryEvent {}

class InventoryGetData extends InventoryEvent {
  final String? idBranch;

  InventoryGetData({this.idBranch});
}

class InventorySelectedCategory extends InventoryEvent {
  final ModelCategory selectedCategory;

  InventorySelectedCategory({required this.selectedCategory});
}

class InventorySelectedCategoryItem extends InventoryEvent {
  final ModelCategory? dataCategoryItem;

  InventorySelectedCategoryItem({required this.dataCategoryItem});
}

class InventorySelectedItem extends InventoryEvent {
  final ModelItem selectedItem;

  InventorySelectedItem({required this.selectedItem});
}

class InventoryResetCategoryForm extends InventoryEvent {}

class InventoryResetItemForm extends InventoryEvent {}

class InventoryFilterItem extends InventoryEvent {
  final int? filter;
  final int? status;
  final int? filterType;
  final int? filterByCategory;

  InventoryFilterItem({
    this.filter,
    this.status,
    this.filterType,
    this.filterByCategory,
  });
}

class InventoryUploadItem extends InventoryEvent {
  final ModelItem item;

  InventoryUploadItem({required this.item});
}

class InventoryUploadCategory extends InventoryEvent {
  final ModelCategory category;

  InventoryUploadCategory({required this.category});
}

class InventorySearchItem extends InventoryEvent {
  final String search;

  InventorySearchItem({required this.search});
}

class InventorySearchCategory extends InventoryEvent {
  final String search;

  InventorySearchCategory({required this.search});
}

class InventoryCondimentForm extends InventoryEvent {
  final bool condimentForm;

  InventoryCondimentForm({required this.condimentForm});
}

class InventoryDeleteCategory extends InventoryEvent {
  final String id;

  InventoryDeleteCategory({required this.id});
}

class InventoryDeleteItem extends InventoryEvent {
  final String id;

  InventoryDeleteItem({required this.id});
}
