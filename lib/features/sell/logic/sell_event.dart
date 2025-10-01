import 'package:flutter_pos/model_data/model_item.dart';

class SellEvent {}

class AmbilDataSellBloc extends SellEvent {
  final String filterIDKategori;
  final String? idCabang;

  AmbilDataSellBloc({required this.filterIDKategori, required this.idCabang});
}

class SellSelectedItem extends SellEvent {
  final ModelItem selectedItem;

  SellSelectedItem({required this.selectedItem});
}

class SellSearchItem extends SellEvent {
  final String text;

  SellSearchItem({required this.text});
}
