import 'package:flutter_pos/model_data/model_item_ordered_batch.dart';

class ModelFIFOLogic {
  final double? qty, price, subTotal, priceBuy;
  final List<ModelItemOrderedBatch> batch;

  ModelFIFOLogic({
    required this.priceBuy,
    required this.qty,
    required this.price,
    required this.batch,
    required this.subTotal,
  });
}
