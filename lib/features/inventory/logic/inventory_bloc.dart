import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/data/inventory_repository.dart';
import 'package:flutter_pos/features/inventory/data/inventory_repository_cache.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_cabang.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';
import 'package:intl/intl.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final InventoryRepository repo;
  final InventoryRepositoryCache cacheRepo;

  InventoryBloc(this.repo, this.cacheRepo) : super(InventoryInitial()) {
    on<AmbilData>(_onAmbilData);

    on<FilterItem>(_onFilteredItem);

    on<FilterCategory>(_onFilteredCategory);
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
              .parse(b.getTanggalItem)
              .compareTo(formatter.parse(a.getTanggalItem)),
        );
        break;
      case "Terlama":
        list.sort(
          (a, b) => formatter
              .parse(a.getTanggalItem)
              .compareTo(formatter.parse(b.getTanggalItem)),
        );
        break;
    }
    return list;
  }

  Future<void> _onFilteredItem(
    FilterItem event,
    Emitter<InventoryState> emit,
  ) async {
    try {
      List<ModelItem> item = cacheRepo.cache!.dataItem!;
      emit(
        InventoryAllFilteredItem(
          dataitem: _filterItem(item, event.status, event.filter),
        ),
      );
    } catch (e) {
      emit(InventoryError("Error: Kesalahan Data, $e"));
    }
  }

  Future<void> _onFilteredCategory(
    FilterCategory event,
    Emitter<InventoryState> emit,
  ) async {
    try {
      emit(
        InventoryFilteredCategory(
          dataKategori: cacheRepo.cache!.dataKategori!
              .where((data) => data.getidCabang == event.idCabang)
              .toList(),
        ),
      );
    } catch (e) {
      emit(InventoryError("Error: Kesalahan Data, $e"));
    }
  }

  Future<void> _onAmbilData(
    AmbilData event,
    Emitter<InventoryState> emit,
  ) async {
    emit(InventoryLoading());
    try {
      List<ModelCabang> cabangs = [];
      List<ModelItem> items = [];
      List<ModelKategori> kategori = [];
      InventoryLoaded loaded = InventoryLoaded(
        idCabang: null,
        daerahCabang: null,
        datacabang: [],
        dataItem: [],
        dataKategori: [],
      );

      InventoryLoaded cache = cacheRepo.cache!;
      if (event.idCabang == null) {
        cabangs = await repo.ambilCabang();
        items = await repo.ambilItem(cabangs.first.getidCabang);
        kategori = await repo.ambilKategori(cabangs.first.getidCabang);
        loaded = InventoryLoaded(
          idCabang: cabangs.first.getidCabang,
          daerahCabang: cabangs.first.getdaerahCabang,
          datacabang: cabangs,
          dataItem: items,
          dataKategori: kategori,
        );
        emit(loaded);
        cacheRepo.saveCache(loaded);
      } else {
        if (cache.idCabang != null) {
          String daerahCabang = cache.datacabang!
              .where((data) => data.getidCabang == event.idCabang)
              .first
              .getdaerahCabang;
          if (cache.dataItem!.any(
            (data) => data.getidCabang == event.idCabang,
          )) {
            items = await repo.ambilItem(event.idCabang!);
            kategori = await repo.ambilKategori(event.idCabang!);
            cache.dataItem!.addAll(items);
            cache.dataKategori!.addAll(kategori);

            loaded = InventoryLoaded(
              idCabang: event.idCabang,
              daerahCabang: daerahCabang,
              datacabang: cacheRepo.cache!.datacabang,
              dataItem: items,
              dataKategori: kategori,
            );
            emit(loaded);
          } else {
            loaded = InventoryLoaded(
              idCabang: event.idCabang,
              daerahCabang: cache.datacabang!
                  .where((data) => data.getidCabang == event.idCabang)
                  .first
                  .getdaerahCabang,
              datacabang: cache.datacabang,
              dataItem: cache.dataItem!
                  .where((data) => data.getidCabang == event.idCabang)
                  .toList(),
              dataKategori: cache.dataKategori!
                  .where((data) => data.getidCabang == event.idCabang)
                  .toList(),
            );
            emit(loaded);
          }
          cacheRepo.saveCache(
            InventoryLoaded(
              daerahCabang: daerahCabang,
              idCabang: event.idCabang,
            ),
          );
        } else {
          emit(InventoryError("Error: Kesalahan Load Data"));
        }

        emit(
          InventoryAllFilteredItem(
            dataitem: _filterItem(loaded.dataItem!, event.status, event.filter),
          ),
        );

        emit(
          InventoryFilteredCategory(
            dataKategori: loaded.dataKategori!
                .where((data) => data.getidCabang == loaded.idCabang)
                .toList(),
          ),
        );
      }
    } catch (e) {
      emit(InventoryError("Error: Kesalahan Data, $e"));
    }
  }
}
