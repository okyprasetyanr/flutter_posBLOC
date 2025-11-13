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
import 'package:flutter_pos/style_and_transition/transition_navigator/transition_up_down.dart';

class HistoryTransactionBloc
    extends Bloc<HistoryTransactionEvent, HistoryTransactionState> {
  DataUserRepositoryCache repoCache;

  HistoryTransactionBloc(this.repoCache) : super(HistoryTransactionInitial()) {
    on<HistoryTransactionGetData>(_onGetData);
    on<HistoryTransactionRemoveData>(_onRemoveData);
    on<HistoryTransactionSearchData>(
      _onSearchdata,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
    on<HistoryTransactionSelectedData>(_onSelectedData);
    on<HistoryTransactionResetData>(_onResetData);
    on<HistoryTransactionRevisionData>(_onRevisionData);
  }

  Future<void> _onGetData(
    HistoryTransactionGetData event,
    Emitter<HistoryTransactionState> emit,
  ) async {
    final currentState = state is HistoryTransactionLoaded
        ? (state as HistoryTransactionLoaded)
        : HistoryTransactionLoaded();

    final now = DateTime.now();
    final dateDefault = DateTime(now.year, now.month, now.day);

    final dateStart = event.dateStart != null
        ? DateTime(
            event.dateStart!.year,
            event.dateStart!.month,
            event.dateStart!.day,
          )
        : dateDefault;

    final dateEnd = event.dateEnd != null
        ? DateTime(
            event.dateEnd!.year,
            event.dateEnd!.month,
            event.dateEnd!.day,
            23,
            59,
            59,
            999,
          )
        : DateTime(now.year, now.month, now.day, 23, 59, 59, 999);

    final dataBranch = repoCache.getBranch();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;

    final filteredSell = repoCache.getTransactionSell(idBranch).where((
      element,
    ) {
      return (element.getdate.isAtSameMomentAs(dateStart) ||
              element.getdate.isAfter(dateStart)) &&
          (element.getdate.isAtSameMomentAs(dateEnd) ||
              element.getdate.isBefore(dateEnd));
    }).toList();

    final filteredBuy = repoCache.getTransactionBuy(idBranch).where((element) {
      return (element.getdate.isAtSameMomentAs(dateStart) ||
              element.getdate.isAfter(dateStart)) &&
          (element.getdate.isAtSameMomentAs(dateEnd) ||
              element.getdate.isBefore(dateEnd));
    }).toList();

    debugPrint(
      "Log HistoryTransactionBloc: getData: $dateStart $dateEnd $filteredSell",
    );
    emit(
      HistoryTransactionLoaded(
        dateStart: dateStart,
        dateEnd: dateEnd,
        idBranch: idBranch,
        filteredSell: filteredSell,
        filteredBuy: filteredBuy,
      ),
    );
  }

  Future<void> _onRemoveData(
    HistoryTransactionRemoveData event,
    Emitter<HistoryTransactionState> emit,
  ) async {
    final currentState = state;
    if (currentState is HistoryTransactionLoaded) {
      final invoice = currentState.selectedData!.getinvoice;
      final dataTransaction = currentState.isSell
          ? repoCache.dataTransactionSell!
          : repoCache.dataTransactionBuy!;
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

      add(HistoryTransactionResetData());
    }
  }

  FutureOr<void> _onSearchdata(
    HistoryTransactionSearchData event,
    Emitter<HistoryTransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is HistoryTransactionLoaded) {
      final listData = currentState.isSell
          ? currentState.filteredSell.toList()
          : currentState.filteredBuy.toList();
      final filteredData = listData.where((element) {
        return element.getinvoice.toLowerCase().contains(
              event.search.toLowerCase(),
            ) ||
            element.getnamePartner.toLowerCase().contains(
              event.search.toLowerCase(),
            ) ||
            element.getnote.toLowerCase().contains(event.search.toLowerCase());
      }).toList();
      final updateFor = currentState.isSell
          ? currentState.copyWith(filteredSell: filteredData)
          : currentState.copyWith(filteredBuy: filteredData);
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

  FutureOr<void> _onResetData(
    HistoryTransactionResetData event,
    Emitter<HistoryTransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is HistoryTransactionLoaded) {
      add(
        HistoryTransactionGetData(
          dateStart: null,
          dateEnd: null,
          idBranch: currentState.idBranch!,
        ),
      );
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
