import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/request/delete_data.dart';
import 'package:intl/intl.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final DataUserRepositoryCache repoCache;

  InventoryBloc(this.repoCache) : super(InventoryInitial()) {
    print("Log InventoryBloc: Masuk Bloc");
    on<InvGetData>(_onGetData);

    on<InvFilterItem>(_onFilteredItem);

    on<InvUploadItem>(_onUploadItem);

    on<InvSelectedKategori>(_onSelectedKategori);

    on<InvSelectedKategoriItem>(_onSelectedKategoriItem);

    on<InvSelectedItem>(_onSelectedItem);

    on<InvUploadCategory>(_onUploadKategori);

    on<InvResetCategoryForm>(_onResetKategoriForm);

    on<InvResetItemForm>(_onResetItemForm);

    on<InvCondimentForm>(_onCondimentForm);

    on<InvDeleteCategory>(_onDeleteCategory);
    on<InvDeleteItem>(_onDeleteItem);

    on<InvSearchitem>(
      _onSearchItem,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
  }

  List<ModelItem> _filterItem(
    String status,
    String filter,
    String filterjenis,
    String filterIDKategori, {
    List<ModelItem>? items,
  }) {
    final currentState = state;
    if (currentState is InventoryLoaded) {
      List<ModelItem> item = items ?? List.from(currentState.dataItem);
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
          list.sort((a, b) => a.getqtyItem.compareTo(b.getqtyItem));
          break;
        case "Stock -":
          list.sort((a, b) => b.getqtyItem.compareTo(a.getqtyItem));
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

  Future<void> _onGetData(
    InvGetData event,
    Emitter<InventoryState> emit,
  ) async {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();

    emit(InventoryLoading());

    try {
      if (event.idBranch == null) {
        final cabangs = repoCache.getBranch();

        final firstCabang = cabangs.first;
        final items = repoCache.getItem(firstCabang.getidBranch);
        debugPrint("Log InventoryBloc: items: $items");
        final kategori = repoCache.getCategory(firstCabang.getidBranch);
        kategori.sort((a, b) => a.getnameCategory.compareTo(b.getnameCategory));
        emit(
          InventoryLoaded(
            selectedIdBranch: firstCabang.getidBranch,
            daerahCabang: firstCabang.getareaBranch,
            datacabang: cabangs,
            dataItem: items,
            dataKategori: kategori,
            selectedFilterItem: event.filter,
            selectedFilterJenisItem: event.filterjenis,
            selectedStatusItem: event.status,
            selectedFilterIDKategoriItem: event.filterIDKategori,
          ),
        );
      } else {
        List<ModelItem> loadedItem = List.from(currentState.dataItem);
        List<ModelCategory> loadedKategori = List.from(
          currentState.dataKategori,
        );

        bool checkDataItem = loadedItem.any(
          (item) => item.getidBranch == event.idBranch,
        );

        if (!checkDataItem) {
          final newItems = repoCache.getItem(event.idBranch!);
          final newKategori = repoCache.getCategory(event.idBranch!);
          if (newItems.isNotEmpty) {
            loadedItem.addAll(newItems);
          }

          if (newKategori.isNotEmpty) {
            loadedKategori.addAll(newKategori);
          }
        }

        final daerahCabang = currentState.datacabang
            .firstWhere((data) => data.getidBranch == event.idBranch)
            .getareaBranch;

        loadedKategori.sort(
          (a, b) => a.getnameCategory.compareTo(b.getnameCategory),
        );
        final copyWithLoaded = currentState.copyWith(
          selectedFilterItem: event.filter,
          selectedStatusItem: event.status,
          idBranch: event.idBranch,
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
    await event.item.pushDataItem();
    final currentState = state;
    if (currentState is InventoryLoaded) {
      final edit = repoCache.dataItem!.any(
        (element) => element.getidItem == event.item.getidItem,
      );

      if (edit) {
        final indexCategory = repoCache.dataItem!.indexWhere(
          (element) => element.getidItem == event.item.getidItem,
        );

        repoCache.dataItem![indexCategory] = event.item;
      } else {
        repoCache.dataItem!.add(event.item);
      }

      final item = repoCache.getItem(event.item.getidBranch);
      item.sort((a, b) => a.getnameItem.compareTo(b.getnameItem));

      emit(
        currentState.copyWith(
          dataSelectedItem: null,
          condimentForm: false,
          dataItem: item,
          filteredDataItem: _filterItem(
            items: item,
            currentState.selectedStatusItem!,
            currentState.selectedFilterItem!,
            currentState.selectedFilterJenisItem!,
            currentState.selectedFilterIDKategoriItem!,
          ),
        ),
      );
    }
  }

  FutureOr<void> _onUploadKategori(
    InvUploadCategory event,
    Emitter<InventoryState> emit,
  ) async {
    await event.category.pushDataCategory();
    add(InvResetCategoryForm());
    final currentState = state;
    if (currentState is InventoryLoaded) {
      final edit = currentState.dataKategori.any(
        (element) => element.getidCategory == event.category.getidCategory,
      );
      if (edit) {
        final indexCategory = repoCache.dataCategory!.indexWhere(
          (element) => element.getidCategory == event.category.getidCategory,
        );

        repoCache.dataCategory![indexCategory] = event.category;
      } else {
        repoCache.dataCategory!.add(event.category);
      }
      final category = repoCache.getCategory(event.category.getidBranch);
      category.sort((a, b) => a.getnameCategory.compareTo(b.getnameCategory));

      emit(currentState.copyWith(dataKategori: category));
    }
  }

  FutureOr<void> _onResetKategoriForm(
    InvResetCategoryForm event,
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

  Future<void> _onDeleteCategory(
    InvDeleteCategory event,
    Emitter<InventoryState> emit,
  ) async {
    await deleteDataCategory(event.id);
    repoCache.dataCategory!.removeWhere(
      (element) => element.getidCategory == event.id,
    );
    final currentState = state;
    if (currentState is InventoryLoaded) {
      final dataCategory = await repoCache.getCategory(
        currentState.selectedIdBranch!,
      );
      dataCategory.sort(
        (a, b) => a.getnameCategory.compareTo(b.getnameCategory),
      );

      emit(currentState.copyWith(dataKategori: dataCategory));
    }
  }

  Future<void> _onDeleteItem(
    InvDeleteItem event,
    Emitter<InventoryState> emit,
  ) async {
    await deleteDataCategory(event.id);
    repoCache.dataItem!.removeWhere((element) => element.getidItem == event.id);
    final currentState = state;
    if (currentState is InventoryLoaded) {
      add(
        InvGetData(
          filter: currentState.selectedFilterItem!,
          status: currentState.selectedStatusItem!,
          idBranch: currentState.selectedIdBranch!,
          filterjenis: currentState.selectedFilterJenisItem!,
          filterIDKategori: currentState.selectedFilterIDKategoriItem!,
        ),
      );
    }
  }
}
