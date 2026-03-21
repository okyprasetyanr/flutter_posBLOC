import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_event.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_state.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/data_user/isar/action/check/check_data_isar_all.dart';
import 'package:flutter_pos/features/data_user/isar/action/delete/delete_data_isar_by.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_by.dart';
import 'package:flutter_pos/features/data_user/isar/action/save_update_data_isar.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/request/delete_data.dart';
import 'package:flutter_pos/style_and_transition_text/transition_navigator/transition_up_down.dart';

class HistoryTransactionBloc
    extends Bloc<HistoryTransactionEvent, HistoryTransactionState> {
  DataUserRepositoryCache repoCache;

  HistoryTransactionBloc(this.repoCache) : super(HistoryTransactionInitial()) {
    on<HistoryTransactionGetData>(_onGetData);
    on<HistoryTransactionCancelData>(_onCancelData);
    on<HistoryTransactionSearchData>(
      _onSearchData,
      transformer: debounceRestartable(),
    );
    on<HistoryTransactionSelectedData>(_onSelectedData);
    on<HistoryTransactionResetSelectedData>(_onResetSelectedData);
    on<HistoryTransactionRevisionData>(_onRevisionData);
    on<HistoryTransactionSelectedFilter>(_onSelectedFilter);
  }

  Future<void> _onGetData(
    HistoryTransactionGetData event,
    Emitter<HistoryTransactionState> emit,
  ) async {
    final currentState = state is HistoryTransactionLoaded
        ? (state as HistoryTransactionLoaded)
        : HistoryTransactionLoaded();

    final dateStart = event.dateStart != null
        ? dateYMDStartBLOC(event.dateStart)
        : dateYMDStartBLOC(currentState.dateStart);

    final dateEnd = event.dateEnd != null
        ? dateYMDEndBLOC(event.dateEnd)
        : dateYMDEndBLOC(currentState.dateEnd);

    final dataBranch = await getAllListBranchIsar();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;
    final isSell = event.isSell ?? currentState.isSell;
    final dataTransaction = isSell
        ? await getTransactionSellIsar(idBranch)
        : await getTransactionBuyIsar(idBranch);
    final finalDataTransaction = isSell
        ? dataTransaction
              .where(
                (element) =>
                    element.getstatusTransaction !=
                    ListStatusTransaction.Tersimpan,
              )
              .toList()
        : dataTransaction;

    final filteredData = finalDataTransaction.where((element) {
      return (element.getdate.isAtSameMomentAs(dateStart) ||
              element.getdate.isAfter(dateStart)) &&
          (element.getdate.isAtSameMomentAs(dateEnd) ||
              element.getdate.isBefore(dateEnd));
    }).toList();

    debugPrint(
      "Log HistoryTransactionBloc: getData: $dateStart $dateEnd $filteredData",
    );

    final displayDate =
        formatDate(date: dateStart, minute: false) ==
                formatDate(date: DateTime.now(), minute: false) &&
            formatDate(date: dateEnd, minute: false) ==
                formatDate(date: DateTime.now(), minute: false)
        ? "Hari ini"
        : "${formatDate(date: dateStart, minute: false)} - ${formatDate(date: dateEnd, minute: false)}";

    emit(
      HistoryTransactionLoaded(
        isSell: isSell,
        dateStart: dateStart,
        dateEnd: dateEnd,
        idBranch: idBranch,
        filteredData: filteredData,
        dataTransaction: finalDataTransaction,
        displayDate: displayDate,
      ),
    );
  }

  Future<void> _onCancelData(
    HistoryTransactionCancelData event,
    Emitter<HistoryTransactionState> emit,
  ) async {
    final currentState = state;
    if (currentState is HistoryTransactionLoaded) {
      final invoice = currentState.selectedData!.getinvoice;
      final dataTransaction = await checkTransactionById_Isar(
        invoice,
        isSell: currentState.isSell,
      );

      final itemOrdered = dataTransaction!.getitemsOrdered;

      if (!currentState.isSell) {
        final dataBatch = await getBatchIsar(currentState.idBranch!);
        await deleteDataBatch(
          invoice: invoice,
          itemBatch: dataBatch
              .where((element) => element.getinvoice == invoice)
              .expand((element) => element.getitems_batch)
              .toList(),
        );
        await deleteBatchByInvoice_Isar(invoice);
      }

      final finaldataTransaction = dataTransaction.copyWith(
        statusTransaction: ListStatusTransaction.Batal,
        bankName: dataTransaction.getbankName,
        itemsOrdered: itemOrdered,
      );

      currentState.isSell
          ? await saveTransactionSell_Isar(finaldataTransaction)
          : await saveTransactionBuy_Isar(finaldataTransaction);

      await finaldataTransaction.pushDataTransaction(
        statusRemove: true,
        isSell: currentState.isSell,
      );

      add(HistoryTransactionGetData());
      // repoCache.notifyChanged();
    }
  }

  FutureOr<void> _onSearchData(
    HistoryTransactionSearchData event,
    Emitter<HistoryTransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is HistoryTransactionLoaded) {
      final dateStart = currentState.dateStart!;
      final dateEnd = currentState.dateEnd!;
      final dataTransaction = currentState.dataTransaction;
      final updateFor = currentState.copyWith(
        filteredData: _filterData(
          dataTransaction: dataTransaction,
          filter: currentState.filter,
          dateStart: dateStart,
          dateEnd: dateEnd,
          search: event.search,
        ),
        dateStart: dateStart,
        dateEnd: dateEnd,
      );

      emit(updateFor);
    }
  }

  FutureOr<void> _onSelectedData(
    HistoryTransactionSelectedData event,
    Emitter<HistoryTransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is HistoryTransactionLoaded) {
      emit(currentState.copyWith(selectedData: event.selectedData));
    }
  }

  FutureOr<void> _onResetSelectedData(
    HistoryTransactionResetSelectedData event,
    Emitter<HistoryTransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is HistoryTransactionLoaded) {
      emit(currentState.copyWith(selectedData: null));
    }
  }

  FutureOr<void> _onRevisionData(
    HistoryTransactionRevisionData event,
    Emitter<HistoryTransactionState> emit,
  ) {
    final sellState = event.context.read<TransactionBloc>();
    final currentState = state as HistoryTransactionLoaded;

    sellState.add(
      TransactionLoadTransaction(
        currentTransaction: currentState.selectedData!,
        revision: true,
      ),
    );
    navUpDownTransition(event.context, '/sell', false);
  }

  FutureOr<void> _onSelectedFilter(
    HistoryTransactionSelectedFilter event,
    Emitter<HistoryTransactionState> emit,
  ) {
    final currentState = state as HistoryTransactionLoaded;
    final dateStart = dateYMDStartBLOC(currentState.dateStart);
    final dateEnd = dateYMDEndBLOC(currentState.dateEnd);

    emit(
      currentState.copyWith(
        filteredData: _filterData(
          dataTransaction: currentState.dataTransaction,
          filter: event.filter,
          dateStart: dateStart,
          dateEnd: dateEnd,
          search: currentState.search,
        ),
        dateStart: currentState.dateStart,
        dateEnd: currentState.dateEnd,
        filter: event.filter,
      ),
    );
  }

  List<ModelTransaction> _filterData({
    required List<ModelTransaction> dataTransaction,
    required ListStatusTransaction filter,
    required DateTime dateStart,
    required DateTime dateEnd,
    required String search,
  }) {
    final lowerSearch = search.toLowerCase();

    return dataTransaction.where((element) {
      final date = element.getdate;
      final status = element.getstatusTransaction;

      final dateValid =
          (date.isAtSameMomentAs(dateStart) || date.isAfter(dateStart)) &&
          (date.isAtSameMomentAs(dateEnd) || date.isBefore(dateEnd));

      if (!dateValid) return false;

      if (filter != ListStatusTransaction.All) {
        final statusTarget = status == filter;
        if (!statusTarget) return false;
      }

      if (search.isNotEmpty) {
        final invoice = element.getinvoice.toLowerCase();
        final partner = element.getnamePartner!.toLowerCase();
        final note = element.getnote.toLowerCase();

        final match =
            invoice.contains(lowerSearch) ||
            partner.contains(lowerSearch) ||
            note.contains(lowerSearch);

        if (!match) return false;
      }

      return true;
    }).toList();
  }
}
