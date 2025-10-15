import 'package:flutter_pos/model_data/model_item_pesanan.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';

class SellEvent {}

class AmbilDataSellBloc extends SellEvent {
  final String? idCabang;

  AmbilDataSellBloc({required this.idCabang});
}

class SellResetSelectedItem extends SellEvent {}

class SellSelectedItem extends SellEvent {
  final ModelItemPesanan selectedItem;

  SellSelectedItem({required this.selectedItem});
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

class SellAdjustQtyItem extends SellEvent {
  final bool mode;

  SellAdjustQtyItem({required this.mode});
}
