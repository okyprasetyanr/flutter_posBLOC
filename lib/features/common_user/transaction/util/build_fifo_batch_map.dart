import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';

Map<String, List<ModelItemBatch>> buildFifoBatchMap({
  required List<ModelItemBatch> dataItemBatch,
}) {
  final Map<String, List<ModelItemBatch>> fifoMap = {};
  final Map<String, List<ModelItemBatch>> allBatchMap = {};

  dataItemBatch.sort((a, b) => b.getdateBuy.compareTo(a.getdateBuy));

  for (final batch in dataItemBatch) {
    allBatchMap.putIfAbsent(batch.getidItem, () => []);
    allBatchMap[batch.getidItem]!.add(batch);

    final availableQty = batch.getqtyItem_in - batch.getqtyItem_out;
    if (availableQty <= 0) continue;

    fifoMap.putIfAbsent(batch.getidItem, () => []);
    fifoMap[batch.getidItem]!.add(batch);
  }

  fifoMap.forEach((_, batches) {
    sortStockMode(batches);
  });

  allBatchMap.forEach((idItem, batches) {
    if (!fifoMap.containsKey(idItem)) {
      final lastBatch = batches.last;
      fifoMap[idItem] = [lastBatch];
    }
  });

  return fifoMap;
}
