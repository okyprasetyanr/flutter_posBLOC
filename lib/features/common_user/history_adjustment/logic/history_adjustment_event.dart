class HistoryAdjustmentEvent {}

class HistoryAdjustmentGetData extends HistoryAdjustmentEvent {
  final String? idBranch;
  final DateTime? dateStart;
  final DateTime? dateEnd;

  HistoryAdjustmentGetData({this.idBranch, this.dateStart, this.dateEnd});
}

class HistoryAdjustmentSelectedData<T> extends HistoryAdjustmentEvent {
  final T selectedData;

  HistoryAdjustmentSelectedData({required this.selectedData});
}

class HistoryAdjustmentChangeMode extends HistoryAdjustmentEvent {
  final bool isAdjustmentIn;

  HistoryAdjustmentChangeMode({required this.isAdjustmentIn});
}

class HistoryAdjustmentSearchData extends HistoryAdjustmentEvent {
  final String search;

  HistoryAdjustmentSearchData({required this.search});
}

class HistoryAdjustmentResetSelectedData extends HistoryAdjustmentEvent {}
