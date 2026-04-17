import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/adjustment/logic/adjustment_event.dart';
import 'package:flutter_pos/features/common_user/adjustment/logic/adjustment_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_by.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_item.dart';

class AdjustmentBloc extends Bloc<AdjustmentEvent, AdjustmentState> {
  final DataUserRepositoryCache repoCache;
  AdjustmentBloc(this.repoCache) : super(AdjustmentInitial()) {
    on<AdjustmentGetData>(_onGetData);
    on<AdjustmentFilterByCateogry>(_onFilterByCategory);
    on<AdjustmentSearchData>(_onSearchData, transformer: debounceRestartable());
    on<AdjustmentSelectedBatch>(_onSelectedBatch);
    on<AdjustmentSelectedItem>(_onSelectedItem);
    on<AdjustmentUploadData>(_onUploadData);
    on<AdjustmentAdjustData>(_onAdjustData);
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
        dataItemBatch: dataItemBatch,
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

  FutureOr<void> _onSelectedBatch(
    AdjustmentSelectedBatch event,
    Emitter<AdjustmentState> emit,
  ) {}

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

  FutureOr<void> _onUploadData(
    AdjustmentUploadData event,
    Emitter<AdjustmentState> emit,
  ) {}

  FutureOr<void> _onAdjustData(
    AdjustmentAdjustData event,
    Emitter<AdjustmentState> emit,
  ) {}

  List<ModelItem> _filteredItem(List<ModelItem> data, String? idCategory) {
    List<ModelItem> filteredItem = data;
    if (idCategory != null && idCategory != "0") {
      filteredItem = data
          .where((element) => element.getidCategoryiItem == idCategory)
          .toList();
    }
    return filteredItem;
  }
}
