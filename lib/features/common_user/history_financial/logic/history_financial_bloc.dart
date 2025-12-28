import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_event.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';

class HistoryFinancialBloc
    extends Bloc<HistoryFinancialEvent, HistoryFinancialState> {
  DataUserRepositoryCache repoCache;
  HistoryFinancialBloc(this.repoCache) : super(HistoryFinancialInitial()) {
    on<HistoryFinancialGetData>(_onGetData);
    on<HistoryFinancialSelectedData>(_onSelectedData);
    on<HistoryFinancialResetSelectedData>(_onResetSelectedData);
    on<HistoryFinancialSearchData>(
      _onSearchData,
      transformer: debounceRestartable(),
    );
    on<HistoryFinancialCancelData>(_onCancelData);
    on<HistoryFinancialSelectedFilter>(_onSelectedFilter);
  }

  FutureOr<void> _onGetData(
    HistoryFinancialGetData event,
    Emitter<HistoryFinancialState> emit,
  ) async {
    final currentState = state is HistoryFinancialLoaded
        ? state as HistoryFinancialLoaded
        : HistoryFinancialLoaded();

    final dateStart = event.dateStart != null
        ? dateYMDStartBLOC(event.dateStart)
        : dateYMDStartBLOC(currentState.dateStart);

    final dateEnd = event.dateEnd != null
        ? dateYMDEndBLOC(event.dateEnd)
        : dateYMDEndBLOC(currentState.dateEnd);

    final dataBranch = await repoCache.getBranch();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;
    final isIncome = event.isIncome ?? currentState.isIncome;
    final dataTransaction = isIncome
        ? await repoCache.getTransactionIncome(idBranch)
        : await repoCache.getTransactionExpense(idBranch);
    final filteredData = dataTransaction.where((element) {
      return (element.getdate.isAtSameMomentAs(dateStart) ||
              element.getdate.isAfter(dateStart)) &&
          (element.getdate.isAtSameMomentAs(dateEnd) ||
              element.getdate.isBefore(dateEnd));
    }).toList();

    final displayDate =
        formatDate(date: dateStart, minute: false) ==
                formatDate(date: DateTime.now(), minute: false) &&
            formatDate(date: dateEnd, minute: false) ==
                formatDate(date: DateTime.now(), minute: false)
        ? "Hari ini"
        : "${formatDate(date: dateStart, minute: false)} - ${formatDate(date: dateEnd, minute: false)}";

    debugPrint("Log HistoryFinancial: dataTransaction: $dataTransaction");

    emit(
      HistoryFinancialLoaded(
        displayDate: displayDate,
        filteredData: filteredData,
        isIncome: isIncome,
        dataTransaction: dataTransaction,
        idBranch: idBranch,
        dateStart: dateStart,
        dateEnd: dateEnd,
      ),
    );
  }

  FutureOr<void> _onSelectedData(
    HistoryFinancialSelectedData event,
    Emitter<HistoryFinancialState> emit,
  ) {
    final currentState = state as HistoryFinancialLoaded;
    emit(currentState.copyWith(selectedData: event.selectedData));
  }

  FutureOr<void> _onResetSelectedData(
    HistoryFinancialResetSelectedData event,
    Emitter<HistoryFinancialState> emit,
  ) {
    final currentState = state as HistoryFinancialLoaded;
    emit(currentState.copyWith(selectedData: null));
  }

  FutureOr<void> _onSearchData(
    HistoryFinancialSearchData event,
    Emitter<HistoryFinancialState> emit,
  ) {
    final currentState = state;
    if (currentState is HistoryFinancialLoaded) {
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

  FutureOr<void> _onCancelData(
    HistoryFinancialCancelData event,
    Emitter<HistoryFinancialState> emit,
  ) async {
    final currentState = state as HistoryFinancialLoaded;
    final isIncome = currentState.isIncome;
    final dataTrans = currentState.isIncome
        ? repoCache.dataTransIncome
        : repoCache.dataTransExpense;
    final index = dataTrans.indexWhere(
      (element) => element.getinvoice == currentState.selectedData!.getinvoice,
    );
    dataTrans[index] = dataTrans[index].copyWith(
      statusTransaction: ListStatusTransaction.Batal,
    );
    await dataTrans[index].updateCancelDataFinancial(isIncome);
    add(HistoryFinancialGetData());
    repoCache.notifyChanged();
  }

  FutureOr<void> _onSelectedFilter(
    HistoryFinancialSelectedFilter event,
    Emitter<HistoryFinancialState> emit,
  ) {
    final currentState = state as HistoryFinancialLoaded;
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
        indexFilter: event.filter,
      ),
    );
  }

  List<ModelTransactionFinancial> _filterData({
    required List<ModelTransactionFinancial> dataTransaction,
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

      if (filter != ListStatusTransactionFinancial.All) {
        final statusTarget = status == filter;
        if (!statusTarget) return false;
      }

      if (search.isNotEmpty) {
        final invoice = element.getinvoice.toLowerCase();
        final name = element.getnameFinancial.toLowerCase();
        final note = element.getnote.toLowerCase();

        final match =
            name.contains(lowerSearch) ||
            invoice.contains(lowerSearch) ||
            note.contains(lowerSearch);

        if (!match) return false;
      }

      return true;
    }).toList();
  }
}
