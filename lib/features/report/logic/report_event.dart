class ReportEvent {}

class ReportGetData extends ReportEvent {
  DateTime? dateStart;
  DateTime? dateEnd;
  String? idBranch;
  ReportGetData({
    required this.dateStart,
    required this.dateEnd,
    required this.idBranch,
  });
}

class ReportModalAwal extends ReportEvent {}

class ReportIsSell extends ReportEvent {}
