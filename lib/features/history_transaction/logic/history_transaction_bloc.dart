import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/history_transaction/logic/history_transaction_event.dart';
import 'package:flutter_pos/features/history_transaction/logic/history_transaction_state.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition/transition_navigator/transition_up_down.dart';

class HistoryTransactionBloc
    extends Bloc<HistoryTransactionEvent, HistoryTransactionState> {
  DataUserRepositoryCache repoCache;

  HistoryTransactionBloc(this.repoCache) : super(HistoryTransactionInitial()) {
    on<HistoryTransactionGetData>(_onGetData);
    on<HistoryTransactionCancelData>(_onCancelData);
    on<HistoryTransactionSearchData>(
      _onSearchdata,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
    on<HistoryTransactionSelectedData>(_onSelectedData);
    on<HistoryTransactionResetSelectedData>(_onResetSelectedData);
    on<HistoryTransactionRevisionData>(_onRevisionData);
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

    final dataBranch = repoCache.getBranch();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;
    final isIncome = event.isSell ?? currentState.isSell;
    final dataTransaction = isIncome
        ? repoCache.getTransactionSell(idBranch)
        : repoCache.getTransactionBuy(idBranch);

    final filteredData = dataTransaction.where((element) {
      return (element.getdate.isAtSameMomentAs(dateStart) ||
              element.getdate.isAfter(dateStart)) &&
          (element.getdate.isAtSameMomentAs(dateEnd) ||
              element.getdate.isBefore(dateEnd));
    }).toList();

    debugPrint(
      "Log HistoryTransactionBloc: getData: $dateStart $dateEnd $filteredData",
    );

    emit(
      HistoryTransactionLoaded(
        isSell: isIncome,
        dateStart: dateStart,
        dateEnd: dateEnd,
        idBranch: idBranch,
        filteredData: filteredData,
        dataTransaction: dataTransaction,
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
      final dataTransaction = currentState.isSell
          ? repoCache.dataTransSell!
          : repoCache.dataTransBuy!;
      final indexdataTrans = dataTransaction.indexWhere(
        (element) => element.getinvoice == invoice,
      );

      final itemOrdered = dataTransaction[indexdataTrans].getitemsOrdered;
      final dateNow = parseDate(date: DateTime.now().toString(), minute: false);
      for (int i = 0; i < itemOrdered.length; i++) {
        for (final item in event.dateExpired) {
          if (itemOrdered[i].getidOrdered == item['id_ordered']) {
            itemOrdered[i] = itemOrdered[i].copyWith(
              dateBuy: dateNow,
              expiredDate: item['expired_date'],
            );
          }
        }
      }

      dataTransaction[indexdataTrans] = dataTransaction[indexdataTrans]
          .copyWith(
            statusTransaction: statusTransaction(index: 3),
            bankName: dataTransaction[indexdataTrans].getbankName,
            itemsOrdered: itemOrdered,
          );

      debugPrint(
        "Log HistoryTransaction: hapusData: $dateNow ${dataTransaction[indexdataTrans]}",
      );
      final bloc = event.context.read<DataUserRepositoryCache>();
      await dataTransaction[indexdataTrans].pushDataTransaction(
        statusRemove: true,
        isSell: currentState.isSell,
        dataRepo: bloc,
      );

      add(HistoryTransactionGetData());
    }
  }

  FutureOr<void> _onSearchdata(
    HistoryTransactionSearchData event,
    Emitter<HistoryTransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is HistoryTransactionLoaded) {
      final listData = currentState.dataTransaction;

      final search = event.search.toLowerCase();
      List<ModelTransaction> filteredData = listData.where((element) {
        final invoice = element.getinvoice.toLowerCase();
        final partner = element.getnamePartner.toLowerCase();
        final note = element.getnote.toLowerCase();
        return invoice.contains(search) ||
            partner.contains(search) ||
            note.contains(search);
      }).toList();

      if (event.search.isEmpty) {
        filteredData = currentState.dataTransaction;
      }
      final updateFor = currentState.copyWith(filteredData: filteredData);
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
}
