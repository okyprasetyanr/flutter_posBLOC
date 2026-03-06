import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_event.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_expired_item_batch.dart';
import 'package:flutter_pos/model_data/model_item.dart';

class DataReportBloc extends Bloc<DataReportEvent, DataReportState> {
  final DataUserRepositoryCache repoCache;
  late final StreamSubscription _repoSub;

  DataReportBloc(this.repoCache) : super(DataReportInitial()) {
    _repoSub = repoCache.onChanged.listen((_) {
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

    final dataBranch = await repoCache.getBranch();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;
    final dataTransaction = await repoCache.getTransactionSell(idBranch);
    final dataTransactionByData = dataTransaction.where((element) {
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

    for (final element in dataTransactionByData) {
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

    final incomeTrans = await repoCache.getTransactionIncome(idBranch).where((
      element,
    ) {
      return (element.getdate.isAtSameMomentAs(dateStart) ||
              element.getdate.isAfter(dateStart)) &&
          (element.getdate.isAtSameMomentAs(dateEnd) ||
              element.getdate.isBefore(dateEnd)) &&
          element.getstatusTransaction == ListStatusTransaction.Sukses;
    });

    final expenseTrans = await repoCache.getTransactionExpense(idBranch).where((
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

    final dataItem = await repoCache.getItem(idBranch);
    ModelItem? bestSeller;
    ModelItem? worstSeller;
    ModelItem? lowStockItems;
    if (dataItem.isNotEmpty) {
      final Map<String, double> qtyPerItem = {};
      dataTransaction.expand((e) => e.getitemsOrdered).forEach((item) async {
        await qtyPerItem.update(
          item.getidItem,
          (value) => value + item.getqtyItem,
          ifAbsent: () => item.getqtyItem,
        );
      });

      final Map<String, double> qtyItem = {};
      dataItem.forEach(
        (element) async => await qtyItem.update(
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
    Map<String, ModelExpiredItemBatch> almostExpiredItem = {};
    final dataItemExpired = repoCache
        .getBatch(idBranch)
        .expand((element) => element.getitems_batch);

    dataItemExpired
        .where(
          (item) =>
              item.getexpiredDate != null &&
              item.getexpiredDate != "-" &&
              item.getexpiredDate!.isBefore(
                DateTime.now().subtract(const Duration(days: 5)),
              ),
        )
        .forEach((element) {
          if (!almostExpiredItem.containsKey(element.getidItem)) {
            almostExpiredItem[element.getidItem] = ModelExpiredItemBatch(
              nameItem: element.getnameItem,
              idItem: element.getidItem,
              totalExpired: 0,
              invoiceList: [],
            );
          }
          almostExpiredItem[element.getidItem]!.invoiceList.add(
            element.getinvoice,
          );

          almostExpiredItem[element.getidItem]!.totalExpired += 1;
        });

    Map<String, ModelExpiredItemBatch> expiredItem = {};
    dataItemExpired
        .where((item) {
          if (item.getexpiredDate == null || item.getexpiredDate == "-")
            return false;

          final exp = item.getexpiredDate!;
          return exp.year == now.year &&
              exp.month == now.month &&
              exp.day == now.day;
        })
        .forEach((element) {
          if (!expiredItem.containsKey(element.getidItem)) {
            expiredItem[element.getidItem] = ModelExpiredItemBatch(
              nameItem: element.getnameItem,
              idItem: element.getidItem,
              totalExpired: 0,
              invoiceList: [],
            );
          }
          expiredItem[element.getidItem]!.invoiceList.add(element.getinvoice);

          expiredItem[element.getidItem]!.totalExpired += 1;
        });

    emit(
      currentState.copyWith(
        bestSeller: bestSeller,
        expiredItem: expiredItem.values.toList(),
        almostExpiredItem: almostExpiredItem.values.toList(),
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
      ),
    );
  }
}
