import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';
import 'package:intl/intl.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final DataUserRepositoryCache repoCahce;

  InventoryBloc(this.repoCahce) : super(InventoryInitial()) {
    print("Log InventoryBloc: Masuk Bloc");
    on<AmbilDataInventoryBloc>(_onAmbilData);

    on<InvFilterItem>(_onFilteredItem);

    on<UploadItem>(_onUploadItem);

    on<InvSelectedKategori>(_onSelectedKategori);

    on<InvSelectedKategoriItem>(_onSelectedKategoriItem);

    on<InvSelectedItem>(_onSelectedItem);

    on<UpdateSelectedItem>(
      _onUpdateSelectedItem,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );

    on<UploadKategori>(_onUploadKategori);

    on<ResetKategoriForm>(_onResetKategoriForm);

    on<ResetItemForm>(_onResetItemForm);

    on<CondimentForm>(_onCondimentForm);

    on<InvSearchitem>(
      _onSearchItem,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
  }

  List<ModelItem> _filterItem(
    List<ModelItem> item,
    String status,
    String filter,
    String filterjenis,
    String filterIDKategori,
  ) {
    List<ModelItem> list = item.where((element) {
      final isActive = element.getStatusItem;
      if (status == "Active") return isActive;
      if (status == "Deactive") return !isActive;
      return true;
    }).toList();

    if (filterIDKategori != "0") {
      list = list
          .where((element) => element.getidKategoriItem == filterIDKategori)
          .toList();
    } else {
      list;
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

    return switch (filterjenis) {
      "Condiment" => list.where((e) => e.getstatusCondiment).toList(),
      "Normal" => list.where((e) => !e.getstatusCondiment).toList(),
      _ => list,
    };
  }

  Future<void> _onFilteredItem(
    InvFilterItem event,
    Emitter<InventoryState> emit,
  ) async {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    try {
      List<ModelItem> item = List.from(currentState.dataItem);
      emit(
        currentState.copyWith(
          filteredDataItem: _filterItem(
            item,
            event.status,
            event.filter,
            event.filterjenis,
            event.filterIDKategori,
          ),
        ),
      );
    } catch (e) {
      emit(InventoryError("Error: Kesalahan Data, $e"));
    }
  }

  Future<void> _onAmbilData(
    AmbilDataInventoryBloc event,
    Emitter<InventoryState> emit,
  ) async {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();

    emit(InventoryLoading());

    try {
      if (event.idCabang == null) {
        final cabangs = repoCahce.ambilCabang();

        final firstCabang = cabangs.first;
        final items = repoCahce.ambilItem(firstCabang.getidCabang);
        final kategori = repoCahce.ambilKategori(firstCabang.getidCabang);
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
            event.filterIDKategori,
          ),
          selectedFilterItem: event.filter,
          selectedFilterJenisItem: event.filterjenis,
          selectedStatusItem: event.status,
          selectedFilterIDKategoriItem: event.filterIDKategori,
        );

        emit(loaded);
      } else {
        List<ModelItem> loadedItem = List.from(currentState.dataItem);
        List<ModelKategori> loadedKategori = List.from(
          currentState.dataKategori,
        );

        bool cekDataItem = loadedItem.any(
          (item) => item.getidCabang == event.idCabang,
        );

        if (!cekDataItem) {
          final newItems = repoCahce.ambilItem(event.idCabang!);
          final newKategori = repoCahce.ambilKategori(event.idCabang!);
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
          event.filterIDKategori,
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
    final item = repoCahce.ambilItem(event.data.getidCabang);
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    final newState = currentState.copyWith(
      dataSelectedItem: null,
      condimentForm: false,
      dataItem: item,
      filteredDataItem: _filterItem(
        item,
        currentState.selectedStatusItem!,
        currentState.selectedFilterItem!,
        currentState.selectedFilterJenisItem!,
        currentState.selectedFilterIDKategoriItem!,
      ),
    );
    emit(newState);
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

    final kategori = repoCahce.ambilKategori(event.data['id_cabang']);
    kategori.sort((a, b) => a.getnamaKategori.compareTo(b.getnamaKategori));
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();

    final newState = currentState.copyWith(dataKategori: kategori);
    emit(newState);
  }

  FutureOr<void> _onResetKategoriForm(
    ResetKategoriForm event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    emit(currentState.copyWith(dataSelectedKategori: null));
  }

  FutureOr<void> _onSelectedKategori(
    InvSelectedKategori event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    emit(currentState.copyWith(dataSelectedKategori: event.selectedKategori));
  }

  FutureOr<void> _onSelectedKategoriItem(
    InvSelectedKategoriItem event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();

    emit(
      currentState.copyWith(dataSelectedKategoriItem: event.dataKategoriItem),
    );
  }

  FutureOr<void> _onSelectedItem(
    InvSelectedItem event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    emit(
      currentState.copyWith(
        dataSelectedItem: event.selectedItem,
        updateDataSelectedItem: event.selectedItem,
      ),
    );
  }

  FutureOr<void> _onResetItemForm(
    ResetItemForm event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    emit(
      currentState.copyWith(
        dataSelectedItem: null,
        condimentForm: false,
        dataSelectedKategori: null,
        updateDataSelectedItem: null,
      ),
    );
  }

  FutureOr<void> _onSearchItem(
    InvSearchitem event,
    Emitter<InventoryState> emit,
  ) {
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
            currentState.selectedFilterIDKategoriItem!,
          ),
        ),
      );
    }
  }

  FutureOr<void> _onCondimentForm(
    CondimentForm event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? state as InventoryLoaded
        : InventoryLoaded();
    print("Log InventoryBloc: ${event.condimentForm}");
    emit(currentState.copyWith(condimentForm: event.condimentForm));
  }

  FutureOr<void> _onUpdateSelectedItem(
    UpdateSelectedItem event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? state as InventoryLoaded
        : InventoryLoaded();

    final data = currentState.updateDataSelectedItem;
    data?.setBarcode = event.barcodeItem ?? "";
    data?.setnamaItem = event.namaItem ?? "";
    data?.sethargaItem = event.hargaItem ?? "";

    currentState.copyWith(updateDataSelectedItem: data);
  }
}
