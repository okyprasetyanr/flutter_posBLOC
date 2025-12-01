import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_user.dart';

class OperatorState {}

class OperatorInitial extends OperatorState {}

class OperatorLoaded extends OperatorState with EquatableMixin {
  final List<ModelBranch>? dataBranch;
  final List<ModelUser> dataOperator;
  final List<ModelUser> filteredData;
  final String? idBranch;
  final RoleType? roleUser;
  final bool statusUser;
  final ModelUser? selectedData;

  OperatorLoaded({
    this.dataBranch,
    this.dataOperator = const [],
    this.filteredData = const [],
    this.idBranch,
    this.roleUser,
    this.statusUser = false,
    this.selectedData,
  });

  OperatorLoaded copyWith({
    List<ModelBranch>? dataBranch,
    List<ModelUser>? dataOperator,
    List<ModelUser>? filteredData,
    String? idBranch,
    RoleType? roleUser,
    bool? statusUser,
    ModelUser? selectedData,
  }) {
    return OperatorLoaded(
      dataBranch: dataBranch ?? this.dataBranch,
      dataOperator: dataOperator ?? this.dataOperator,
      filteredData: filteredData ?? this.filteredData,
      idBranch: idBranch ?? this.idBranch,
      roleUser: roleUser ?? this.roleUser,
      statusUser: statusUser ?? this.statusUser,
      selectedData: selectedData ?? this.selectedData,
    );
  }

  @override
  List<Object?> get props => [
    dataBranch,
    statusUser,
    dataOperator,
    filteredData,
    idBranch,
    roleUser,
    selectedData,
  ];
}
