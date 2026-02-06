import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_event.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';

class BatchBloc extends Bloc<BatchEvent, BatchState> {
  DataUserRepositoryCache repoCache;
  BatchBloc(this.repoCache) : super(BatchInitial()) {
    on<BatchGetData>(_onBatchGetData);
    on<BatchSelectedIdItem>(_onBatchSelectedIdItem);
    on<BatchReset>(_onBatchReset);
    on<BatchSearchItem>(_onSearch, transformer: debounceRestartable());
  }

  FutureOr<void> _onBatchGetData(BatchGetData event, Emitter<BatchState> emit) {
    final currentState = state is BatchLoaded
        ? state as BatchLoaded
        : BatchLoaded();
    final dataBranch = repoCache.getBranch();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;
    final dataBatch = repoCache.getBatch(idBranch);
    final dataItemBatch = dataBatch
        .expand((element) => element.getitems_batch)
        .toList();

    final dataItem = repoCache.getItem(idBranch);

    final idItemBatchSet = dataItemBatch.map((e) => e.getidItem).toSet();
    final finaldataItem = dataItem
        .where((item) => idItemBatchSet.contains(item.getidItem))
        .toList();

    emit(
      BatchLoaded(
        idBranch: idBranch,
        filteredItem: finaldataItem,
        dataBatch: dataBatch,
        dataItemBatch: dataItemBatch,
        dataItem: finaldataItem,
      ),
    );
  }

  FutureOr<void> _onBatchSelectedIdItem(
    BatchSelectedIdItem event,
    Emitter<BatchState> emit,
  ) {
    final currentState = state;
    if (currentState is BatchLoaded) {
      final ItemById = currentState.dataItemBatch
          .where((element) => element.getidItem == event.selectedIdItem)
          .toList();

      double qtyIn = 0;
      double qtyOut = 0;
      for (final item in ItemById) {
        qtyIn += item.getqtyItem_in;
        qtyOut += item.getqtyItem_out;
      }

      final detailItemBatch = ModelItemBatch(
        priceitemBuy: ItemById.last.getpriceItemBuy,
        invoice: "",
        nameItem: ItemById.last.getnameItem,
        idBranch: ItemById.last.getidBranch,
        idItem: ItemById.last.getidItem,
        idOrdered: "",
        idCategoryItem: "",
        note: "",
        date_buy: ItemById.last.getdateBuy,
        expiredDate: ItemById.last.getexpiredDate,
        discountItem: 0,
        qtyItem_in: qtyIn,
        qtyItem_out: qtyOut,
        priceItem: ItemById.last.getpriceItem,
        subTotal: 0,
        priceItemFinal: ItemById.last.getpriceItemFinal,
      );
      emit(
        currentState.copyWith(
          dataItemByIdItem: ItemById,
          detailSelectedItem: detailItemBatch,
        ),
      );
    }
  }

  FutureOr<void> _onBatchReset(BatchReset event, Emitter<BatchState> emit) {
    final currentState = state;
    if (currentState is BatchLoaded) {
      emit(
        currentState.copyWith(
          selectedIdItem: null,
          detailSelectedItem: null,
          dataItemByIdItem: null,
        ),
      );
    }
  }

  FutureOr<void> _onSearch(BatchSearchItem event, Emitter<BatchState> emit) {
    final currentState = state;
    if (currentState is BatchLoaded) {
      final filteredItem = event.search.isNotEmpty
          ? currentState.dataItem
                .where(
                  (element) => element.getnameItem.toLowerCase().contains(
                    event.search.toLowerCase(),
                  ),
                )
                .toList()
          : currentState.dataItem;
      emit(currentState.copyWith(filteredItem: filteredItem));
    }
  }
}
