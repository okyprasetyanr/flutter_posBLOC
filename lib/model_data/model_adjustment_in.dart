import 'package:equatable/equatable.dart';

class ModelAdjustmentIn extends Equatable {
  final String invoice;
  final String idBranch;
  final DateTime date;
  final double qty_in;
  final double sellPrice;
  final double buyPrice;
  final DateTime expiredDate;
  final String note;

  ModelAdjustmentIn({
    required this.invoice,
    required this.idBranch,
    required this.date,
    required this.qty_in,
    required this.sellPrice,
    required this.buyPrice,
    required this.expiredDate,
    required this.note,
  });
  String get getinvoice => invoice;
  String get getidBranch => idBranch;
  DateTime get getdate => date;
  double get getqty_in => qty_in;
  double get getsellPrice => sellPrice;
  double get getbuyPrice => buyPrice;
  DateTime get getexpiredDate => expiredDate;
  String get getnote => note;
  @override
  List<Object?> get props => [
    invoice,
    idBranch,
    date,
    qty_in,
    sellPrice,
    buyPrice,
    expiredDate,
    note,
  ];
}
