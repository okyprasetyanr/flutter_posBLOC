import 'package:equatable/equatable.dart';
import 'package:flutter_pos/shared/helper/from_and_to_map/convert_to_map.dart';
import 'package:flutter_pos/core/request/push_data.dart';

class ModelTransactionAdjustmentOut extends Equatable {
  final String invoice;
  final String idBranch;
  final String itemName;
  final String itemInvoice;
  final DateTime date;
  final double? qty_out_after;
  final double? qty_out_before;
  final String note;

  ModelTransactionAdjustmentOut({
    required this.invoice,
    required this.idBranch,
    required this.itemName,
    required this.itemInvoice,
    required this.date,
    required this.qty_out_after,
    required this.qty_out_before,
    required this.note,
  });

  String get getitemName => itemName;
  String get getitemInvoice => itemInvoice;
  String get getinvoice => invoice;
  String get getidBranch => idBranch;
  DateTime get getdate => date;
  double? get getqty_out_after => qty_out_after;
  double? get getqty_out_before => qty_out_before;
  String get getnote => note;

  Future<void> pushDataAdjustmentOut() async {
    await pushWorkerDataAdjustmentOut(
      collection: "transaction_adjustment_out",
      id: invoice,
      dataAdjustmentOut: convertToMapAdjustmentOut(
        data: ModelTransactionAdjustmentOut(
          itemInvoice: itemInvoice,
          itemName: itemName,
          invoice: invoice,
          idBranch: idBranch,
          date: date,
          qty_out_after: qty_out_after,
          qty_out_before: qty_out_before,
          note: note,
        ),
      ),
    );
  }

  @override
  List<Object?> get props => [
    itemInvoice,
    itemName,
    invoice,
    idBranch,
    date,
    qty_out_after,
    qty_out_before,
    note,
  ];
}
