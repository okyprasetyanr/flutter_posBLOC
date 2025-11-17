import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/report/logic/report_event.dart';
import 'package:flutter_pos/features/report/logic/report_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_report.dart';
import 'package:flutter_pos/model_data/model_report_summary.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  DataUserRepositoryCache repoCache;
  ReportBloc(this.repoCache) : super(ReportInitial()) {
    on<ReportGetData>(_onGetData);
    on<ReportIsSell>(_onIsSell);
  }

  FutureOr<void> _onGetData(ReportGetData event, Emitter<ReportState> emit) {
    final currentState = state is ReportLoaded
        ? state as ReportLoaded
        : ReportLoaded();
    final dataBranch = repoCache.getBranch();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;
    final dateStart = dateNowYMDStartBLOC(event.dateStart);
    final dateEnd = dateNowYMDEndBLOC(event.dateEnd);
    final dataTransaction = repoCache
        .getTransactionSell(idBranch)
        .where(
          (element) =>
              element.getdate.isAtSameMomentAs(dateStart) ||
              element.getdate.isAfter(dateStart) &&
                  element.getdate.isAtSameMomentAs(dateEnd) ||
              element.getdate.isAfter(dateEnd),
        )
        .toList();

    double qris = 0;
    double debit = 0;
    double cash = 0;
    double netSales = 0;
    double grossSales = 0;
    double ppnAmount = 0;
    double chargeAmount = 0;
    double discountAmount = 0;
    for (final transaction in dataTransaction) {
      final total = transaction.gettotal;
      switch (transaction.getpaymentMethod) {
        case "Cash":
          cash += total;
          break;
        case "Debit":
          debit += total;
          break;
        case "Qris":
          qris += total;
          break;
        case "Split":
          for (final split in transaction.getdataSplit) {
            final totalSplit = split.getpaymentTotal;
            switch (split.getpaymentName) {
              case "Cash":
                cash += totalSplit;
                break;
              case "Debit":
                debit += totalSplit;
                break;
              case "Qris":
                qris += totalSplit;
                break;
            }
          }
          ;
          break;
      }
      netSales += total;
      grossSales +=
          total +
          transaction.gettotalDiscount -
          transaction.gettotalCharge -
          transaction.gettotalPpn;
      chargeAmount += transaction.gettotalCharge;
      ppnAmount += transaction.gettotalPpn;
    }
    double openingBalance = 0.0;
    double income = 0.0;
    double expense = 0.0;
    final summary = ModelReportSummary(cash: cash, qris: qris, debit: debit);

    final report = ModelReport(
      summary: summary,
      ppnAmount: ppnAmount,
      chargeAmount: chargeAmount,
      discountAmount: discountAmount,
      grossSales: grossSales,
      netSales: netSales,
      cashInDrawer: openingBalance + cash + income - expense,
      openingBalance: openingBalance,
      income: income,
      expense: expense,
    );

    emit(
      currentState.copyWith(
        dataBranch: dataBranch,
        report: report,
        dateStart: dateStart,
        dateEnd: dateEnd,
        idBranch: idBranch,
      ),
    );
  }

  FutureOr<void> _onIsSell(ReportIsSell event, Emitter<ReportState> emit) {
    final currentState = state as ReportLoaded;
    emit(
      currentState.copyWith(
        isSell: !currentState.isSell,
        idBranch: currentState.idBranch,
        dateStart: currentState.dateStart,
        dateEnd: currentState.dateEnd,
      ),
    );
  }
}
