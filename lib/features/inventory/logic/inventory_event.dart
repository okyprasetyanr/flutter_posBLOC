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

class FilterCategory extends InventoryEvent {
  final String idCabang;
  FilterCategory({required this.idCabang});
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
