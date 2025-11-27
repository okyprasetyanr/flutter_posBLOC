import 'package:flutter_pos/model_data/model_operator.dart';

class OperatorEvent {}

class OperatorGetData extends OperatorEvent {
  final String? idBranch;
  final int? indexRole;
  final int? indexStatus;

  OperatorGetData({this.idBranch, this.indexRole, this.indexStatus});
}

class OperatorFilterOperator extends OperatorEvent {
  final int? indexRole;
  final int? indexStatus;

  OperatorFilterOperator(this.indexRole, this.indexStatus);
}

class OperatorSelectedData extends OperatorEvent {
  final ModelOperator selectedData;

  OperatorSelectedData({required this.selectedData});
}

class OperatorSearch extends OperatorEvent {
  final String search;

  OperatorSearch({required this.search});
}

class OperatorUploadData extends OperatorEvent {
  final ModelOperator data;
  final String password;
  OperatorUploadData({required this.data, required this.password});
}

class OperatorRemoveData extends OperatorEvent {}

class OperatorPermission extends OperatorEvent {}

class OperatorResetPassword extends OperatorEvent {}
