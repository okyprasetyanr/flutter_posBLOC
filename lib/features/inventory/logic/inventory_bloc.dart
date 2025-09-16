import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/data/inventory_repository.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final InventoryRepository repo;

  InventoryBloc(this.repo) : super(InventoryInitial()) {
    on<AmbilCabang>((event, emit) async {
      emit(InventoryLoading());
      try {
        final cabangs = await repo.fetchCabang();
        emit(
          InventoryLoaded(datacabang: cabangs, dataItem: [], dataKategori: []),
        );
      } catch (e) {
        emit(InventoryError("Error: $e"));
      }
    });
  }
}
