import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_category.dart';

class SellEvent {}

class AmbilDataSellBloc extends SellEvent {
  final String? idCabang;

  AmbilDataSellBloc({required this.idCabang});
}

class SellResetSelectedItem extends SellEvent {}

class SellSelectedItem extends SellEvent {
  final ModelItemPesanan selectedItem;
  final bool edit;

  SellSelectedItem({required this.edit, required this.selectedItem});
}

class SellSelectedCondiment extends SellEvent {
  final ModelItemPesanan selectedCondiment;

  SellSelectedCondiment({required this.selectedCondiment});
}

class SellSearchItem extends SellEvent {
  final String text;

  SellSearchItem({required this.text});
}

class SellSelectedKategoriItem extends SellEvent {
  final ModelKategori selectedKategori;

  SellSelectedKategoriItem({required this.selectedKategori});
}

class SellUpdateOrderedItem extends SellEvent {
  final ModelItemPesanan updatedItem;

  SellUpdateOrderedItem({required this.updatedItem});
}

class SellAddOrderedItem extends SellEvent {}

class SellAdjustItem extends SellEvent {
  bool? mode;
  double? qty;
  int? discount;
  double? customprice;

  SellAdjustItem({this.mode, this.qty, this.discount, this.customprice});
}
