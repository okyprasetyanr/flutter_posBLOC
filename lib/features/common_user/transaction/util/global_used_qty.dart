import 'package:flutter_pos/features/common_user/transaction/logic/transaction_state.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';

double getGlobalUsedQty(
  String idItem,
  String idOrdered,
  String stockBatchId, {
  required TransactionLoaded state,
  List<ModelItemOrdered>? currentListContext,
}) {
  final sourceList = currentListContext ?? state.itemOrdered;

  return sourceList
      .where((e) => e.getidItem == idItem)
      .where((b) => b.getidOrdered != idOrdered)
      .expand((e) => e.getitemOrderedBatch)
      .where((batch) => batch.getid_Ordered == stockBatchId)
      .fold(0.0, (sum, b) => sum + b.getqty_item);
}
