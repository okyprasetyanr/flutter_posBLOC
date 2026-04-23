import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';

class AdjustmentEvent {}

class AdjustmentGetData extends AdjustmentEvent {
  final bool? changeMode;
  final String? idBranch;

  AdjustmentGetData({this.changeMode, this.idBranch});
}

class AdjustmentSelectedItem extends AdjustmentEvent {
  final ModelItem selectedItem;

  AdjustmentSelectedItem({required this.selectedItem});
}

class AdjustmentSelectedItemBatch extends AdjustmentEvent {
  final ModelItemBatch selectedItemBatch;

  AdjustmentSelectedItemBatch({required this.selectedItemBatch});
}

class AdjustmentResetSelectedData extends AdjustmentEvent {}

class AdjustmentAdjustData extends AdjustmentEvent {
  final String? sellPrice;
  final String? buyPrice;
  final bool? adjustQty;

  AdjustmentAdjustData({this.sellPrice, this.buyPrice, this.adjustQty});
}

class AdjustmentUploadData extends AdjustmentEvent {
  final String? dateExpired;

  AdjustmentUploadData({required this.dateExpired});
}

class AdjustmentSearchData extends AdjustmentEvent {
  final String? text;

  AdjustmentSearchData({required this.text});
}

class AdjustmentFilterByCateogry extends AdjustmentEvent {
  final ModelCategory selectedCategory;

  AdjustmentFilterByCateogry({required this.selectedCategory});
}
