import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/request/delete_data.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final DataUserRepositoryCache repoCache;

  InventoryBloc(this.repoCache) : super(InventoryInitial()) {
    debugPrint("Log InventoryBloc: Masuk Bloc");
    on<InvGetData>(_onGetData);

    on<InvFilterItem>(_onFilteredItem);

    on<InvUploadItem>(_onUploadItem);

    on<InvSelectedCategory>(_onSelectedCategory);

    on<InvSelectedCategoryItem>(_onSelectedCategoryItem);

    on<InvSelectedItem>(_onSelectedItem);

    on<InvUploadCategory>(_onUploadCategory);

    on<InvResetCategoryForm>(_onResetCategoryForm);

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
    String filterIDCategory, {
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

      debugPrint(
        "Log InventoryBloc: _filteritem: $status,$filter,$filterjenis,$filterIDCategory,$item",
      );

      if (filterIDCategory != "0") {
        list = list
            .where((element) => element.getidCategoryiItem == filterIDCategory)
            .toList();
      } else {
        list;
      }

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
            (a, b) => formatDate(
              date: b.getDateItem,
            ).compareTo(formatDate(date: a.getDateItem)),
          );
          break;
        case "Terlama":
          list.sort(
            (a, b) => formatDate(
              date: b.getDateItem,
            ).compareTo(formatDate(date: a.getDateItem)),
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
            event.filterIDCategory,
          ),
          selectedStatusItem: event.status,
          selectedFilterItem: event.filter,
          selectedFilterJenisItem: event.filterjenis,
          selectedFilterIDCategoryItem: event.filterIDCategory,
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

    final dataBranch = currentState.dataBranch ?? repoCache.getBranch();

    final idBranch = event.idBranch ?? dataBranch.first.getidBranch;
    final areaBranch = dataBranch
        .firstWhere((element) => element.getidBranch == idBranch)
        .getareaBranch;
    final items = repoCache.getItem(idBranch);
    debugPrint("Log InventoryBloc: items: $items");
    final category = repoCache.getCategory(idBranch);
    category.sort((a, b) => a.getnameCategory.compareTo(b.getnameCategory));
    emit(
      InventoryLoaded(
        idBranch: idBranch,
        areaBranch: areaBranch,
        dataBranch: dataBranch,
        dataItem: items,
        dataCategory: category,
        filteredDataItem: _filterItem(
          items: items,
          event.status,
          event.filter,
          event.filterjenis,
          event.filterIDCategory,
        ),
        selectedFilterItem: event.filter,
        selectedFilterJenisItem: event.filterjenis,
        selectedStatusItem: event.status,
        selectedFilterIDCategoryItem: event.filterIDCategory,
      ),
    );
  }

  FutureOr<void> _onUploadItem(
    InvUploadItem event,
    Emitter<InventoryState> emit,
  ) async {
    add(InvResetItemForm());
    await event.item.pushDataItem();

    debugPrint("Log InventoryBloc: PushData: ${event.item}");
    final currentState = state;
    if (currentState is InventoryLoaded) {
      final indexCategory = repoCache.dataItem!.indexWhere(
        (element) => element.getidItem == event.item.getidItem,
      );

      if (indexCategory != -1) {
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
            currentState.selectedFilterIDCategoryItem!,
          ),
        ),
      );
    }
  }

  FutureOr<void> _onUploadCategory(
    InvUploadCategory event,
    Emitter<InventoryState> emit,
  ) async {
    await event.category.pushDataCategory();
    add(InvResetCategoryForm());
    final currentState = state;
    if (currentState is InventoryLoaded) {
      final indexCategory = repoCache.dataCategory!.indexWhere(
        (element) => element.getidCategory == event.category.getidCategory,
      );

      if (indexCategory != -1) {
        repoCache.dataCategory![indexCategory] = event.category;
      } else {
        repoCache.dataCategory!.add(event.category);
      }

      final category = repoCache.getCategory(event.category.getidBranch);
      category.sort((a, b) => a.getnameCategory.compareTo(b.getnameCategory));

      debugPrint("Log InvBloc: UploadCategory: $category");

      emit(currentState.copyWith(dataCategory: category));
    }
  }

  FutureOr<void> _onResetCategoryForm(
    InvResetCategoryForm event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    emit(currentState.copyWith(dataSelectedCategory: null));
  }

  FutureOr<void> _onSelectedCategory(
    InvSelectedCategory event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    emit(currentState.copyWith(dataSelectedCategory: event.selectedCategory));
  }

  FutureOr<void> _onSelectedCategoryItem(
    InvSelectedCategoryItem event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();

    debugPrint(
      "Log InventoryBloc SelectedCategoryItem: ${event.dataCategoryItem}",
    );
    emit(
      currentState.copyWith(dataSelectedCategoryItem: event.dataCategoryItem),
    );
  }

  FutureOr<void> _onSelectedItem(
    InvSelectedItem event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();
    debugPrint("Log InventoryBloc SelectedItem: ${event.selectedItem}");
    emit(currentState.copyWith(dataSelectedItem: event.selectedItem));
  }

  FutureOr<void> _onResetItemForm(
    InvResetItemForm event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state is InventoryLoaded
        ? (state as InventoryLoaded)
        : InventoryLoaded();

    debugPrint("Log InventoryBloc: resetSelectedItem: masuk");
    emit(
      currentState.copyWith(
        dataSelectedItem: null,
        condimentForm: false,
        dataSelectedCategoryItem: null,
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
            currentState.selectedFilterIDCategoryItem!,
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
    debugPrint(
      "Log InventoryBloc CondimentForm: ${event.condimentForm} ${currentState.dataSelectedItem}",
    );

    emit(
      currentState.copyWith(
        condimentForm: event.condimentForm,
        dataSelectedItem: currentState.dataSelectedItem ?? null,
      ),
    );
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
      final dataCategory = await repoCache.getCategory(currentState.idBranch!);
      dataCategory.sort(
        (a, b) => a.getnameCategory.compareTo(b.getnameCategory),
      );

      emit(currentState.copyWith(dataCategory: dataCategory));
    }
  }

  Future<void> _onDeleteItem(
    InvDeleteItem event,
    Emitter<InventoryState> emit,
  ) async {
    await deleteDataitem(event.id);
    repoCache.dataItem!.removeWhere((element) => element.getidItem == event.id);
    final currentState = state;
    if (currentState is InventoryLoaded) {
      add(
        InvGetData(
          filter: currentState.selectedFilterItem!,
          status: currentState.selectedStatusItem!,
          idBranch: currentState.idBranch!,
          filterjenis: currentState.selectedFilterJenisItem!,
          filterIDCategory: currentState.selectedFilterIDCategoryItem!,
        ),
      );
    }
  }
}
