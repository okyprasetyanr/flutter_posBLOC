import 'package:flutter_pos/model_data/model_item.dart';

class InventoryEvent {}

class AmbilData extends InventoryEvent {
  final String? idCabang;
  final String filter;
  final String status;
  final bool statusCondiment;

  AmbilData({
    required this.filter,
    required this.status,
    required this.idCabang,
    required this.statusCondiment,
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
  final bool statusCondiment;

  FilterItem({
    required this.statusCondiment,
    required this.filter,
    required this.status,
    required this.idCabang,
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
