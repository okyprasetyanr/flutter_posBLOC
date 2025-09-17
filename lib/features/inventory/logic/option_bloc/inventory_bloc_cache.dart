import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/data/inventory_repository_cache.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';
import 'package:intl/intl.dart';

class InventoryBlocCache extends Bloc<InventoryEvent, InventoryState> {
  final InventoryRepositoryCache cacherepo;

  InventoryBlocCache(this.cacherepo) : super(InventoryInitial()) {
    on<FilterItem>((event, emit) async {
      emit(InventoryLoading());
      try {
        List<ModelItem> item = cacherepo.cache!.dataItem;
        emit(
          InventoryFilteredItem(
            dataItem: _filterItem(item, event.status, event.filter),
          ),
        );
      } catch (e) {
        emit(InventoryError("Error: $e"));
      }
    });

    on<FilterKategori>((event, emit) {
      emit(InventoryLoading());
      try {
        emit(
          InventoryFilteredKategory(
            dataKategori: cacherepo.cache!.dataKategori
                .where((data) => data.getidCabang == event.idCabang)
                .toList(),
          ),
        );
      } catch (e) {
        emit(InventoryError("Error: $e"));
      }
    });
  }

  List<ModelItem> _filterItem(
    List<ModelItem> item,
    String status,
    String filter,
  ) {
    List<ModelItem> list = [];
    if (status == "Active") {
      list = item.where((e) => e.getStatusItem).toList();
    } else if (status == "Deactive") {
      list = item.where((e) => !e.getStatusItem).toList();
    }

    var formatter = DateFormat('dd-MM-yyyy');
    switch (filter) {
      case "A-Z":
        list.sort((a, b) => a.getnamaItem.compareTo(b.getnamaItem));
        break;
      case "Z-A":
        list.sort((a, b) => b.getnamaItem.compareTo(a.getnamaItem));
        break;
      case "Stock +":
        list.sort((a, b) => a.getqtyitem.compareTo(b.getqtyitem));
        break;
      case "Stock -":
        list.sort((a, b) => b.getqtyitem.compareTo(a.getqtyitem));
        break;
      case "Terbaru":
        list.sort(
          (a, b) => formatter
              .parse(a.getTanggalItem)
              .compareTo(formatter.parse(b.getTanggalItem)),
        );
        ;
        break;
      case "Terlama":
        list.sort(
          (a, b) => formatter
              .parse(b.getTanggalItem)
              .compareTo(formatter.parse(a.getTanggalItem)),
        );
        ;
        break;
    }
    return list;
  }
}
