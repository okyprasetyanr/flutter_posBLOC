import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/history_transaction/logic/history_transaction_event.dart';
import 'package:flutter_pos/features/history_transaction/logic/history_transaction_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:intl/intl.dart';

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
  }

  Future<void> _onGetData(
    HistoryTransactionGetData event,
    Emitter<HistoryTransactionState> emit,
  ) async {
    emit(HistoryTransactionLoading());

    final dateDefault = DateTime.parse(
      DateFormat('yyyy-MM-dd').format(DateTime.now()),
    );
    DateTime dateStart = event.dateStart ?? dateDefault;
    DateTime dateEnd = event.dateEnd ?? dateDefault;
    final dataBranch = repoCache.getBranch();
    final idBranch = event.idBranch ?? dataBranch.first.getidBranch;
    final filteredSell = await repoCache.getTransactionSell(idBranch).where((
      element,
    ) {
      return (element.getdate.isAtSameMomentAs(dateStart) ||
              element.getdate.isAfter(dateStart)) &&
          (element.getdate.isAtSameMomentAs(dateEnd) ||
              element.getdate.isBefore(dateEnd));
    }).toList();

    final filteredBuy = await repoCache.getTransactionBuy(idBranch).where((
      element,
    ) {
      return (element.getdate.isAtSameMomentAs(dateStart) ||
              element.getdate.isAfter(dateStart)) &&
          (element.getdate.isAtSameMomentAs(dateEnd) ||
              element.getdate.isBefore(dateEnd));
    }).toList();

    emit(
      HistoryTransactionLoaded(
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

      dataTransaction[indexdataTrans] = dataTransaction[indexdataTrans]
          .copyWith(
            statusTransaction: "Remove",
            bankName: dataTransaction[indexdataTrans].getbankName,
          );

      final itemOrdered = dataTransaction[indexdataTrans].getitemsOrdered;
      for (int i = 0; i < itemOrdered.length; i++) {
        for (final item in event.dateExpired) {
          if (itemOrdered[i].getidOrdered == item['id_ordered']) {
            itemOrdered[i] = itemOrdered[i].copyWith(
              dateBuy: item['date_buy'],
              expiredDate: item['expired_date'],
            );
          }
        }
      }
      dataTransaction[indexdataTrans] = dataTransaction[indexdataTrans]
          .copyWith(itemsOrdered: itemOrdered);

      final bloc = event.context.read<DataUserRepositoryCache>();
      await dataTransaction[indexdataTrans].pushDataTransaction(
        statusRemove: true,
        isSell: currentState.isSell,
        dataRepo: bloc,
      );

      add(HistoryTransactionResetData());
    }
  }

  FutureOr<void> onRevisionData(
    HistoryTransactionRevisionData event,
    Emitter<HistoryTransactionState> emit,
  ) {}

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
}
