import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/history_adjustment/logic/history_adjustment_event.dart';
import 'package:flutter_pos/features/common_user/history_adjustment/logic/history_adjustment_state.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_by.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction_adjustment_in.dart';
import 'package:flutter_pos/model_data/model_transaction_adjustment_out.dart';

class HistoryAdjustmentBloc
    extends Bloc<HistoryAdjustmentEvent, HistoryAdjustmentState> {
  HistoryAdjustmentBloc() : super(HistoryAdjustmentInitial()) {
    on<HistoryAdjustmentGetData>(_onGetData);
    on<HistoryAdjustmentSelectedData>(_onSelectedData);
    on<HistoryAdjustmentChangeMode>(_onChangeMode);
    on<HistoryAdjustmentSearchData>(
      _onSearchData,
      transformer: debounceRestartable(),
    );
    on<HistoryAdjustmentResetSelectedData>(_onResetSelectedData);
  }

  Future<void> _onGetData(
    HistoryAdjustmentGetData event,
    Emitter<HistoryAdjustmentState> emit,
  ) async {
    final currentState = state is HistoryAdjustmentLoaded
        ? state as HistoryAdjustmentLoaded
        : HistoryAdjustmentLoaded();
    final dateStart = event.dateStart != null
        ? dateYMDStartBLOC(event.dateStart)
        : dateYMDStartBLOC(currentState.dateStart);
    final isAdjustmentIn = currentState.isAdjustmentIn;
    final dateEnd = event.dateEnd != null
        ? dateYMDEndBLOC(event.dateEnd)
        : dateYMDEndBLOC(currentState.dateEnd);
    final dataBranch = currentState.dataBranch.isNotEmpty
        ? currentState.dataBranch
        : await getAllListBranchIsar();
    final idBranch = currentState.idBranch ?? dataBranch.first.getidBranch;
    final validate = event.dateEnd != null && event.dateStart != null;
    final dataAdjustmentIn = validate
        ? currentState.dataAdjustmentIn
        : await getTransactionAdjustmentInBy(idBranch);
    final dataAdjustmentOut = validate
        ? currentState.dataAdjustmentOut
        : await getTransactionAdjustmentOutBy(idBranch);
    final filteredAdjustmentIn = _filterData<ModelTransactionAdjustmentIn>(
      getInvoice: (dataItem) => dataItem.getinvoice,
      data: dataAdjustmentIn,
      search: currentState.search,
      start: dateStart,
      end: dateEnd,
      getDate: (dataItem) => dataItem.getdate,
      getNameItem: (dataItem) => dataItem.getitemName,
    );
    final filteredAdjustmentOut = _filterData<ModelTransactionAdjustmentOut>(
      getInvoice: (dataItem) => dataItem.getinvoice,
      data: dataAdjustmentOut,
      search: currentState.search,
      start: dateStart,
      end: dateEnd,
      getDate: (dataItem) => dataItem.getdate,
      getNameItem: (dataItem) => dataItem.getitemName,
    );
    final displayDate =
        formatDate(date: dateStart, minute: false) ==
                formatDate(date: DateTime.now(), minute: false) &&
            formatDate(date: dateEnd, minute: false) ==
                formatDate(date: DateTime.now(), minute: false)
        ? "Hari ini"
        : "${formatDate(date: dateStart, minute: false)} - ${formatDate(date: dateEnd, minute: false)}";
    emit(
      currentState.copyWith(
        dataAdjustmentIn: dataAdjustmentIn,
        dataAdjustmentOut: dataAdjustmentOut,
        filteredDataAdjustmentIn: filteredAdjustmentIn,
        filteredDataAdjustmentOut: filteredAdjustmentOut,
        dateEnd: dateEnd,
        dateStart: dateStart,
        idBranch: idBranch,
        displayDate: displayDate,
        isAdjustmentIn: isAdjustmentIn,
      ),
    );
  }

  List<T> _filterData<T>({
    required List<T> data,
    required String search,
    required DateTime start,
    required DateTime end,
    required String Function(T dataItem) getNameItem,
    required DateTime Function(T dataItem) getDate,
    required String Function(T dataItem) getInvoice,
  }) {
    final filtered = data.where((element) {
      final name = getNameItem(element).toLowerCase();
      final invoice = getInvoice(element).toLowerCase();
      final date = getDate(element);

      final matchSearch =
          search.isEmpty ||
          name.contains(search.toLowerCase()) ||
          invoice.contains(search.toLowerCase());

      final matchDate =
          (date.isAtSameMomentAs(start) || date.isAfter(start)) &&
          (date.isAtSameMomentAs(end) || date.isBefore(end));

      return matchSearch && matchDate;
    }).toList();

    filtered.sort((a, b) => getDate(b).compareTo(getDate(a)));

    return filtered;
  }

  FutureOr<void> _onSelectedData(
    HistoryAdjustmentSelectedData event,
    Emitter<HistoryAdjustmentState> emit,
  ) {
    final currentState = state as HistoryAdjustmentLoaded;
    emit(
      currentState.copyWith(
        selectedTransactionAdjustmentIn: currentState.isAdjustmentIn
            ? event.selectedData
            : currentState.selectedTransactionAdjustmentIn,
        selectedTransactionAdjustmentOut: currentState.isAdjustmentIn
            ? currentState.selectedTransactionAdjustmentOut
            : event.selectedData,
      ),
    );
  }

  FutureOr<void> _onChangeMode(
    HistoryAdjustmentChangeMode event,
    Emitter<HistoryAdjustmentState> emit,
  ) {
    emit(
      (state as HistoryAdjustmentLoaded).copyWith(
        isAdjustmentIn: event.isAdjustmentIn,
      ),
    );
  }

  FutureOr<void> _onSearchData(
    HistoryAdjustmentSearchData event,
    Emitter<HistoryAdjustmentState> emit,
  ) {
    final currentState = state as HistoryAdjustmentLoaded;
    final filteredAdjustmentIn = _filterData<ModelTransactionAdjustmentIn>(
      getInvoice: (dataItem) => dataItem.getinvoice,
      data: currentState.dataAdjustmentIn,
      search: event.search,
      start: currentState.dateStart!,
      end: currentState.dateStart!,
      getDate: (dataItem) => dataItem.getdate,
      getNameItem: (dataItem) => dataItem.getitemName,
    );
    final filteredAdjustmentOut = _filterData<ModelTransactionAdjustmentOut>(
      getInvoice: (dataItem) => dataItem.getinvoice,
      data: currentState.dataAdjustmentOut,
      search: event.search,
      start: currentState.dateStart!,
      end: currentState.dateStart!,
      getDate: (dataItem) => dataItem.getdate,
      getNameItem: (dataItem) => dataItem.getitemName,
    );
    emit(
      currentState.copyWith(
        filteredDataAdjustmentIn: filteredAdjustmentIn,
        dataAdjustmentOut: filteredAdjustmentOut,
      ),
    );
  }

  FutureOr<void> _onResetSelectedData(
    HistoryAdjustmentResetSelectedData event,
    Emitter<HistoryAdjustmentState> emit,
  ) {
    emit((state as HistoryAdjustmentLoaded).copyWith());
  }
}
