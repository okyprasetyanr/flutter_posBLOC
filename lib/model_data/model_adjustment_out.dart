import 'package:equatable/equatable.dart';

class ModelAdjustmentOut extends Equatable {
  final String invoice;
  final String idBranch;
  final DateTime date;
  final double qty_out;
  final String note;

  ModelAdjustmentOut({
    required this.invoice,
    required this.idBranch,
    required this.date,
    required this.qty_out,
    required this.note,
  });
  String get getinvoice => invoice;
  String get getidBranch => idBranch;
  DateTime get getdate => date;
  double get getqty_in => qty_out;
  String get getnote => note;
  @override
  List<Object?> get props => [invoice, idBranch, date, qty_out, note];
}
