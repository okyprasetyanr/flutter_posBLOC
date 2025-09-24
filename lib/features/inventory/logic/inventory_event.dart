import 'package:flutter_pos/model_data/model_item.dart';

class InventoryEvent {}

class AmbilData extends InventoryEvent {
  final String? idCabang;
  final String filter;
  final String status;
  final String filterjenis;

  AmbilData({
    required this.filter,
    required this.status,
    required this.idCabang,
    required this.filterjenis,
  });
}

class SelectedKategori extends InventoryEvent {
  final Map<String, String> selectedKategori;

  SelectedKategori({required this.selectedKategori});
}

class SelectedItem extends InventoryEvent {
  final Map<String, String> selecteditem;

  SelectedItem({required this.selecteditem});
}

class ResetKategoriForm extends InventoryEvent {}

class ResetItemForm extends InventoryEvent {}

class FilterItem extends InventoryEvent {
  final String idCabang;
  final String filter;
  final String status;
  final String filterjenis;

  FilterItem({
    required this.filter,
    required this.status,
    required this.idCabang,
    required this.filterjenis,
  });
}

class UploadItem extends InventoryEvent {
  final ModelItem data;

  UploadItem({required this.data});
}

class UploadKategori extends InventoryEvent {
  final Map<String, dynamic> data;

  UploadKategori({required this.data});
}

class Searchitem extends InventoryEvent {
  final String text;

  Searchitem({required this.text});
}
