import 'package:flutter/material.dart';
import 'package:flutter_pos/model_data/model_user.dart';

class OperatorEvent {}

class OperatorGetData extends OperatorEvent {
  final String? idBranch;
  final RoleType? roleUser;
  final bool? statusUser;

  OperatorGetData({this.idBranch, this.roleUser, this.statusUser});
}

class OperatorFilterOperator extends OperatorEvent {
  final RoleType? roleUser;
  final bool? statusUser;

  OperatorFilterOperator({this.roleUser, this.statusUser});
}

class OperatorSelectedData extends OperatorEvent {
  final ModelUser selectedData;

  OperatorSelectedData({required this.selectedData});
}

class OperatorSearch extends OperatorEvent {
  final String search;

  OperatorSearch({required this.search});
}

class OperatorUploadData extends OperatorEvent {
  final BuildContext context;
  final ModelUser data;
  final String password;
  OperatorUploadData({
    required this.data,
    required this.password,
    required this.context,
  });
}

class OperatorRemoveData extends OperatorEvent {
  final ModelUser data;

  OperatorRemoveData({required this.data});
}

class OperatorPermission extends OperatorEvent {}

class OperatorResetPassword extends OperatorEvent {}
