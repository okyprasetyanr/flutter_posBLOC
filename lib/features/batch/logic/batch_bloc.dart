import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/batch/logic/batch_event.dart';
import 'package:flutter_pos/features/batch/logic/batch_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
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
    final dataItemBatch = dataBatch
        .expand((element) => element.getitems_batch)
        .toList();

    final dataItem = repoCache.getItem(
      event.idBranch ?? dataBranch.first.getidBranch,
    );

    final idItemBatchSet = dataItemBatch.map((e) => e.getidItem).toSet();
    final finaldataItem = dataItem
        .where((item) => idItemBatchSet.contains(item.getidItem))
        .toList();

    emit(
      BatchLoaded(
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
