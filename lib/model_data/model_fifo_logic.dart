import 'package:flutter_pos/model_data/model_item_ordered_batch.dart';

class ModelFIFOLogic {
  final double? qty, price, subTotal;
  final List<ModelItemOrderedBatch> batch;

  ModelFIFOLogic({
    required this.qty,
    required this.price,
    required this.batch,
    required this.subTotal,
  });
}
