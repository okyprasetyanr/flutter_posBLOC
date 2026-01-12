import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/financial/transaction_financial_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/financial/transaction_financial_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';

class TransFinancialBloc
    extends Bloc<TransFinanctialEvent, TransFinancialState> {
  DataUserRepositoryCache repoCache;
  TransFinancialBloc(this.repoCache) : super(TransFinancialInitial()) {
    on<TransFinancialGetData>(_onGetData);
    on<TransFinancialSelectedFinancial>(_onSelectedFinancial);
    on<TransFinancialUploadTrans>(_onUploadTrans);
    on<TransFinancialResetSelected>(_onResetSelected);
    on<TransFinancialStatusFinancial>(_onStatusFinancial);
    on<TransFinancialSearch>(_onSearch, transformer: debounceRestartable());
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
        filteredData: dataFinancial,
        idBranch: idBranch,
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
    emit(currentState.copyWith(selectedFinancial: event.selectedFinancial));
    debugPrint(
      "Log TransFinancialBloc: selectedData: ${event.selectedFinancial}",
    );
  }

  Future<void> _onUploadTrans(
    TransFinancialUploadTrans event,
    Emitter<TransFinancialState> emit,
  ) async {
    final currentState = state as TransFinancialLoaded;
    final isIncome = currentState.isIncome;

    final selectedData = currentState.selectedFinancial!;
    final counter = repoCache.dataCounter.firstWhere(
      (element) => element.getidBranch == selectedData.idBranch,
    );

    final data = ModelTransactionFinancial(
      statusTransaction: ListStatusTransaction.Sukses,
      idFinancial: selectedData.getidFinancial,
      nameFinancial: selectedData.getnameFinancial,
      idBranch: selectedData.getidBranch,
      invoice: generateInvoice(
        idOP: repoCache.dataAccount!.getNameUser,
        branchId: selectedData.getidBranch,
        queue: isIncome
            ? counter.getcounterIncome + 1
            : counter.getcounterExpense + 1,
      ),
      date: selectedData.getdate,
      note: event.note,
      amount: double.tryParse(event.amount)!,
    );

    data.pushDataFinancial(isIncome);

    final dataCounter = repoCache.dataCounter;

    final counterIndex = dataCounter.indexWhere(
      (element) => element.getidBranch == data.getidBranch,
    );

    dataCounter[counterIndex] = dataCounter[counterIndex].copyWith(
      counterIncome: currentState.isIncome
          ? dataCounter[counterIndex].getcounterIncome + 1
          : null,
      counterExpense: currentState.isIncome
          ? null
          : dataCounter[counterIndex].getcounterExpense + 1,
    );

    await FirebaseFirestore.instance
        .collection('counter')
        .doc(UserSession.uid_owner)
        .collection('branch')
        .doc(data.getidBranch)
        .update({
          currentState.isIncome ? 'counter_income' : 'counter_expense':
              FieldValue.increment(1),
        });

    final updateLocal = isIncome
        ? repoCache.dataTransIncome
        : repoCache.dataTransExpense;
    updateLocal.add(data);

    add(TransFinancialResetSelected());
    repoCache.notifyChanged();
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
    final isIncome = !currentState.isIncome;
    emit(currentState.copyWith(isIncome: isIncome));
    add(TransFinancialGetData(isIncome: isIncome));
  }

  FutureOr<void> _onSearch(
    TransFinancialSearch event,
    Emitter<TransFinancialState> emit,
  ) {
    final currentState = state;
    if (currentState is TransFinancialLoaded) {
      final filteredData = event.search.isNotEmpty
          ? currentState.dataFinancial
                .where(
                  (element) => element.getnameFinancial.toLowerCase().contains(
                    event.search,
                  ),
                )
                .toList()
          : currentState.dataFinancial;
      emit(currentState.copyWith(filteredData: filteredData));
    }
  }
}
