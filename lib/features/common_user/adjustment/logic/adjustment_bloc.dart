import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/adjustment/logic/adjustment_event.dart';
import 'package:flutter_pos/features/common_user/adjustment/logic/adjustment_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_by.dart';
import 'package:flutter_pos/features/data_user/isar/action/save/save_update_data_isar.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/request/update_data.dart';

class AdjustmentBloc extends Bloc<AdjustmentEvent, AdjustmentState> {
  final DataUserRepositoryCache repoCache;
  AdjustmentBloc(this.repoCache) : super(AdjustmentInitial()) {
    on<AdjustmentGetData>(_onGetData);
    on<AdjustmentFilterByCateogry>(_onFilterByCategory);
    on<AdjustmentSearchData>(_onSearchData, transformer: debounceRestartable());
    on<AdjustmentSearchItemBatch>(
      _onSearchItemBatch,
      transformer: debounceRestartable(),
    );
    on<AdjustmentSelectedItemBatch>(_onSelectedItemBatch);
    on<AdjustmentSelectedItem>(_onSelectedItem);
    on<AdjustmentUploadData>(_onUploadData);
    on<AdjustmentResetSelectedData>(_onResetSelectedData);
    on<AdjustmentAdjustData>(_onAdjustData, transformer: debounceRestartable());
    on<AdjustmentResetAllData>(_onResetAllData);
  }

  Future<void> _onGetData(
    AdjustmentGetData event,
    Emitter<AdjustmentState> emit,
  ) async {
    final currentState = state is AdjustmentLoaded
        ? (state as AdjustmentLoaded)
        : AdjustmentLoaded();
    final dataBranch = await getAllListBranchIsar();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;
    final dataCategory = [
      ModelCategory(nameCategory: "All", idCategory: "0", idBranch: "0"),
      ...await getCategoryIsar(idBranch),
    ];
    final selectedCategory =
        currentState.selectedFilterCategory ?? dataCategory.first;
    final dataBatch = await getBatchIsar(idBranch);

    final dataItemBatch = dataBatch
        .expand((element) => element.getitems_batch)
        .toList();

    final dataItem = await getItemIsar(idBranch);

    final idItemBatchSet = dataItemBatch.map((e) => e.getidItem).toSet();
    final finaldataItem = dataItem
        .where((item) => idItemBatchSet.contains(item.getidItem))
        .toList();
    final selectedItem = currentState.selectedItem;
    List<ModelItemBatch> dataItemBatchByIdItem = selectedItem != null
        ? dataItemBatch
              .where(
                (element) =>
                    element.getidItem == currentState.selectedItem!.getidItem,
              )
              .toList()
        : [];

    emit(
      currentState.copyWith(
        isAdjustIn: event.changeMode != null
            ? !currentState.isAdjustIn
            : currentState.isAdjustIn,
        dataBatch: dataBatch,
        filteredItem: _filteredItem<ModelItem>(
          data: finaldataItem,
          idCategory: selectedCategory.getidCategory,
          getCategory: (modelItem) => modelItem.getidCategoryiItem,
          getName: (modelItem) => modelItem.getnameItem,
          search: currentState.searchItem,
        ),
        dataBranch: dataBranch,
        dataCategory: dataCategory,
        selectedFilterCategory: selectedCategory,
        dataItem: finaldataItem,
        idBranch: idBranch,
        dataItemBatch: dataItemBatch,
        filteredItemBatch: sortStockMode(
          _filteredItem<ModelItemBatch>(
            data: dataItemBatchByIdItem,
            search: currentState.searchItemBatch,
            getName: (modelItemBatch) => modelItemBatch.getnameItem,
          ),
        ),
        selectedItem: selectedItem,
        dataItemBatchByIdItem: dataItemBatchByIdItem,
      ),
    );
  }

  FutureOr<void> _onFilterByCategory(
    AdjustmentFilterByCateogry event,
    Emitter<AdjustmentState> emit,
  ) {
    final currentState = state as AdjustmentLoaded;
    emit(
      currentState.copyWith(
        dataItemBatchByIdItem: [],
        selectedFilterCategory: event.selectedCategory,
        filteredItem: _filteredItem<ModelItem>(
          data: currentState.dataItem,
          idCategory: event.selectedCategory.getidCategory,
          getCategory: (modelItem) => modelItem.getidCategoryiItem,
        ),
      ),
    );
  }

  FutureOr<void> _onSearchData(
    AdjustmentSearchData event,
    Emitter<AdjustmentState> emit,
  ) {
    final currentState = state as AdjustmentLoaded;
    if (event.text != "") {
      List<ModelItem> item = List.from(
        _filteredItem<ModelItem>(
          data: currentState.dataItem,
          idCategory: currentState.selectedFilterCategory?.getidCategory,
          search: event.text,
          getName: (modelItem) => modelItem.getnameItem,
          getCategory: (modelItem) => modelItem.getidCategoryiItem,
        ),
      );

      emit(currentState.copyWith(filteredItem: item));
    } else {
      emit(
        currentState.copyWith(
          filteredItem: _filteredItem<ModelItem>(
            data: currentState.dataItem,
            idCategory: currentState.selectedFilterCategory?.getidCategory,
            getCategory: (modelItem) => modelItem.getidCategoryiItem,
          ),
        ),
      );
    }
  }

  FutureOr<void> _onSearchItemBatch(
    AdjustmentSearchItemBatch event,
    Emitter<AdjustmentState> emit,
  ) {
    final currentState = state as AdjustmentLoaded;
    if (event.text != "") {
      List<ModelItemBatch> item = _filteredItem<ModelItemBatch>(
        data: currentState.dataItemBatchByIdItem,
        search: event.text,
        getInvoice: (modelItemBatch) => modelItemBatch.getinvoice,
      );
      devLog("Log AdjustmentBloc: searchedItemBatch: ${item.length}");
      emit(
        currentState.copyWith(
          filteredItemBatch: item,
          searchItemBatch: event.text,
        ),
      );
    } else {
      emit(
        currentState.copyWith(
          filteredItemBatch: sortStockMode(currentState.dataItemBatchByIdItem),
          searchItemBatch: "",
        ),
      );
    }
  }

  FutureOr<void> _onSelectedItemBatch(
    AdjustmentSelectedItemBatch event,
    Emitter<AdjustmentState> emit,
  ) {
    final currentState = state as AdjustmentLoaded;
    emit(
      currentState.copyWith(
        selectedItem: currentState.selectedItem,
        editedItemBatch: event.selectedItemBatch,
      ),
    );
  }

  FutureOr<void> _onSelectedItem(
    AdjustmentSelectedItem event,
    Emitter<AdjustmentState> emit,
  ) {
    final currentState = state as AdjustmentLoaded;
    final dataItemBatch = currentState.dataItemBatch
        .where((element) => element.getidItem == event.selectedItem.getidItem)
        .toList();
    emit(
      currentState.copyWith(
        selectedItem: event.selectedItem,
        dataItemBatchByIdItem: dataItemBatch,
        filteredItemBatch: sortStockMode(
          _filteredItem<ModelItemBatch>(
            data: dataItemBatch,
            search: currentState.searchItemBatch,
            getName: (item) => item.getnameItem,
          ),
        ),
      ),
    );
  }

  Future<void> _onUploadData(
    AdjustmentUploadData event,
    Emitter<AdjustmentState> emit,
  ) async {
    final currentState = state as AdjustmentLoaded;
    final expiredDate = event.dateExpired;
    devLog("Log AdjustmentBloc: expiredDate: $expiredDate");
    final selectedItemBatch = currentState.editedItemBatch!.copyWith(
      expiredDate: expiredDate != null
          ? parseDate(date: expiredDate, minute: false)
          : null,
    );
    await updateItemBatch_Isar(selectedItemBatch);
    await updateItemBatch(data: selectedItemBatch);
    add(AdjustmentGetData());
  }

  FutureOr<void> _onAdjustData(
    AdjustmentAdjustData event,
    Emitter<AdjustmentState> emit,
  ) {
    final currentState = state as AdjustmentLoaded;
    final selectedItemBatch = currentState.editedItemBatch!;
    final sellPrice = event.sellPrice;
    final buyPrice = event.buyPrice;
    ModelItemBatch? data = null;
    if (event.adjustQty != null) {
      data = currentState.isAdjustIn
          ? selectedItemBatch.copyWith(
              qtyItem_in: selectedItemBatch.getqtyItem_in + 1,
            )
          : selectedItemBatch.copyWith(
              qtyItem_out: selectedItemBatch.getqtyItem_out + 1,
            );
    }
    if (sellPrice != null) {
      data = selectedItemBatch.copyWith(
        priceItemFinal: double.tryParse(sellPrice),
      );
    }
    if (buyPrice != null) {
      data = selectedItemBatch.copyWith(
        priceItemBuy: double.tryParse(buyPrice),
      );
    }
    emit(
      currentState.copyWith(
        editedItemBatch: data,
        selectedItem: currentState.selectedItem,
      ),
    );
  }

  List<T> _filteredItem<T>({
    required List<T> data,
    String? idCategory,
    String Function(T item)? getCategory,
    String Function(T item)? getName,
    String Function(T item)? getInvoice,
    String? search,
  }) {
    return data.where((element) {
      bool match = true;

      if (idCategory != null && idCategory != "0" && getCategory != null) {
        match = match && (getCategory(element) == idCategory);
      }

      if (search != null && search.isNotEmpty && getName != null) {
        match =
            match &&
            getName(element).toLowerCase().contains(search.toLowerCase());
      }

      if (search != null && search.isNotEmpty && getInvoice != null) {
        match =
            match &&
            getInvoice(element).toLowerCase().contains(search.toLowerCase());
      }

      return match;
    }).toList();
  }

  FutureOr<void> _onResetSelectedData(
    AdjustmentResetSelectedData event,
    Emitter<AdjustmentState> emit,
  ) {
    emit(
      (state as AdjustmentLoaded).copyWith(
        selectedItem: (state as AdjustmentLoaded).selectedItem,
        editedItemBatch: null,
        originalItemBatch: null,
      ),
    );
  }

  FutureOr<void> _onResetAllData(
    AdjustmentResetAllData event,
    Emitter<AdjustmentState> emit,
  ) {
    emit(
      (state as AdjustmentLoaded).copyWith(
        filteredItemBatch: [],
        dataItemBatchByIdItem: [],
        searchItemBatch: "",
      ),
    );
  }
}
