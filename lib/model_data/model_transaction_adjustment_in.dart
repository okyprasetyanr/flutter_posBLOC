import 'package:equatable/equatable.dart';
import 'package:flutter_pos/from_and_to_map/convert_to_map.dart';
import 'package:flutter_pos/request/push_data.dart';

class ModelTransactionAdjustmentIn extends Equatable {
  final String invoice;
  final String idBranch;
  final String itemInvoice;
  final String itemName;
  final DateTime date;
  final double? qty_in_after;
  final double? qty_in_before;
  final double? sellPriceAfter;
  final double? buyPriceAfter;
  final double? sellPriceBefore;
  final double? buyPriceBefore;
  final DateTime? expiredDateAfter;
  final DateTime? expiredDateBefore;
  final String note;

  ModelTransactionAdjustmentIn({
    required this.invoice,
    required this.idBranch,
    required this.itemInvoice,
    required this.itemName,
    required this.date,
    required this.qty_in_after,
    required this.qty_in_before,
    required this.sellPriceAfter,
    required this.buyPriceAfter,
    required this.sellPriceBefore,
    required this.buyPriceBefore,
    required this.expiredDateAfter,
    required this.expiredDateBefore,
    required this.note,
  });

  String get getinvoice => invoice;
  String get getidBranch => idBranch;
  String get getitemName => itemName;
  String get getitemInvoice => itemInvoice;
  DateTime get getdate => date;
  double? get getqty_in_after => qty_in_after;
  double? get getsellPriceAfter => sellPriceAfter;
  double? get getbuyPriceAfter => buyPriceAfter;
  DateTime? get getexpiredDateAfter => expiredDateAfter;
  double? get getqty_in_before => qty_in_before;
  double? get getsellPriceBefore => sellPriceBefore;
  double? get getbuyPriceBefore => buyPriceBefore;
  DateTime? get getexpiredDateBefore => expiredDateBefore;
  String get getnote => note;

  Future<void> pushDataAdjustmentIn() async {
    await pushWorkerDataAdjustmentIn(
      collection: "transaction_adjustment_in",
      id: invoice,
      dataAdjustmentIn: convertToMapAdjustmentIn(
        data: ModelTransactionAdjustmentIn(
          itemInvoice: itemInvoice,
          itemName: itemName,
          invoice: invoice,
          idBranch: idBranch,
          buyPriceAfter: buyPriceAfter,
          buyPriceBefore: buyPriceBefore,
          date: date,
          expiredDateAfter: expiredDateAfter,
          expiredDateBefore: expiredDateBefore,
          note: note,
          qty_in_after: qty_in_after,
          qty_in_before: qty_in_before,
          sellPriceAfter: sellPriceAfter,
          sellPriceBefore: sellPriceBefore,
        ),
      ),
    );
  }

  @override
  List<Object?> get props => [
    invoice,
    idBranch,
    date,
    qty_in_after,
    qty_in_before,
    sellPriceAfter,
    buyPriceAfter,
    sellPriceBefore,
    buyPriceBefore,
    expiredDateAfter,
    expiredDateBefore,
    note,
  ];
}
