import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_category.dart';

class InventoryEvent {}

class InvGetData extends InventoryEvent {
  final String? idBranch;
  final String filter;
  final String status;
  final String filterjenis;
  final String filterIDCategory;

  InvGetData({
    required this.filter,
    required this.status,
    required this.idBranch,
    required this.filterjenis,
    required this.filterIDCategory,
  });
}

class InvSelectedCategory extends InventoryEvent {
  final ModelCategory selectedCategory;

  InvSelectedCategory({required this.selectedCategory});
}

class InvSelectedCategoryItem extends InventoryEvent {
  final ModelCategory? dataCategoryItem;

  InvSelectedCategoryItem({required this.dataCategoryItem});
}

class InvSelectedItem extends InventoryEvent {
  final ModelItem selectedItem;

  InvSelectedItem({required this.selectedItem});
}

class InvResetCategoryForm extends InventoryEvent {}

class InvResetItemForm extends InventoryEvent {}

class InvFilterItem extends InventoryEvent {
  final String filter;
  final String status;
  final String filterjenis;
  final String filterIDCategory;

  InvFilterItem({
    required this.filter,
    required this.status,
    required this.filterjenis,
    required this.filterIDCategory,
  });
}

class InvUploadItem extends InventoryEvent {
  final ModelItem item;

  InvUploadItem({required this.item});
}

class InvUploadCategory extends InventoryEvent {
  final ModelCategory category;

  InvUploadCategory({required this.category});
}

class InvSearchitem extends InventoryEvent {
  final String text;

  InvSearchitem({required this.text});
}

class InvCondimentForm extends InventoryEvent {
  final bool condimentForm;

  InvCondimentForm({required this.condimentForm});
}

class InvDeleteCategory extends InventoryEvent {
  final String id;

  InvDeleteCategory({required this.id});
}

class InvDeleteItem extends InventoryEvent {
  final String id;

  InvDeleteItem({required this.id});
}
