import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/shared/helper/enum_and_string/enum.dart';
import 'package:flutter_pos/core/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/transaction_financial/logic/transaction_financial_event.dart';
import 'package:flutter_pos/features/transaction_financial/logic/transaction_financial_state.dart';
import 'package:flutter_pos/core/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/core/data_user/isar/action/get/get_data_isar_by.dart';
import 'package:flutter_pos/core/data_user/isar/action/save/save_update_data_isar.dart';
import 'package:flutter_pos/shared/helper/common_helper/event_transformer.dart.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/history_financial/model/model_transaction_financial.dart';
import 'package:flutter_pos/shared/helper/request/update_data.dart';

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

  Future<void> _onGetData(
    TransFinancialGetData event,
    Emitter<TransFinancialState> emit,
  ) async {
    final currentState = state is TransFinancialLoaded
        ? state as TransFinancialLoaded
        : TransFinancialLoaded();
    final dataBranch = currentState.dataBranch ?? await getAllListBranchIsar();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;
    final isIncome = event.isIncome ?? currentState.isIncome;
    final dataFinancial = isIncome
        ? await getIncomeIsar(idBranch)
        : await getExpenseIsar(idBranch);
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
    devLog("Log TransFinancialBloc: selectedData: ${event.selectedFinancial}");
  }

  Future<void> _onUploadTrans(
    TransFinancialUploadTrans event,
    Emitter<TransFinancialState> emit,
  ) async {
    final currentState = state as TransFinancialLoaded;
    final isIncome = currentState.isIncome;

    final selectedData = currentState.selectedFinancial!;
    final counter = await getCounterIsar(currentState.idBranch!);
    final dataAccount = await getAllAccountIsar();
    final data = ModelTransactionFinancial(
      statusTransaction: ListStatusTransaction.Sukses,
      idFinancial: selectedData.getidFinancial,
      nameFinancial: selectedData.getnameFinancial,
      idBranch: selectedData.getidBranch,
      invoice: generateInvoice(
        idOP: dataAccount.getNameUser,
        branchId: selectedData.getidBranch,
        queue: isIncome
            ? counter.getcounterIncome + 1
            : counter.getcounterExpense + 1,
      ),
      date: selectedData.getdate,
      note: event.note,
      amount: double.tryParse(event.amount)!,
    );

    final finalCounter = counter.copyWith(
      counterIncome: isIncome ? counter.getcounterIncome + 1 : null,
      counterExpense: isIncome ? null : counter.getcounterExpense + 1,
    );

    await saveCounter_Isar(finalCounter);

    isIncome
        ? await saveTransactionFinancialncome_Isar(data)
        : await saveTransactionFinancialExpense_Isar(data);

    await updateCounter(
      field: isIncome ? 'counter_income' : 'counter_expense',
      idBranch: data.getidBranch,
    );

    await data.pushDataFinancial(isIncome);
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
