import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/transaction/logic/financial/transaction_financial_event.dart';
import 'package:flutter_pos/features/transaction/logic/financial/transaction_financial_state.dart';

class TransFinancialBloc
    extends Bloc<TransFinanctialEvent, TransFinancialState> {
  DataUserRepositoryCache repoCache;
  TransFinancialBloc(this.repoCache) : super(TransFinancialInitial()) {
    on<TransFinancialGetData>(_onGetData);
    on<TransFinancialSelectedFinancial>(_onSelectedFinancial);
    on<TransFinancialUploadTrans>(_onUploadTrans);
    on<TransFinancialResetSelected>(_onResetSelected);
    on<TransFinancialStatusFinancial>(_onStatusFinancial);
  }

  FutureOr<void> _onGetData(
    TransFinancialGetData event,
    Emitter<TransFinancialState> emit,
  ) {
    final currentState = state is TransFinancialLoaded
        ? state as TransFinancialLoaded
        : TransFinancialLoaded();
    final dataBranch = currentState.dataBranch ?? repoCache.getBranch();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;
    final isIncome = event.isIncome ?? currentState.isIncome;
    final dataFinancial = isIncome
        ? repoCache.getIncome(idBranch)
        : repoCache.getExpense(idBranch);
    dataFinancial.sort(
      (a, b) => a.getnameFinancial.compareTo(b.getnameFinancial),
    );
    emit(
      TransFinancialLoaded(
        dataBranch: dataBranch,
        dataFinancial: dataFinancial,
        isIncome: isIncome,
      ),
    );
  }

  FutureOr<void> _onSelectedFinancial(
    TransFinancialSelectedFinancial event,
    Emitter<TransFinancialState> emit,
  ) {
    final currentState = state as TransFinancialLoaded;
    final selectedFinancial = event.selectedFinancial.copyWith();
    emit(currentState.copyWith(selectedFinancial: selectedFinancial));
  }

  FutureOr<void> _onUploadTrans(
    TransFinancialUploadTrans event,
    Emitter<TransFinancialState> emit,
  ) {
    event.uploadTransFinancial.pushDataFinancial();
    add(TransFinancialResetSelected());
  }

  FutureOr<void> _onResetSelected(
    TransFinancialResetSelected event,
    Emitter<TransFinancialState> emit,
  ) {
    final currentState = state as TransFinancialLoaded;
    emit(currentState.copyWith(selectedFinancial: null));
  }

  FutureOr<void> _onStatusFinancial(
    TransFinancialStatusFinancial event,
    Emitter<TransFinancialState> emit,
  ) {
    final currentState = state as TransFinancialLoaded;
    emit(currentState.copyWith(isIncome: !currentState.isIncome));
  }
}
