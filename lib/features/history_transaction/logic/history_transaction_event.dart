import 'package:flutter/material.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class HistoryTransactionEvent {}

class HistoryTransactionGetData extends HistoryTransactionEvent {
  final String? idBranch;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final bool? isSell;

  HistoryTransactionGetData({
    this.isSell,
    this.dateStart,
    this.dateEnd,
    this.idBranch,
  });
}

class HistoryTransactionSelectedData extends HistoryTransactionEvent {
  final ModelTransaction? selectedData;

  HistoryTransactionSelectedData({required this.selectedData});
}

class HistoryTransactionRevisionData extends HistoryTransactionEvent {
  final BuildContext context;

  HistoryTransactionRevisionData({required this.context});
}

class HistoryTransactionCancelData extends HistoryTransactionEvent {
  final BuildContext context;
  final List<Map<String, dynamic>> dateExpired;
  HistoryTransactionCancelData(this.dateExpired, {required this.context});
}

class HistoryTransactionResetSelectedData extends HistoryTransactionEvent {}

class HistoryTransactionPrintData extends HistoryTransactionEvent {}

class HistoryTransactionSearchData extends HistoryTransactionEvent {
  final String search;

  HistoryTransactionSearchData({required this.search});
}
