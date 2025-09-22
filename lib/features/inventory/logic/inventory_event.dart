import 'package:flutter_pos/model_data/model_item.dart';

class InventoryEvent {}

class AmbilData extends InventoryEvent {
  final String? idCabang;
  final String filter;
  final String status;

  AmbilData({
    required this.filter,
    required this.status,
    required this.idCabang,
  });
}

class SelectedKategori extends InventoryEvent {
  final Map<String, String> selectedKategori;

  SelectedKategori({required this.selectedKategori});
}

class FilterItem extends InventoryEvent {
  final String idCabang;
  final String filter;
  final String status;

  FilterItem({
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
