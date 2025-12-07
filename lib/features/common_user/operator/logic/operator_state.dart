import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_user.dart';

class OperatorState {}

class OperatorInitial extends OperatorState {}

class OperatorLoaded extends OperatorState with EquatableMixin {
  final List<ModelBranch>? dataBranch;
  final List<ModelUser> dataUser;
  final List<ModelUser> filteredData;
  final String? idBranch;
  final RoleType? filterRoleUser;
  final bool filterStatusUser;
  final ModelUser? selectedData;
  final bool isEdit;
  final bool selectedStatus;
  final int selectedRole;
  final Map<Permission, bool> selectedPermission;

  OperatorLoaded({
    this.selectedPermission = const {},
    this.selectedStatus = true,
    this.selectedRole = 2,
    this.dataBranch,
    this.dataUser = const [],
    this.filteredData = const [],
    this.idBranch,
    this.filterRoleUser,
    this.filterStatusUser = true,
    this.isEdit = false,
    this.selectedData,
  });

  OperatorLoaded copyWith({
    List<ModelBranch>? dataBranch,
    List<ModelUser>? dataOperator,
    List<ModelUser>? filteredData,
    String? idBranch,
    RoleType? filterRoleUser,
    bool? filterStatusUser,
    ModelUser? selectedData,
    bool? isEdit,
    bool? selectedStatus,
    int? selectedRole,
    Map<Permission, bool>? selectedPermission,
  }) {
    return OperatorLoaded(
      selectedPermission: selectedPermission ?? this.selectedPermission,
      isEdit: isEdit ?? this.isEdit,
      dataBranch: dataBranch ?? this.dataBranch,
      dataUser: dataOperator ?? this.dataUser,
      filteredData: filteredData ?? this.filteredData,
      idBranch: idBranch ?? this.idBranch,
      filterRoleUser: filterRoleUser ?? this.filterRoleUser,
      filterStatusUser: filterStatusUser ?? this.filterStatusUser,
      selectedData: selectedData ?? this.selectedData,
      selectedRole: selectedRole ?? this.selectedRole,
      selectedStatus: selectedStatus ?? this.selectedStatus,
    );
  }

  @override
  List<Object?> get props => [
    selectedPermission,
    isEdit,
    dataBranch,
    filterStatusUser,
    dataUser,
    filteredData,
    idBranch,
    filterRoleUser,
    selectedData,
    selectedRole,
    selectedStatus,
  ];
}
