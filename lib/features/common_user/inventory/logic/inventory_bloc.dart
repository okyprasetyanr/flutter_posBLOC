import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/function/service_image.dart.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/request/delete_data.dart';
import 'package:uuid/uuid.dart';

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

    on<InventorySearchItem>(_onSearchItem, transformer: debounceRestartable());

    on<InventoryPickImage>(_onPickImage);

    on<InventorySearchCategory>(
      _onSearchCategory,
      transformer: debounceRestartable(),
    );
  }

  List<ModelItem> _filterItem({
    required StatusData status,
    required FilterItem filter,
    required FilterTypeItem filterType,
    required int filterByCategory,
    List<ModelItem>? items,
  }) {
    final currentState = state is InventoryLoaded
        ? state as InventoryLoaded
        : InventoryLoaded();
    List<ModelItem> item = items ?? List.from(currentState.dataItem);

    List<ModelItem> list = item.where((element) {
      final byStatusItem = element.getStatusItem == status;

      if (filterByCategory > 0) {
        final byCategory =
            element.getidCategoryiItem ==
            currentState.filteredDataCategory[filterByCategory].getidCategory;
        if (!byCategory) return false;
      }

      if (filterType != FilterTypeItem.All) {
        final byTypeItem = element.getstatusCondiment == filterType;
        if (!byTypeItem) return false;
      }

      return byStatusItem;
    }).toList();

    switch (filter) {
      case FilterItem.A_Z:
        list.sort((a, b) => b.getqtyItem.compareTo(a.getqtyItem));
        break;
      case FilterItem.Z_A:
        list.sort((a, b) => a.getnameItem.compareTo(b.getnameItem));
      case FilterItem.Terbaru:
        list.sort((a, b) => b.getnameItem.compareTo(a.getnameItem));
      case FilterItem.Terlama:
        list.sort(
          (a, b) => formatDate(
            date: b.getDateItem,
          ).compareTo(formatDate(date: a.getDateItem)),
        );
      case FilterItem.Stock_Plus:
        list.sort(
          (a, b) => formatDate(
            date: b.getDateItem,
          ).compareTo(formatDate(date: a.getDateItem)),
        );
        break;
      case FilterItem.Stock_Minus:
        list.sort((a, b) => a.getqtyItem.compareTo(b.getqtyItem));
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
      final status = event.status ?? currentState.statusItem;
      final filter = event.filter ?? currentState.filterItem;
      final filterType = event.filterType ?? currentState.filterTypeItem;
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
          filterTypeItem: filterType,
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
    final status = currentState.statusItem;
    final filter = currentState.filterItem;
    final filterType = currentState.filterTypeItem;
    final filterByCategory = currentState.indexFilterByCategoryItem;

    final dataItem = repoCache.getItem(idBranch);
    debugPrint("Log InventoryBloc: items: $dataItem");
    final dataCategory = repoCache.getCategory(idBranch);
    final filteredDataCategory = [
      ModelCategory(nameCategory: "All", idCategory: "0", idBranch: "0"),
      ...dataCategory,
    ];
    dataCategory.sort((a, b) => a.getnameCategory.compareTo(b.getnameCategory));

    debugPrint(
      "Log InventoryBloc: filter: filter=$filter ,status=$status ,filter=$filterType ,filter=$filterByCategory",
    );

    emit(
      InventoryLoaded(
        filteredDataCategory: filteredDataCategory,
        idBranch: idBranch,
        areaBranch: areaBranch,
        dataBranch: dataBranch,
        dataItem: dataItem,
        dataCategory: dataCategory,
        filteredDataItem: _filterItem(
          items: dataItem,
          status: status,
          filter: filter,
          filterType: filterType,
          filterByCategory: filterByCategory,
        ),
        filterItem: filter,
        filterTypeItem: filterType,
        statusItem: status,
        indexFilterByCategoryItem: filterByCategory,
      ),
    );
  }

  FutureOr<void> _onUploadItem(
    InventoryUploadItem event,
    Emitter<InventoryState> emit,
  ) async {
    add(InventoryResetItemForm());
    final currentState = state as InventoryLoaded;

    String idUser = currentState.dataSelectedItem == null
        ? Uuid().v4()
        : currentState.dataSelectedItem!.getidItem;

    // final storageService = StorageService();
    // String? imageUrl = null;
    // if (currentState.image != null) {
    //   imageUrl = await storageService.uploadItemImage(
    //     currentState.image!,
    //     idUser,
    //   );
    // }

    final item = ModelItem(
      priceItemBuy: 0,
      qtyItem: 0,
      nameItem: event.name,
      idItem: idUser,
      priceItem: double.tryParse(event.price)!,
      idCategoryItem: event.selectedIdCategory,
      statusCondiment: currentState.condimentForm
          ? StatusData.Aktif
          : StatusData.Nonaktif,
      urlImage:
          //  imageUrl ??
          "",
      idBranch: currentState.idBranch!,
      barcode: event.codeBarcode,
      statusItem: StatusData.Aktif,
      date: parseDate(date: DateTime.now())!,
    );

    await item.pushDataItem();

    debugPrint("Log InventoryBloc: PushData: ${item}");
    final indexCategory = repoCache.dataItem.indexWhere(
      (element) => element.getidItem == item.getidItem,
    );

    if (indexCategory != -1) {
      repoCache.dataItem[indexCategory] = item;
    } else {
      repoCache.dataItem.add(item);
    }
    add(InventoryGetData());
  }

  FutureOr<void> _onUploadCategory(
    InventoryUploadCategory event,
    Emitter<InventoryState> emit,
  ) async {
    add(InventoryResetCategoryForm());
    final currentState = state;
    if (currentState is InventoryLoaded) {
      String idCategory =
          currentState.dataSelectedCategory?.getidCategory ?? const Uuid().v4();
      final category = ModelCategory(
        nameCategory: event.name,
        idCategory: idCategory,
        idBranch: currentState.idBranch!,
      );

      await category.pushDataCategory();
      final indexCategory = repoCache.dataCategory.indexWhere(
        (element) => element.getidCategory == category.getidCategory,
      );

      if (indexCategory != -1) {
        repoCache.dataCategory[indexCategory] = category;
      } else {
        repoCache.dataCategory.add(category);
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
    InventorySearchItem event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state as InventoryLoaded;

    final filtered = event.search.isNotEmpty
        ? currentState.dataItem
              .where(
                (item) => item.getnameItem.toLowerCase().contains(
                  event.search.toLowerCase(),
                ),
              )
              .toList()
        : currentState.dataItem;
    final filteredItem = _filterItem(
      items: filtered,
      status: currentState.statusItem,
      filter: currentState.filterItem,
      filterType: currentState.filterTypeItem,
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

  FutureOr<void> _onSearchCategory(
    InventorySearchCategory event,
    Emitter<InventoryState> emit,
  ) {
    final currentState = state;
    if (currentState is InventoryLoaded) {
      final filteredData = event.search.isNotEmpty
          ? currentState.dataCategory
                .where(
                  (element) => element.getnameCategory.toLowerCase().contains(
                    event.search.toLowerCase(),
                  ),
                )
                .toList()
          : currentState.dataCategory.toList();

      debugPrint("Log InventoryBloc Category: search: ${filteredData}");
      emit(currentState.copyWith(filteredDataCategory: filteredData));
    }
  }

  Future<void> _onPickImage(
    InventoryPickImage event,
    Emitter<InventoryState> emit,
  ) async {
    final currentState = state as InventoryLoaded;
    final imageService = ServiceImage();

    final img = await imageService.pickImage();
    emit(currentState.copyWith(image: img));
  }
}
