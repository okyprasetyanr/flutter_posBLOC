class InventoryEvent {}

class AmbilData extends InventoryEvent {}

class FilterItem extends InventoryEvent {
  final String filter;
  final String status;
  FilterItem({required this.filter, required this.status});
}

class FilterCategory extends InventoryEvent {
  final String idCabang;
  FilterCategory({required this.idCabang});
}
