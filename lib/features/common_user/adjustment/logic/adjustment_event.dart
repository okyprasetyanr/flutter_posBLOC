import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_item.dart';

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

class AdjustmentSelectedBatch extends AdjustmentEvent {
  final ModelBatch selectedBatch;

  AdjustmentSelectedBatch({required this.selectedBatch});
}

class AdjustmentAdjustData extends AdjustmentEvent {}

class AdjustmentUploadData extends AdjustmentEvent {
  final ModelBatch updateData;

  AdjustmentUploadData({required this.updateData});
}

class AdjustmentSearchData extends AdjustmentEvent {
  final String? text;

  AdjustmentSearchData({required this.text});
}

class AdjustmentFilterByCateogry extends AdjustmentEvent {
  final ModelCategory selectedCategory;

  AdjustmentFilterByCateogry({required this.selectedCategory});
}
