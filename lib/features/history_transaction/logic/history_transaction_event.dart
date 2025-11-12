import 'package:flutter/material.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class HistoryTransactionEvent {}

class HistoryTransactionGetData extends HistoryTransactionEvent {
  final String? idBranch;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  HistoryTransactionGetData({
    required this.dateStart,
    required this.dateEnd,
    required this.idBranch,
  });
}

class HistoryTransactionSelectedData extends HistoryTransactionEvent {
  final ModelTransaction? selectedData;

  HistoryTransactionSelectedData({required this.selectedData});
}

class HistoryTransactionRevisionData extends HistoryTransactionEvent {}

class HistoryTransactionRemoveData extends HistoryTransactionEvent {
  final BuildContext context;
  final List<Map<String, dynamic>> dateExpired;
  HistoryTransactionRemoveData(this.dateExpired, {required this.context});
}

class HistoryTransactionResetData extends HistoryTransactionEvent {}

class HistoryTransactionPrintData extends HistoryTransactionEvent {}

class HistoryTransactionSearchData extends HistoryTransactionEvent {
  final String search;

  HistoryTransactionSearchData({required this.search});
}
