import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_category.dart';

class InventoryEvent {}

class InvAmbilData extends InventoryEvent {
  final String? idCabang;
  final String filter;
  final String status;
  final String filterjenis;
  final String filterIDKategori;

  InvAmbilData({
    required this.filter,
    required this.status,
    required this.idCabang,
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

class InvResetKategoriForm extends InventoryEvent {}

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
  final ModelItem data;

  InvUploadItem({required this.data});
}

class InvUploadKategori extends InventoryEvent {
  final Map<String, dynamic> data;

  InvUploadKategori({required this.data});
}

class InvSearchitem extends InventoryEvent {
  final String text;

  InvSearchitem({required this.text});
}

class InvCondimentForm extends InventoryEvent {
  final bool condimentForm;

  InvCondimentForm({required this.condimentForm});
}
