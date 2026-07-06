import 'package:flutter_pos/model_data/model_item_ordered_batch.dart';

double calculateSubTotalFromBatch(
  List<ModelItemOrderedBatch> batches,
  int discount,
) {
  final gross = batches.fold<double>(
    0.0,
    (sum, element) => sum + (element.getqty_item * element.getprice_item),
  );

  if (discount <= 0) return gross;

  return gross - (gross * discount / 100);
}
