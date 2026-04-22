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
    on<AdjustmentSelectedItemBatch>(_onSelectedItemBatch);
    on<AdjustmentSelectedItem>(_onSelectedItem);
    on<AdjustmentUploadData>(_onUploadData);
    on<AdjustmentResetSelectedData>(_onResetSelectedData);
    on<AdjustmentAdjustData>(_onAdjustData, transformer: debounceRestartable());
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

    emit(
      currentState.copyWith(
        isAdjustIn: event.changeMode != null
            ? !currentState.isAdjustIn
            : currentState.isAdjustIn,
        dataBatch: dataBatch,
        filteredItem: _filteredItem(
          finaldataItem,
          selectedCategory.getidCategory,
        ),
        dataBranch: dataBranch,
        dataCategory: dataCategory,
        selectedFilterCategory: selectedCategory,
        dataItem: dataItem,
        idBranch: idBranch,
        dataItemBatch: sortStockMode(dataItemBatch),
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
        selectedFilterCategory: event.selectedCategory,
        filteredItem: _filteredItem(
          currentState.dataItem,
          event.selectedCategory.getidCategory,
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
        currentState.filteredItem
            .where((element) => element.getidBranch == currentState.idBranch)
            .where(
              (item) => item.getnameItem.toLowerCase().contains(
                event.text!.toLowerCase(),
              ),
            )
            .toList(),
      );

      emit(currentState.copyWith(filteredItem: item));
    } else {
      emit(
        currentState.copyWith(
          filteredItem: _filteredItem(
            currentState.dataItem,
            currentState.selectedFilterCategory?.getidCategory,
          ),
        ),
      );
    }
  }

  FutureOr<void> _onSelectedItemBatch(
    AdjustmentSelectedItemBatch event,
    Emitter<AdjustmentState> emit,
  ) {
    emit(
      (state as AdjustmentLoaded).copyWith(
        editedItemBatch: event.selectedItemBatch,
      ),
    );
  }

  FutureOr<void> _onSelectedItem(
    AdjustmentSelectedItem event,
    Emitter<AdjustmentState> emit,
  ) {
    final currentState = state as AdjustmentLoaded;
    devLog(
      "Log AdjustmentBloc: selectedItem: ${sortStockMode(currentState.dataItemBatch.where((element) => element.getidItem == event.selectedItem.getidItem).toList())}",
    );
    emit(
      currentState.copyWith(
        selectedItem: event.selectedItem,
        dataItemBatchByIdItem: sortStockMode(
          currentState.dataItemBatch
              .where(
                (element) => element.getidItem == event.selectedItem.getidItem,
              )
              .toList(),
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
    final isIncrement = event.isIncrement;
    final sellPrice = event.sellPrice;
    final buyPrice = event.buyPrice;
    ModelItemBatch? data = null;
    if (isIncrement != null) {
      data = isIncrement
          ? selectedItemBatch.copyWith(
              qtyItem_in: selectedItemBatch.getqtyItem_in + 1,
            )
          : selectedItemBatch.copyWith(
              qtyItem_in: selectedItemBatch.getqtyItem_in - 1,
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
    emit(currentState.copyWith(editedItemBatch: data));
  }

  List<ModelItem> _filteredItem(List<ModelItem> data, String? idCategory) {
    List<ModelItem> filteredItem = data;
    if (idCategory != null && idCategory != "0") {
      filteredItem = data
          .where((element) => element.getidCategoryiItem == idCategory)
          .toList();
    }
    return filteredItem;
  }

  FutureOr<void> _onResetSelectedData(
    AdjustmentResetSelectedData event,
    Emitter<AdjustmentState> emit,
  ) {
    emit(
      (state as AdjustmentLoaded).copyWith(
        editedItemBatch: null,
        originaItemBatch: null,
      ),
    );
  }
}
