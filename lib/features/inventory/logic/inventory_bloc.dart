import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/data/inventory_repository.dart';
import 'package:flutter_pos/features/inventory/data/inventory_repository_cache.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';
import 'package:intl/intl.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final InventoryRepository repo;
  final InventoryRepositoryCache cacheRepo;

  InventoryBloc(this.repo, this.cacheRepo) : super(InventoryInitial()) {
    on<AmbilData>(_onAmbilData);

    on<FilterItem>(_onFilteredItem);

    on<UploadItem>(_onUploadItem);
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
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    try {
      List<ModelItem> item = cacheRepo.cache!.dataItem;
      emit(
        currentState.copyWith(
          filteredDataItem: _filterItem(item, event.status, event.filter),
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
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();

    emit(InventoryLoading());

    try {
      if (event.idCabang == null) {
        final cabangs = await repo.ambilCabang();
        if (cabangs.isEmpty) {
          emit(InventoryError("Error: Tidak ada data cabang yang ditemukan."));
          return;
        }

        final firstCabang = cabangs.first;
        final items = await repo.ambilItem(firstCabang.getidCabang);
        final kategori = await repo.ambilKategori(firstCabang.getidCabang);

        final loaded = InventoryLoaded(
          idCabang: firstCabang.getidCabang,
          daerahCabang: firstCabang.getdaerahCabang,
          datacabang: cabangs,
          dataItem: items,
          dataKategori: kategori,
          filteredDataItem: _filterItem(items, event.status, event.filter),
        );

        cacheRepo.saveCache(loaded);
        emit(loaded);
      } else {
        List<ModelItem> loadedItem = List.from(cacheRepo.cache!.dataItem);
        List<ModelKategori> loadedKategori = List.from(
          cacheRepo.cache!.dataKategori,
        );

        bool cekDataItem = loadedItem.any(
          (item) => item.getidCabang == event.idCabang,
        );

        if (!cekDataItem) {
          final newItems = await repo.ambilItem(event.idCabang!);
          final newKategori = await repo.ambilKategori(event.idCabang!);
          loadedItem.addAll(newItems);
          loadedKategori.addAll(newKategori);
        }

        final daerahCabang = currentState.datacabang
            .firstWhere((data) => data.getidCabang == event.idCabang)
            .getdaerahCabang;

        final loadedItembyCabang = loadedItem
            .where((item) => item.getidCabang == event.idCabang)
            .toList();

        final filteredItems = _filterItem(
          loadedItembyCabang,
          event.status,
          event.filter,
        );

        final copyWithLoaded = currentState.copyWith(
          idCabang: event.idCabang,
          daerahCabang: daerahCabang,
          dataItem: loadedItem,
          dataKategori: loadedKategori,
          filteredDataItem: filteredItems,
        );

        cacheRepo.saveCache(copyWithLoaded);
        emit(copyWithLoaded);
      }
    } catch (e) {
      emit(InventoryError("Error: Terjadi kesalahan saat memuat data, $e"));
    }
  }

  FutureOr<void> _onUploadItem(
    UploadItem event,
    Emitter<InventoryState> emit,
  ) async {
    await FirebaseFirestore.instance
        .collection("items")
        .doc(event.data.getidItem)
        .set(convertToMapItem(event.data));
  }
}
