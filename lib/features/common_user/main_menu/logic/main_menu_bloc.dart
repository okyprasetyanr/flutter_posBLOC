import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_event.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';

class DataReportBloc extends Bloc<DataReportEvent, DataReportState> {
  final DataUserRepositoryCache repoCache;
  late final StreamSubscription _repoSub;

  DataReportBloc(this.repoCache) : super(DataReportInitial()) {
    // 👂 LISTEN PERUBAHAN REPO
    _repoSub = repoCache.onChanged.listen((_) {
      add(DataReportGetData());
    });

    on<DataReportGetData>(_onGetData);
  }

  @override
  Future<void> close() {
    _repoSub.cancel(); // 🧹 wajib
    return super.close();
  }

  FutureOr<void> _onGetData(
    DataReportGetData event,
    Emitter<DataReportState> emit,
  ) {
    final currentState = state is DataReportLoaded
        ? state as DataReportLoaded
        : DataReportLoaded();

    final dateStart = dateNowYMDBLOC(statusEnd: false);
    final dateEnd = dateNowYMDBLOC(statusEnd: true);

    final dataBranch = repoCache.getBranch();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;

    final dataTransaction = repoCache.getTransactionSell(idBranch).where((
      element,
    ) {
      return (element.getdate.isAtSameMomentAs(dateStart) ||
              element.getdate.isAfter(dateStart)) &&
          (element.getdate.isAtSameMomentAs(dateEnd) ||
              element.getdate.isBefore(dateEnd)) &&
          element.getstatusTransaction == ListStatusTransaction.Sukses;
    }).toList();

    double netSales = 0;
    double income = 0;
    double expense = 0;
    double grossSales = 0;
    int totalTransaction = 0;
    int totalItemTransaction = 0;

    for (final element in dataTransaction) {
      final total = element.gettotal;
      netSales += total;
      grossSales +=
          total +
          element.gettotalDiscount -
          element.gettotalCharge -
          element.gettotalPpn;
      totalTransaction++;
      totalItemTransaction += element.getitemsOrdered.length;
    }

    final incomeTrans = repoCache.getTransactionIncome(idBranch).where((
      element,
    ) {
      return (element.getdate.isAtSameMomentAs(dateStart) ||
              element.getdate.isAfter(dateStart)) &&
          (element.getdate.isAtSameMomentAs(dateEnd) ||
              element.getdate.isBefore(dateEnd)) &&
          element.getstatusTransaction == ListStatusTransaction.Sukses;
    });

    final expenseTrans = repoCache.getTransactionExpense(idBranch).where((
      element,
    ) {
      return (element.getdate.isAtSameMomentAs(dateStart) ||
              element.getdate.isAfter(dateStart)) &&
          (element.getdate.isAtSameMomentAs(dateEnd) ||
              element.getdate.isBefore(dateEnd)) &&
          element.getstatusTransaction == ListStatusTransaction.Sukses;
    });

    for (final e in incomeTrans) {
      income += e.getamount;
    }
    for (final e in expenseTrans) {
      expense += e.getamount;
    }

    emit(
      currentState.copyWith(
        dataBranch: dataBranch,
        idBranch: idBranch,
        totalExpense: expense,
        totalIncome: income,
        totalItemTranasction: totalItemTransaction,
        totalNeto: netSales,
        totalSell: grossSales,
        totalTransaction: totalTransaction,
      ),
    );
  }
}
