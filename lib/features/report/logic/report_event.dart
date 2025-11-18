class ReportEvent {}

class ReportGetData extends ReportEvent {
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String? idBranch;
  final bool? isSell;
  ReportGetData({this.isSell, this.dateStart, this.dateEnd, this.idBranch});
}

class ReportModalAwal extends ReportEvent {}

class ReportIsSell extends ReportEvent {}
