// ignore_for_file: public_member_api_docs, sort_constructors_first
class DataReportEvent {}

class DataReportGetData extends DataReportEvent {
  final String? idBranch;

  DataReportGetData({this.idBranch});
}
