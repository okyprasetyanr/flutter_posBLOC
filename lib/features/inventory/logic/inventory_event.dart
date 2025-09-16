class InventoryEvent {}

class AmbilCabang extends InventoryEvent {}

class AmbilItem extends InventoryEvent {}

class FilterItem extends InventoryEvent {
  final String filter;
  final String status;
  FilterItem({required this.filter, required this.status});
}
