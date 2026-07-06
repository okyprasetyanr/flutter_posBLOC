import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/inventory/model/model_item.dart';
import 'package:flutter_pos/features/batch/model/model_item_batch.dart';

void applyFifoPriceToItem({
  required List<ModelItem> listItem,
  required Map<String, List<ModelItemBatch>> fifoMap,
}) {
  for (int i = 0; i < listItem.length; i++) {
    final item = listItem[i];
    final fifoBatches = fifoMap[item.getidItem];
    if (fifoBatches == null || fifoBatches.isEmpty) continue;
    devLog(
      "Log FifoLogic: applyFifoPriceToItem: ${fifoBatches.last.getpriceItemFinal}",
    );

    listItem[i] = item.copyWith(
      priceItemByBatch: fifoBatches.first.getpriceItemFinal,
      priceItemBuyByBatch: fifoBatches.last.getpriceItemBuy,
    );
  }
}
