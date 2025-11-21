import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/request/delete_data.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final DataUserRepositoryCache repoCache;

  InventoryBloc(this.repoCache) : super(InventoryInitial()) {
    debugPrint("Log InventoryBloc: Masuk Bloc");
    on<InventoryGetData>(_onGetData);

    on<InventoryFilterItem>(_onFilteredItem);

    on<InventoryUploadItem>(_onUploadItem);

    on<InventorySelectedCategory>(_onSelectedCategory);

    on<InventorySelectedCategoryItem>(_onSelectedCategoryItem);

    on<InventorySelectedItem>(_onSelectedItem);

    on<InventoryUploadCategory>(_onUploadCategory);

    on<InventoryResetCategoryForm>(_onResetCategoryForm);

    on<InventoryResetItemForm>(_onResetItemForm);

    on<InventoryCondimentForm>(_onCondimentForm);

    on<InventoryDeleteCategory>(_onDeleteCategory);

    on<InventoryDeleteItem>(_onDeleteItem);

    on<InventorySearchitem>(_onSearchItem, transformer: debounceRestartable());
  }

  List<ModelItem> _filterItem({
    required int status,
    required int filter,
    required int filterType,
    required int filterByCategory,
    List<ModelItem>? items,
  }) {
    final currentState = state is InventoryLoaded
        ? state as InventoryLoaded
        : InventoryLoaded();
    List<ModelItem> item = items ?? List.from(currentState.dataItem);

    // ["Active", "Deactive"]
    List<ModelItem> list = item.where((element) {
      final byStatusItem = status == 0
          ? element.getStatusItem
          : !element.getStatusItem;

      if (filterByCategory > 0) {
        final byCategory =
            element.getidCategoryiItem ==
            filterCategory[filterByCategory].getidCategory;
        if (!byCategory) return false;
      }

      // ["All", "Condiment", "Normal"]
      if (filterType > 0) {
        final byTypeItem = filterType == 1
            ? element.getstatusCondiment
            : !element.getstatusCondiment;
        if (!byTypeItem) return false;
      }

      return byStatusItem;
    }).toList();

    // ["A-Z", "Z-A", "Terbaru", "Terlama", "Stock +", "Stock -"];
    switch (filter) {
      case 0:
        list.sort((a, b) => a.getnameItem.compareTo(b.getnameItem));
        break;
      case 1:
        list.sort((a, b) => b.getnameItem.compareTo(a.getnameItem));
        break;
      case 2:
        list.sort(
          (a, b) => formatDate(
            date: b.getDateItem,
          ).compareTo(formatDate(date: a.getDateItem)),
        );
        break;
      case 3:
        list.sort(
          (a, b) => formatDate(
            date: b.getDateItem,
          ).compareTo(formatDate(date: a.getDateItem)),
        );
        break;
      case 4:
        list.sort((a, b) => a.getqtyItem.compareTo(b.getqtyItem));
        break;
      case 5:
        list.sort((a, b) => b.getqtyItem.compareTo(a.getqtyItem));
        break;
    }

    return list;
  }

  Future<void> _onFilteredItem(
    InventoryFilterItem event,
    Emitter<InventoryState> emit,
  ) async {
    final currentState = state;
    if (currentState is InventoryLoaded) {
      final status = event.status ?? currentState.indexStatusItem;
      final filter = event.filter ?? currentState.indexFilterItem;
      final filterType = event.filterType ?? currentState.indexFilterTypeItem;
      final filterByCategory =
          event.filterByCategory ?? currentState.indexFilterByCategoryItem;

      emit(
        currentState.copyWith(
          filteredDataItem: _filterItem(
            status: status,
            filter: filter,
            filterType: filterType,
            filterByCategory: filterByCategory,
          ),
          indexStatusItem: status,
          indexFilterItem: filter,
          indexFilterTypeItem: filterType,
          indexFilterIDCategoryItem: filterByCategory,
        ),
      );
    }
  }

  Future<void> _onGetData(
    InventoryGetData event,
    Emitter<InventoryState> emit,
  ) async {
    final currentState = state is InventoryLoaded
        ? state as InventoryLoaded
        : InventoryLoaded();
    final dataBranch = currentState.dataBranch ?? repoCache.getBranch();

    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;

    final areaBranch = dataBranch
        .firstWhere((element) => element.getidBranch == idBranch)
        .getareaBranch;
    final status = event.status ?? currentState.indexStatusItem;
    final filter = event.filter ?? currentState.indexFilterItem;
    final filterType = event.filterType ?? currentState.indexFilterTypeItem;
    final filterByCategory = event.idBranch != null
        ? event.filterByCategory ?? currentState.indexFilterByCategoryItem
        : 0;

    final items = repoCache.getItem(idBranch);
    debugPrint("Log InventoryBloc: items: $items");
    final category = repoCache.getCategory(idBranch);
    filterCategory = [
      ModelCategory(nameCategory: "All", idCategory: "0", idBranch: "0"),
      ...category,
    ];
    category.sort((a, b) => a.getnameCategory.compareTo(b.getnameCategory));

    debugPrint(
      "Log InventoryBloc: filter: filter=$filter ,status=$status ,filter=$filterType ,filter=$filterByCategory",
    );

    emit(
      InventoryLoaded(
        idBranch: idBranch,
        areaBranch: areaBranch,
        dataBranch: dataBranch,
        dataItem: items,
        dataCategory: category,
        filteredDataItem: _filterItem(
          items: items,
          status: status,
          filter: filter,
          filterType: filterType,
          filterByCategory: filterByCategory,
        ),
        indexFilterItem: filter,
        indexFilterTypeItem: filterType,
        indexStatusItem: status,
        indexFilterByCategoryItem: filterByCategory,
      ),
    );
  }

  FutureOr<void> _onUploadItem(
    InventoryUploadItem event,
    Emitter<InventoryState> emit,
  ) async {
    add(InventoryResetItemForm());
    await event.item.pushDataItem();

    debugPrint("Log InventoryBloc: PushData: ${event.item}");
    final indexCategory = repoCache.dataItem.indexWhere(
      (element) => element.getidItem == event.item.getidItem,
    );

    if (indexCategory != -1) {
      repoCache.dataItem[indexCategory] = event.item;
    } else {
      repoCache.dataItem.add(event.item);
    }

    add(InventoryGetData());
  }

  FutureOr<void> _onUploadCategory(
    InventoryUploadCategory event,
    Emitter<InventoryState> emit,
  ) async {
    await event.category.pushDataCategory();
    add(InventoryResetCategoryForm());
    final currentState = state;
    if (currentState is InventoryLoaded) {
      final indexCategory = repoCache.dataCategory.indexWhere(
        (element) => element.getidCategory == event.category.getidCategory,
      );

      if (indexCategory != -1) {
        repoCache.dataCategory[indexCategory] = event.category;
      } else {
        repoCache.dataCategory.add(event.category);
      }

      add(InventoryGetData());
    }
  }

  FutureOr<void> _onResetCategoryForm(
    InventoryResetCategoryForm event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state as InventoryLoaded;
    emit(currentState.copyWith(dataSelectedCategory: null));
  }

  FutureOr<void> _onSelectedCategory(
    InventorySelectedCategory event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state as InventoryLoaded;
    emit(currentState.copyWith(dataSelectedCategory: event.selectedCategory));
  }

  FutureOr<void> _onSelectedCategoryItem(
    InventorySelectedCategoryItem event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state as InventoryLoaded;

    debugPrint(
      "Log InventoryBloc SelectedCategoryItem: ${event.dataCategoryItem}",
    );
    emit(
      currentState.copyWith(dataSelectedCategoryItem: event.dataCategoryItem),
    );
  }

  FutureOr<void> _onSelectedItem(
    InventorySelectedItem event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state as InventoryLoaded;
    debugPrint("Log InventoryBloc SelectedItem: ${event.selectedItem}");
    emit(currentState.copyWith(dataSelectedItem: event.selectedItem));
  }

  FutureOr<void> _onResetItemForm(
    InventoryResetItemForm event,
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
    InventorySearchitem event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state as InventoryLoaded;

    final filtered = event.text.isNotEmpty
        ? currentState.dataItem
              .where(
                (item) => item.getnameItem.toLowerCase().contains(
                  event.text.toLowerCase(),
                ),
              )
              .toList()
        : currentState.dataItem;
    final filteredItem = _filterItem(
      items: filtered,
      status: currentState.indexStatusItem,
      filter: currentState.indexFilterItem,
      filterType: currentState.indexFilterTypeItem,
      filterByCategory: currentState.indexFilterByCategoryItem,
    );
    emit(currentState.copyWith(filteredDataItem: filteredItem));
  }

  FutureOr<void> _onCondimentForm(
    InventoryCondimentForm event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state as InventoryLoaded;
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
    InventoryDeleteCategory event,
    Emitter<InventoryState> emit,
  ) async {
    await deleteDataCategory(event.id);
    repoCache.dataCategory.removeWhere(
      (element) => element.getidCategory == event.id,
    );
    add(InventoryGetData());
  }

  Future<void> _onDeleteItem(
    InventoryDeleteItem event,
    Emitter<InventoryState> emit,
  ) async {
    await deleteDataitem(event.id);
    repoCache.dataItem.removeWhere((element) => element.getidItem == event.id);
    add(InventoryGetData());
  }
}
