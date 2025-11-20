import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/financial/logic/financial_event.dart';
import 'package:flutter_pos/features/financial/logic/financial_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/request/delete_data.dart';

class FinancialBloc extends Bloc<FinancialEvent, FinancialState> {
  DataUserRepositoryCache repoCache;
  FinancialBloc(this.repoCache) : super(FinancialInitial()) {
    on<FinancialGetData>(_onGetData);
    on<FinancialSelectedFinancial>(_onSelectedFinancial);
    on<FinancialUploadDataFinancial>(_onUploadata);
    on<FinancialStatusFinancial>(_onStatusFinancial);
    on<FinancialResetSelectedFinancial>(_onResetSelected);
    on<FinancialDeleteFinancial>(_onDelete);
    on<FinancialIsIncome>(_onIsIncome);
  }

  void _onGetData(FinancialGetData event, Emitter<FinancialState> emit) {
    final currentState = state is FinancialLoaded
        ? state as FinancialLoaded
        : FinancialLoaded();

    final dataBranch = currentState.dataBranch ?? repoCache.getBranch();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;
    final isIncome = event.isIncome ?? currentState.isIncome;
    final dataFinancial = isIncome
        ? repoCache.getIncome(idBranch)
        : repoCache.getExpense(idBranch);
    emit(
      FinancialLoaded(
        dataBranch: dataBranch,
        dataFinancial: dataFinancial,
        filteredFinancial: dataFinancial,
        idBranch: idBranch,
        isIncome: isIncome,
      ),
    );
  }

  FutureOr<void> _onSelectedFinancial(
    FinancialSelectedFinancial event,
    Emitter<FinancialState> emit,
  ) {
    final currentState = state as FinancialLoaded;
    emit(currentState.copyWith(selectedFinancial: event.selectedFinancial));
  }

  FutureOr<void> _onUploadata(
    FinancialUploadDataFinancial event,
    Emitter<FinancialState> emit,
  ) {
    event.financial.pushDataFinancial();
    final dataFinancial = repoCache.dataFinancial;
    final indexData = dataFinancial.indexWhere(
      (element) => element.getidFinancial == event.financial.getidFinancial,
    );

    if (indexData != -1) {
      dataFinancial[indexData] = event.financial;
    } else {
      dataFinancial.add(event.financial);
    }

    add(FinancialGetData());
  }

  FutureOr<void> _onStatusFinancial(
    FinancialStatusFinancial event,
    Emitter<FinancialState> emit,
  ) {
    final currentState = state as FinancialLoaded;
    emit(currentState.copyWith(isIncome: !currentState.isIncome));
  }

  FutureOr<void> _onResetSelected(
    FinancialResetSelectedFinancial event,
    Emitter<FinancialState> emit,
  ) {
    final currentState = state as FinancialLoaded;
    emit(currentState.copyWith(selectedFinancial: null));
  }

  FutureOr<void> _onDelete(
    FinancialDeleteFinancial event,
    Emitter<FinancialState> emit,
  ) {
    final currentState = state as FinancialLoaded;
    final selectedFinancial = currentState.selectedFinancial!;
    deleteDataFinancial(selectedFinancial.getidFinancial);
    final dataFinancial = repoCache.dataFinancial;
    final indexData = dataFinancial.indexWhere(
      (element) => element.getidFinancial == selectedFinancial.getidFinancial,
    );
    if (indexData != -1) {
      dataFinancial.removeAt(indexData);
    }
  }

  FutureOr<void> _onIsIncome(
    FinancialIsIncome event,
    Emitter<FinancialState> emit,
  ) {
    final currentState = state as FinancialLoaded;
    final isIncome = !currentState.isIncome;
    emit(currentState.copyWith(isIncome: isIncome));
    add(FinancialGetData(isIncome: isIncome));
  }
}
