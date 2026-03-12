import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_event.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_state.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_by_id.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_report.dart';
import 'package:flutter_pos/model_data/model_report_summary.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  DataUserRepositoryCache repoCache;
  ReportBloc(this.repoCache) : super(ReportInitial()) {
    on<ReportGetData>(_onGetData);
    on<ReportIsSell>(_onIsSell);
  }

  Future<void> _onGetData(
    ReportGetData event,
    Emitter<ReportState> emit,
  ) async {
    final currentState = state is ReportLoaded
        ? state as ReportLoaded
        : ReportLoaded();
    final dateStart = dateYMDStartBLOC(event.dateStart);

    final dateEnd = dateYMDEndBLOC(event.dateEnd);

    final dataBranch = await getListBranchIsar();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;

    final dataTransaction = event.isSell ?? currentState.isSell
        ? await getTransactionSellIsar(idBranch)
        : await getTransactionBuyIsar(idBranch);
    final finalDataTransaction = dataTransaction.where((element) {
      return (element.getdate.isAtSameMomentAs(dateStart) ||
              element.getdate.isAfter(dateStart)) &&
          (element.getdate.isAtSameMomentAs(dateEnd) ||
              element.getdate.isBefore(dateEnd)) &&
          element.getstatusTransaction == ListStatusTransaction.Sukses;
    }).toList();

    double qris = 0;
    double debit = 0;
    double cash = 0;
    double netSales = 0;
    double grossSales = 0;
    double ppnAmount = 0;
    double chargeAmount = 0;
    double discountAmount = 0;
    for (final transaction in finalDataTransaction) {
      final total = transaction.gettotal;
      switch (transaction.getpaymentMethod) {
        case LabelPaymentMethod.Cash:
          cash += total;
          break;
        case LabelPaymentMethod.Debit:
          debit += total;
          break;
        case LabelPaymentMethod.QRIS:
          qris += total;
          break;
        case LabelPaymentMethod.Split:
          for (final split in transaction.getdataSplit) {
            final totalSplit = split.getpaymentTotal;
            switch (split.getpaymentName) {
              case LabelPaymentMethod.Cash:
                cash += totalSplit;
                break;
              case LabelPaymentMethod.Debit:
                debit += totalSplit;
                break;
              case LabelPaymentMethod.QRIS:
                qris += totalSplit;
                break;
              case LabelPaymentMethod.Split:
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

    final incomeTrans = await getTransactionFinancialIncome(idBranch);
    final finalIncomeTrans = incomeTrans.where((element) {
      return (element.getdate.isAtSameMomentAs(dateStart) ||
              element.getdate.isAfter(dateStart)) &&
          (element.getdate.isAtSameMomentAs(dateEnd) ||
              element.getdate.isBefore(dateEnd)) &&
          element.getstatusTransaction == ListStatusTransaction.Sukses;
    });

    final expenseTrans = await getTransactionFinancialIncome(idBranch);
    final finalexpenseTrans = expenseTrans.where((element) {
      return (element.getdate.isAtSameMomentAs(dateStart) ||
              element.getdate.isAfter(dateStart)) &&
          (element.getdate.isAtSameMomentAs(dateEnd) ||
              element.getdate.isBefore(dateEnd)) &&
          element.getstatusTransaction == ListStatusTransaction.Sukses;
    });

    for (final e in finalIncomeTrans) {
      income += e.getamount;
    }
    for (final e in finalexpenseTrans) {
      expense += e.getamount;
    }

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

    debugPrint("Log ReportBloc: report: $finalDataTransaction");
    final isSell = event.isSell ?? currentState.isSell;

    emit(
      currentState.copyWith(
        isSell: isSell,
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
    final isSell = currentState.isSell;
    emit(
      currentState.copyWith(
        isSell: !isSell,
        idBranch: currentState.idBranch,
        dateStart: currentState.dateStart,
        dateEnd: currentState.dateEnd,
      ),
    );
    add(ReportGetData(isSell: !isSell));
  }
}
