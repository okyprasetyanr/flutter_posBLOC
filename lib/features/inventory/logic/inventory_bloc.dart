import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:intl/intl.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final DataUserRepositoryCache repoCahce;

  InventoryBloc(this.repoCahce) : super(InventoryInitial()) {
    print("Log InventoryBloc: Masuk Bloc");
    on<InvAmbilData>(_onAmbilData);

    on<InvFilterItem>(_onFilteredItem);

    on<InvUploadItem>(_onUploadItem);

    on<InvSelectedKategori>(_onSelectedKategori);

    on<InvSelectedKategoriItem>(_onSelectedKategoriItem);

    on<InvSelectedItem>(_onSelectedItem);

    on<InvUploadKategori>(_onUploadKategori);

    on<InvResetKategoriForm>(_onResetKategoriForm);

    on<InvResetItemForm>(_onResetItemForm);

    on<InvCondimentForm>(_onCondimentForm);

    on<InvSearchitem>(
      _onSearchItem,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
  }

  List<ModelItem> _filterItem(
    String status,
    String filter,
    String filterjenis,
    String filterIDKategori,
  ) {
    final currentState = state;
    if (currentState is InventoryLoaded) {
      List<ModelItem> item = List.from(currentState.dataItem);
      List<ModelItem> list = item.where((element) {
        final isActive = element.getStatusItem;
        if (status == "Active") return isActive;
        if (status == "Deactive") return !isActive;
        return true;
      }).toList();

      if (filterIDKategori != "0") {
        list = list
            .where((element) => element.getidCategoryiItem == filterIDKategori)
            .toList();
      } else {
        list;
      }

      var formatter = DateFormat('dd-MM-yyyy');
      switch (filter) {
        case "A-Z":
          list.sort((a, b) => a.getnameItem.compareTo(b.getnameItem));
          break;
        case "Z-A":
          list.sort((a, b) => b.getnameItem.compareTo(a.getnameItem));
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
                .parse(b.getDateItem)
                .compareTo(formatter.parse(a.getDateItem)),
          );
          break;
        case "Terlama":
          list.sort(
            (a, b) => formatter
                .parse(a.getDateItem)
                .compareTo(formatter.parse(b.getDateItem)),
          );
          break;
      }

      return switch (filterjenis) {
        "Condiment" => list.where((e) => e.getstatusCondiment).toList(),
        "Normal" => list.where((e) => !e.getstatusCondiment).toList(),
        _ => list,
      };
    }
    return [];
  }

  Future<void> _onFilteredItem(
    InvFilterItem event,
    Emitter<InventoryState> emit,
  ) async {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    try {
      emit(
        currentState.copyWith(
          filteredDataItem: _filterItem(
            event.status,
            event.filter,
            event.filterjenis,
            event.filterIDKategori,
          ),
          selectedStatusItem: event.status,
          selectedFilterItem: event.filter,
          selectedFilterJenisItem: event.filterjenis,
          selectedFilterIDKategoriItem: event.filterIDKategori,
        ),
      );
    } catch (e) {
      emit(InventoryError("Error: Kesalahan Data, $e"));
    }
  }

  Future<void> _onAmbilData(
    InvAmbilData event,
    Emitter<InventoryState> emit,
  ) async {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();

    emit(InventoryLoading());

    try {
      if (event.idCabang == null) {
        final cabangs = repoCahce.getBranch();

        final firstCabang = cabangs.first;
        final items = repoCahce.getItem(firstCabang.getidBranch);
        final kategori = repoCahce.getCategory(firstCabang.getidBranch);
        kategori.sort((a, b) => a.getnameCategory.compareTo(b.getnameCategory));
        final loaded = InventoryLoaded(
          idCabang: firstCabang.getidBranch,
          daerahCabang: firstCabang.getareaBranch,
          datacabang: cabangs,
          dataItem: items,
          dataKategori: kategori,
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
          (item) => item.getidBranch == event.idCabang,
        );

        if (!cekDataItem) {
          final newItems = repoCahce.getItem(event.idCabang!);
          final newKategori = repoCahce.getCategory(event.idCabang!);
          if (newItems.isNotEmpty) {
            loadedItem.addAll(newItems);
          }

          if (newKategori.isNotEmpty) {
            loadedKategori.addAll(newKategori);
          }
        }

        final daerahCabang = currentState.datacabang
            .firstWhere((data) => data.getidBranch == event.idCabang)
            .getareaBranch;

        loadedKategori.sort(
          (a, b) => a.getnameCategory.compareTo(b.getnameCategory),
        );
        final copyWithLoaded = currentState.copyWith(
          selectedFilterItem: event.filter,
          selectedStatusItem: event.status,
          idCabang: event.idCabang,
          daerahCabang: daerahCabang,
          dataItem: loadedItem,
          dataKategori: loadedKategori,
        );

        emit(copyWithLoaded);
      }
      add(
        InvFilterItem(
          filter: currentState.selectedFilterItem!,
          status: currentState.selectedStatusItem!,
          filterjenis: currentState.selectedFilterJenisItem!,
          filterIDKategori: currentState.selectedFilterIDKategoriItem!,
        ),
      );
    } catch (e) {
      emit(InventoryError("Error: Terjadi kesalahan saat memuat data, $e"));
    }
  }

  FutureOr<void> _onUploadItem(
    InvUploadItem event,
    Emitter<InventoryState> emit,
  ) async {
    add(InvResetItemForm());
    await FirebaseFirestore.instance
        .collection("items")
        .doc(event.data.getidItem)
        .set(convertToMapItem(event.data));

    print("InvBloc UploadItem: ${event.data}");

    final item = repoCahce.getItem(event.data.getidBranch);
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    await repoCahce.initItem();

    final newState = currentState.copyWith(
      dataSelectedItem: null,
      condimentForm: false,
      dataItem: item,
      filteredDataItem: _filterItem(
        currentState.selectedStatusItem!,
        currentState.selectedFilterItem!,
        currentState.selectedFilterJenisItem!,
        currentState.selectedFilterIDKategoriItem!,
      ),
    );

    emit(newState);
  }

  FutureOr<void> _onUploadKategori(
    InvUploadKategori event,
    Emitter<InventoryState> emit,
  ) async {
    await FirebaseFirestore.instance
        .collection("kategori")
        .doc(event.data['id_kategori'])
        .set(event.data);

    add(InvResetKategoriForm());
    final kategori = repoCahce.getCategory(event.data['id_cabang']);
    kategori.sort((a, b) => a.getnameCategory.compareTo(b.getnameCategory));
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();

    final newState = currentState.copyWith(dataKategori: kategori);
    emit(newState);
  }

  FutureOr<void> _onResetKategoriForm(
    InvResetKategoriForm event,
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

    print("Log InventoryBloc SelectedKategoriItem: ${event.dataKategoriItem}");
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
    print("Log InventoryBloc SelectedItem: ${event.selectedItem}");
    emit(currentState.copyWith(dataSelectedItem: event.selectedItem));
  }

  FutureOr<void> _onResetItemForm(
    InvResetItemForm event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();

    emit(
      currentState.copyWith(
        dataSelectedItem: null,
        condimentForm: false,
        dataSelectedKategoriItem: null,
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
            (item) => item.getnameItem.toLowerCase().contains(
              event.text.toLowerCase(),
            ),
          )
          .toList();

      emit(currentState.copyWith(filteredDataItem: filtered));
    } else {
      emit(
        currentState.copyWith(
          filteredDataItem: _filterItem(
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
    InvCondimentForm event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? state as InventoryLoaded
        : InventoryLoaded();
    print("Log InventoryBloc CondimentForm: ${event.condimentForm}");
    emit(currentState.copyWith(condimentForm: event.condimentForm));
  }
}
