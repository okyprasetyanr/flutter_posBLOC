import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/history_financial/logic/history_financial_event.dart';
import 'package:flutter_pos/features/history_financial/logic/history_financial_state.dart';
import 'package:flutter_pos/function/function.dart';

class HistoryFinancialBloc
    extends Bloc<HistoryFinancialEvent, HistoryFinancialState> {
  DataUserRepositoryCache repoCache;
  HistoryFinancialBloc(this.repoCache) : super(HistoryFinancialInitial()) {
    on<HistoryFinancialGetData>(_onGetData);
    on<HistoryFinancialSelectedData>(_onSelectedData);
    on<HistoryFinancialResetSelectedData>(_onResetSelectedData);
    on<HistoryFinancialSearchData>(_onSearchData);
    on<HistoryFinancialCancelData>(_onCancelData);
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

    emit(
      HistoryFinancialLoaded(
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
    final currentState = state as HistoryFinancialLoaded;
    final search = event.search.toLowerCase();
    final filteredData = currentState.dataTransaction.where((element) {
      final invoice = element.getinvoice.toLowerCase();
      final name = element.getnameFinancial.toLowerCase();
      final note = element.getnote.toLowerCase();
      return name.contains(search) ||
          invoice.contains(search) ||
          note.contains(search);
    }).toList();
    emit(currentState.copyWith(filteredData: filteredData));
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
    final index = dataTrans!.indexWhere(
      (element) => element.getinvoice == currentState.selectedData!.getinvoice,
    );
    dataTrans[index] = dataTrans[index].copyWith(
      statusTransaction: statusTransaction(index: 3),
    );
    await dataTrans[index].updateCancelDataFinancial(isIncome);
    add(HistoryFinancialGetData());
  }
}
