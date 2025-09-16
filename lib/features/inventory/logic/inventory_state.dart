import 'package:flutter_pos/model_data/model_cabang.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';

class InventoryState {
  final String selectedFilter;
  final String selectedStatus;
  final List<ModelItem> filteredItems;

  InventoryState({
    this.selectedFilter = "A-Z",
    this.selectedStatus = "Active",
    this.filteredItems = const [],
  });

  InventoryState copyWith({
    String? selectedFilter,
    String? selectedStatus,
    List<ModelItem>? filteredItems,
  }) {
    return InventoryState(
      selectedFilter: selectedFilter ?? this.selectedFilter,
      selectedStatus: selectedStatus ?? this.selectedStatus,
      filteredItems: filteredItems ?? this.filteredItems,
    );
  }
}

class InventoryInitial extends InventoryState {}

class InventoryLoading extends InventoryState {}

class InventoryError extends InventoryState {
  final String message;
  InventoryError(this.message);
}

class InventoryCabangLoaded extends InventoryState {
  final List<ModelCabang> datacabang;
  final String? selectedCabang;
  final String? selectedIDCabang;

  InventoryCabangLoaded({
    required this.datacabang,
    this.selectedCabang,
    this.selectedIDCabang,
  });
}

class InventoryKategoriLoaded extends InventoryState {
  final List<ModelKategori> dataKategori;
  final String? selectedKategori;
  final String? selectedIDKategori;

  InventoryKategoriLoaded({
    required this.dataKategori,
    required this.selectedKategori,
    required this.selectedIDKategori,
  });
}

class InventoryItemLoaded extends InventoryState {
  final List<ModelItem> dataItem;
  final List<ModelItem> dataItemFiltered;

  InventoryItemLoaded({required this.dataItem, required this.dataItemFiltered});
}
