import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/data/inventory_repository.dart';
import 'package:flutter_pos/features/inventory/data/inventory_repository_cache.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final InventoryRepository repo;
  final InventoryRepositoryCache repocache;

  InventoryBloc(this.repo, this.repocache) : super(InventoryInitial()) {
    on<AmbilData>((event, emit) async {
      emit(InventoryLoading());
      try {
        final cabangs = await repo.ambilCabang();
        final items = await repo.ambilItem(cabangs.first.getidCabang);
        final kategori = await repo.ambilKategori(cabangs.first.getidCabang);
        final loaded = InventoryLoaded(
          idCabang: cabangs.first.getidCabang,
          daerahCabang: cabangs.first.getdaerahCabang,
          datacabang: cabangs,
          dataItem: items,
          dataKategori: kategori,
        );
        emit(loaded);

        repocache.saveCache(loaded);
      } catch (e) {
        emit(InventoryError("Error: $e"));
      }
    });
  }
}
