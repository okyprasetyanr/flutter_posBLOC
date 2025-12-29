import 'package:flutter/material.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/model_data/model_user.dart';

class OperatorEvent {}

class OperatorGetData extends OperatorEvent {
  final String? idBranch;
  final RoleType? roleUser;
  final StatusData? statusUser;

  OperatorGetData({this.idBranch, this.roleUser, this.statusUser});
}

class OperatorFilterOperator extends OperatorEvent {
  final RoleType? roleUser;
  final StatusData? statusUser;

  OperatorFilterOperator({this.roleUser, this.statusUser});
}

class OperatorSelectedData extends OperatorEvent {
  final ModelUser? selectedData;
  final RoleType? selectedRole;
  final StatusData? selectedStatus;
  final Map<Permission, bool>? selectedPermission;
  OperatorSelectedData({
    this.selectedData,
    this.selectedRole,
    this.selectedStatus,
    this.selectedPermission,
  });
}

class OperatorSearch extends OperatorEvent {
  final String search;

  OperatorSearch({required this.search});
}

class OperatorUploadData extends OperatorEvent {
  final BuildContext context;
  final String password;
  final String name;
  final String email;
  final String phone;
  final String note;

  OperatorUploadData({
    required this.context,
    required this.password,
    required this.name,
    required this.email,
    required this.phone,
    required this.note,
  });
}

class OperatorRemoveData extends OperatorEvent {
  final ModelUser data;

  OperatorRemoveData({required this.data});
}

class OperatorResetPassword extends OperatorEvent {
  final bool resetDone;

  OperatorResetPassword({required this.resetDone});
}
