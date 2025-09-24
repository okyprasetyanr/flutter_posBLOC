import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/data/inventory_repository.dart';
import 'package:flutter_pos/features/inventory/data/inventory_repository_cache.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
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

    on<SelectedKategori>(_onSelectedKategori);

    on<SelectedItem>(_onSelectedItem);

    on<UploadKategori>(_onUploadKategori);

    on<ResetKategoriForm>(_onResetKategoriForm);

    on<ResetItemForm>(_onResetItemForm);

    on<Searchitem>(
      _onSearchItem,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
  }

  List<ModelItem> _filterItem(
    List<ModelItem> item,
    String status,
    String filter,
    String filterjenis,
  ) {
    List<ModelItem> list = item.where((e) {
      final isActive = e.getStatusItem;
      if (status == "Active") return isActive;
      if (status == "Deactive") return !isActive;
      return true;
    }).toList();

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

    return switch (filterjenis) {
      "Condiment" => list.where((e) => e.getstatusCondiment).toList(),
      "Normal" => list.where((e) => !e.getstatusCondiment).toList(),
      _ => list,
    };
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
          filteredDataItem: _filterItem(
            item,
            event.status,
            event.filter,
            event.filterjenis,
          ),
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
        kategori.sort((a, b) => a.getnamaKategori.compareTo(b.getnamaKategori));
        final loaded = InventoryLoaded(
          idCabang: firstCabang.getidCabang,
          daerahCabang: firstCabang.getdaerahCabang,
          datacabang: cabangs,
          dataItem: items,
          dataKategori: kategori,
          filteredDataItem: _filterItem(
            items,
            event.status,
            event.filter,
            event.filterjenis,
          ),
          selectedFilterItem: event.filter,
          selectedFilterJenisItem: event.filterjenis,
          selectedStatusItem: event.status,
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
          if (newItems.isNotEmpty) {
            loadedItem.addAll(newItems);
          }

          if (newKategori.isNotEmpty) {
            loadedKategori.addAll(newKategori);
          }
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
          event.filterjenis,
        );

        loadedKategori.sort(
          (a, b) => a.getnamaKategori.compareTo(b.getnamaKategori),
        );
        final copyWithLoaded = currentState.copyWith(
          selectedFilterItem: event.filter,
          selectedStatusItem: event.status,
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

    final item = await repo.ambilItem(event.data.getidCabang);
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    final newState = currentState.copyWith(
      dataItem: item,
      filteredDataItem: _filterItem(
        item,
        currentState.selectedStatusItem!,
        currentState.selectedFilterItem!,
        currentState.selectedFilterJenisItem!,
      ),
    );
    emit(newState);

    cacheRepo.saveCache(newState);
  }

  FutureOr<void> _onUploadKategori(
    UploadKategori event,
    Emitter<InventoryState> emit,
  ) async {
    add(ResetKategoriForm());
    await FirebaseFirestore.instance
        .collection("kategori")
        .doc(event.data['id_kategori'])
        .set(event.data);

    final kategori = await repo.ambilKategori(event.data['id_cabang']);
    kategori.sort((a, b) => a.getnamaKategori.compareTo(b.getnamaKategori));
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();

    final newState = currentState.copyWith(dataKategori: kategori);
    emit(newState);

    cacheRepo.saveCache(newState);
  }

  FutureOr<void> _onSelectedKategori(
    SelectedKategori event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    emit(
      currentState.copyWith(
        dataSelectedKategori: {
          "nama_kategori": event.selectedKategori['nama_kategori']!,
          "id_kategori": event.selectedKategori['id_kategori']!,
        },
      ),
    );
  }

  FutureOr<void> _onResetKategoriForm(
    ResetKategoriForm event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    emit(currentState.copyWith(dataSelectedKategori: {}));
  }

  FutureOr<void> _onSelectedItem(
    SelectedItem event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();

    emit(currentState.copyWith(dataSelectItem: event.selecteditem));
  }

  FutureOr<void> _onResetItemForm(
    ResetItemForm event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    emit(currentState.copyWith(dataSelectItem: {}));
  }

  FutureOr<void> _onSearchItem(Searchitem event, Emitter<InventoryState> emit) {
    final currentState = state is InventoryLoaded
        ? state as InventoryLoaded
        : InventoryLoaded();

    if (event.text.isNotEmpty) {
      final filtered = currentState.dataItem
          .where(
            (item) => item.getnamaItem.toLowerCase().contains(
              event.text.toLowerCase(),
            ),
          )
          .toList();

      emit(currentState.copyWith(filteredDataItem: filtered));
    } else {
      List<ModelItem> list = List.from(currentState.dataItem);
      emit(
        currentState.copyWith(
          filteredDataItem: _filterItem(
            list,
            currentState.selectedStatusItem!,
            currentState.selectedFilterItem!,
            currentState.selectedFilterJenisItem!,
          ),
        ),
      );
    }
  }
}
