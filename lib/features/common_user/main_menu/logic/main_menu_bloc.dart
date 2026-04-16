import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_event.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_state.dart';
import 'package:flutter_pos/features/common_user/main_menu/presentation/ui_main_menu.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_by.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/function/report_algoritm.dart';
import 'package:flutter_pos/model_data/model_expired_item_batch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';

class DataReportBloc extends Bloc<DataReportEvent, DataReportState> {
  final DataUserRepositoryCache repoCache;
  late final StreamSubscription _repoSub;
  bool isLogout = false;
  DataReportBloc(this.repoCache) : super(DataReportInitial()) {
    _repoSub = repoCache.onChanged.listen((_) {
      if (isLogout) return;
      add(DataReportGetData());
    });

    on<DataReportGetData>(_onGetData);
  }

  @override
  Future<void> close() {
    _repoSub.cancel();
    return super.close();
  }

  Future<void> _onGetData(
    DataReportGetData event,
    Emitter<DataReportState> emit,
  ) async {
    final currentState = state is DataReportLoaded
        ? state as DataReportLoaded
        : DataReportLoaded();

    final dateStart = dateNowYMDBLOC(statusEnd: false);
    final dateEnd = dateNowYMDBLOC(statusEnd: true);

    final dataBranch = await getAllListBranchIsar();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;
    final dataTransaction = await getTransactionSellIsar(idBranch);
    final finalDataTransaction = dataTransaction.where(
      (element) => element.getstatusTransaction == ListStatusTransaction.Sukses,
    );
    final dataTransactionByDate = finalDataTransaction.where((element) {
      return isBetween(element.getdate, dateStart, dateEnd);
    }).toList();

    double netSales = 0;
    double income = 0;
    double expense = 0;
    double grossSales = 0;
    int totalTransaction = 0;
    int totalItemTransaction = 0;

    for (final element in dataTransactionByDate) {
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

    final incomeTrans = await getTransactionFinancialIncome(idBranch);
    final finalIncomeTrans = incomeTrans.where(
      (e) => isBetween(e.getdate, dateStart, dateEnd),
    );

    final expenseTrans = await getTransactionFinancialExpense(idBranch);
    final finalexpenseTrans = expenseTrans.where(
      (e) => isBetween(e.getdate, dateStart, dateEnd),
    );

    for (final e in finalIncomeTrans) {
      income += e.getamount;
    }
    for (final e in finalexpenseTrans) {
      expense += e.getamount;
    }

    final dataAccount = await getAllAccountIsar();

    final dataItem = await getItemIsar(idBranch);
    ModelItem? bestSeller;
    ModelItem? worstSeller;
    ModelItem? lowStockItems;
    if (finalDataTransaction.isNotEmpty && dataItem.isNotEmpty) {
      final Map<String, double> qtyPerItem = {};
      finalDataTransaction.expand((e) => e.getitemsOrdered).forEach((item) {
        qtyPerItem.update(
          item.getidItem,
          (value) => value + item.getqtyItem,
          ifAbsent: () => item.getqtyItem,
        );
      });

      final Map<String, double> qtyItem = {};
      dataItem.forEach(
        (element) => qtyItem.update(
          element.getidItem,
          (value) => value + element.getqtyItem,
          ifAbsent: () => element.getqtyItem,
        ),
      );
      final bestItem = qtyPerItem.entries.reduce(
        (a, b) => a.value > b.value ? a : b,
      );
      bestSeller = dataItem
          .firstWhere((element) => element.getidItem == bestItem.key)
          .copyWith(qtyItem: bestItem.value);

      final worstItem = qtyPerItem.entries.reduce(
        (a, b) => a.value < b.value ? a : b,
      );
      worstSeller = dataItem
          .firstWhere((element) => element.getidItem == worstItem.key)
          .copyWith(qtyItem: worstItem.value);

      lowStockItems = dataItem.firstWhere(
        (element) =>
            element.getidItem ==
            qtyItem.entries.reduce((a, b) => a.value < b.value ? a : b).key,
      );
    }
    final now = DateTime.now();
    final dataItemExpired = await getItemBatchIsar(idBranch);

    Map<String, ModelExpiredItemBatch> almostExpiredItem = getExpiredItem(
      dataItemExpired: dataItemExpired,
      almostExpired: true,
      now: now,
    );
    Map<String, ModelExpiredItemBatch> expiredItem = getExpiredItem(
      dataItemExpired: dataItemExpired,
      almostExpired: false,
      now: now,
    );

    devLog("Log MainMenuBloc: datAcount: $dataAccount");

    final spots = (finalDataTransaction.isEmpty)
        ? [const FlSpot(0, 0)]
        : buildWeeklyTransactionSpots(finalDataTransaction.toList());

    final labels = buildWeeklyLabels();
    double rawMaxY = spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    double smartInterval = calculateSmartInterval(rawMaxY);
    if (smartInterval <= 0) smartInterval = 1;

    double adjustedMaxY = (rawMaxY / smartInterval).ceil() * smartInterval;
    if (adjustedMaxY <= 0) adjustedMaxY = smartInterval * 4;

    emit(
      currentState.copyWith(
        bestSeller: bestSeller,
        expiredItem: expiredItem.values.toList(),
        almostExpiredItem: almostExpiredItem.values.toList(),
        dataAccount: dataAccount,
        lowStock: lowStockItems,
        worstSeller: worstSeller,
        dataBranch: dataBranch,
        idBranch: idBranch,
        totalExpense: expense,
        totalIncome: income,
        totalItemTranasction: totalItemTransaction,
        totalNeto: netSales,
        totalSell: grossSales,
        totalTransaction: totalTransaction,
        labels: labels,
        maxY: adjustedMaxY,
        smartInterval: smartInterval,
        spot: spots,
      ),
    );
  }

  bool isBetween(DateTime date, DateTime start, DateTime end) {
    return (date.isAtSameMomentAs(start) || date.isAfter(start)) &&
        (date.isAtSameMomentAs(end) || date.isBefore(end));
  }

  Map<String, ModelExpiredItemBatch> getExpiredItem({
    required List<ModelItemBatch> dataItemExpired,
    required bool almostExpired,
    required DateTime now,
  }) {
    Map<String, ModelExpiredItemBatch> dataExpired = {};
    final nextMonth = now.add(const Duration(days: 30));

    dataItemExpired
        .where((item) {
          if (item.getexpiredDate == null || item.getexpiredDate == "-") {
            return false;
          }

          final exp = item.getexpiredDate!;

          if (almostExpired) {
            // expired dalam 30 hari
            return exp.isAfter(now) && exp.isBefore(nextMonth);
          } else {
            // expired hari ini
            return exp.year == now.year &&
                exp.month == now.month &&
                exp.day == now.day;
          }
        })
        .forEach((element) {
          dataExpired.putIfAbsent(
            element.getidItem,
            () => ModelExpiredItemBatch(
              nameItem: element.getnameItem,
              idItem: element.getidItem,
              totalExpired: 0,
              invoiceList: [],
            ),
          );

          dataExpired[element.getidItem]!.invoiceList.add(element.getinvoice);
          dataExpired[element.getidItem]!.totalExpired += 1;
        });

    return dataExpired;
  }
}
