import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_category.dart';

class InventoryEvent {}

class InvGetData extends InventoryEvent {
  final String? idBranch;
  final String filter;
  final String status;
  final String filterjenis;
  final String filterIDKategori;

  InvGetData({
    required this.filter,
    required this.status,
    required this.idBranch,
    required this.filterjenis,
    required this.filterIDKategori,
  });
}

class InvSelectedKategori extends InventoryEvent {
  final ModelKategori selectedKategori;

  InvSelectedKategori({required this.selectedKategori});
}

class InvSelectedKategoriItem extends InventoryEvent {
  final ModelKategori? dataKategoriItem;

  InvSelectedKategoriItem({required this.dataKategoriItem});
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
  final String filterIDKategori;

  InvFilterItem({
    required this.filter,
    required this.status,
    required this.filterjenis,
    required this.filterIDKategori,
  });
}

class InvUploadItem extends InventoryEvent {
  final ModelItem item;

  InvUploadItem({required this.item});
}

class InvUploadCategory extends InventoryEvent {
  final ModelKategori category;

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
