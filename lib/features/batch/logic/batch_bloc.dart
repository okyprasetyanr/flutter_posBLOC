import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/batch/logic/batch_event.dart';
import 'package:flutter_pos/features/batch/logic/batch_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';

class BatchBloc extends Bloc<BatchEvent, BatchState> {
  DataUserRepositoryCache repoCache;
  BatchBloc(this.repoCache) : super(BatchInitial()) {
    on<BatchGetData>(_onBatchGetData);
    on<BatchSelectedIdItem>(_onBatchSelectedIdItem);
    on<BatchReset>(_onBatchReset);
  }

  FutureOr<void> _onBatchGetData(BatchGetData event, Emitter<BatchState> emit) {
    emit(BatchLoading());
    final dataBranch = repoCache.getBranch();
    final dataBatch = repoCache.getBatch(
      event.idBranch ?? dataBranch.first.getidBranch,
    );
    final dataItem = repoCache.getItem(
      event.idBranch ?? dataBranch.first.getidBranch,
    );
    List<ModelItemBatch> dataItemBatch = dataBatch
        .expand((element) => element.getitems_batch)
        .toList();

    List<ModelItem> finaldataItem = [];
    for (final itemBatch in dataItemBatch) {
      for (final item in dataItem) {
        if (itemBatch.getidItem == item.getidItem) {
          finaldataItem.add(item);
        }
      }
    }

    emit(BatchLoaded(dataBatch: dataBatch, dataItemBatch: finaldataItem));
  }

  FutureOr<void> _onBatchSelectedIdItem(
    BatchSelectedIdItem event,
    Emitter<BatchState> emit,
  ) {
    final currentState = state;
    if (currentState is BatchLoaded) {
      final ItemById = currentState.dataItemByIdItem
          .where((element) => element.getidItem == event.selectedIdItem)
          .toList();

      double qtyIn = 0;
      double qtyOut = 0;
      for (final item in ItemById) {
        qtyIn += item.getqtyItem_in;
        qtyOut += item.getqtyItem_out;
      }

      final detailItemBatch = ModelItemBatch(
        invoice: "",
        nameItem: ItemById.first.getnameItem,
        idBranch: ItemById.first.getidBranch,
        idItem: ItemById.first.getidItem,
        idOrdered: "",
        idCategoryItem: "",
        note: "",
        date_buy: ItemById.last.getdateBuy,
        expiredDate: "",
        discountItem: 0,
        qtyItem_in: qtyIn,
        qtyItem_out: qtyOut,
        priceItem: 0,
        subTotal: 0,
        priceItemFinal: 0,
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
        currentState.copyWith(selectedIdItem: null, detailSelectedItem: null),
      );
    }
  }
}
