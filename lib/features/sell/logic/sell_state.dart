import 'package:flutter_pos/model_data/model_item.dart';

class SellState {}

class SellInitial extends SellState {}

class SellLoading extends SellState {}

class SellLoaded extends SellState {
  final List<ModelItem>? filteredItem;
  final List<ModelItem>? listKategori;
  final List<ModelItem>? listCabang;
  final String? idCabang;

  SellLoaded({
    this.filteredItem = const [],
    this.listKategori = const [],
    this.listCabang = const [],
    this.idCabang,
  });

  SellLoaded copyWith({
    List<ModelItem>? filteredItem,
    String? idCabang,
    List<ModelItem>? listKategori,
    List<ModelItem>? listCabang,
  }) {
    return SellLoaded(
      listCabang: listCabang ?? this.listCabang,
      listKategori: listKategori ?? this.listKategori,
      filteredItem: filteredItem ?? this.filteredItem,
      idCabang: idCabang ?? this.idCabang,
    );
  }
}
