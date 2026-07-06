import 'package:flutter_pos/model_data/model_item_ordered_batch.dart';

double totalQty(List<ModelItemOrderedBatch> batches) {
  return batches.fold(0.0, (sum, e) => sum + e.getqty_item);
}
