import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';

class InventoryRepositoryCache {
  InventoryLoaded? _cache;

  void saveCache(InventoryLoaded data) {
    _cache = data;
  }

  InventoryLoaded? get cache => _cache;
}
