import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';

class InventoryEvent {}

class AmbilData extends InventoryEvent {
  final String? idCabang;
  final String filter;
  final String status;
  final String filterjenis;
  final String filterIDKategori;

  AmbilData({
    required this.filter,
    required this.status,
    required this.idCabang,
    required this.filterjenis,
    required this.filterIDKategori,
  });
}

class SelectedKategori extends InventoryEvent {
  final Map<String, String> selectedKategori;

  SelectedKategori({required this.selectedKategori});
}

class SelectedItem extends InventoryEvent {
  final ModelItem selectedItem;

  SelectedItem({required this.selectedItem});
}

class ResetKategoriForm extends InventoryEvent {}

class ResetItemForm extends InventoryEvent {}

class FilterItem extends InventoryEvent {
  final String idCabang;
  final String filter;
  final String status;
  final String filterjenis;
  final String filterIDKategori;

  FilterItem({
    required this.filter,
    required this.status,
    required this.idCabang,
    required this.filterjenis,
    required this.filterIDKategori,
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

class CondimentForm extends InventoryEvent {
  final bool condimentForm;

  CondimentForm({required this.condimentForm});
}

class UpdateSelectedItem extends InventoryEvent {
  final String? namaItem;
  final String? barcodeItem;
  final String? hargaItem;
  final String? kategoriItem;
  final bool? condimentForm;

  UpdateSelectedItem({
    this.namaItem,
    this.barcodeItem,
    this.hargaItem,
    this.kategoriItem,
    this.condimentForm,
  });
}
