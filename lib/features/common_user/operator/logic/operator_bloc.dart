import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/connection/authentication_account.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/request/delete_data.dart';
import 'package:flutter_pos/common_widget/widget_custom_spin_kit.dart';

class OperatorBloc extends Bloc<OperatorEvent, OperatorState> {
  DataUserRepositoryCache repoCache;
  OperatorBloc(this.repoCache) : super(OperatorInitial()) {
    on<OperatorGetData>(_onGetData);
    on<OperatorFilterOperator>(_onFilterOperator);
    on<OperatorPermission>(_onPermission);
    on<OperatorRemoveData>(_onRemove);
    on<OperatorUploadData>(_onUpload);
    on<OperatorSelectedData>(_onSelectedData);
    on<OperatorResetPassword>(_onResetPassword);
    on<OperatorSearch>(_onSearch, transformer: debounceRestartable());
  }

  List<ModelUser> filterData({
    required List<ModelUser> dataUser,
    RoleType? roleUser,
    bool? statusUser,
    String? idBranch,
  }) {
    if (idBranch == null) {
      final currentState = state as OperatorLoaded;
      idBranch == currentState.idBranch;
    }

    debugPrint("Log OperatorBloc: $roleUser , $statusUser, $idBranch");
    return dataUser.where((element) {
      if (statusUser != null) {
        final byStatus = element.getstatusUser == statusUser;
        if (!byStatus) return false;
      }
      if (roleUser != null && roleUser.id != 0) {
        final byRole = element.getRoleUser == roleUser.id;
        if (!byRole) return false;
      }
      final byIdBranch = element.getIdBranchUser == idBranch;
      if (!byIdBranch) return false;

      return true;
    }).toList();
  }

  Future<void> _onGetData(
    OperatorGetData event,
    Emitter<OperatorState> emit,
  ) async {
    final currentState = state is OperatorLoaded
        ? state as OperatorLoaded
        : OperatorLoaded();

    final dataBranch = currentState.dataBranch ?? repoCache.getBranch();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;
    final roleUser = event.roleUser ?? currentState.filterRoleUser;
    final statusUser = event.statusUser ?? currentState.filterStatusUser;
    final dataUser = await repoCache.dataUser;
    final filteredData = filterData(
      idBranch: idBranch,
      dataUser: dataUser,
      roleUser: roleUser,
      statusUser: statusUser,
    );
    emit(
      OperatorLoaded(
        dataBranch: dataBranch,
        idBranch: idBranch,
        dataUser: dataUser,
        filteredData: filteredData,
        filterRoleUser: roleUser,
        filterStatusUser: statusUser,
        selectedPermission: {
          for (final permission in Permission.values) permission: false,
        },
      ),
    );
  }

  FutureOr<void> _onFilterOperator(
    OperatorFilterOperator event,
    Emitter<OperatorState> emit,
  ) {
    final currentState = state as OperatorLoaded;
    final roleUser = event.roleUser ?? currentState.filterRoleUser;
    final statusUser = event.statusUser ?? currentState.filterStatusUser;
    final filteredData = filterData(
      dataUser: currentState.dataUser,
      roleUser: roleUser,
      statusUser: statusUser,
    );

    emit(
      currentState.copyWith(
        filteredData: filteredData,
        filterRoleUser: roleUser,
        filterStatusUser: statusUser,
      ),
    );
  }

  FutureOr<void> _onSearch(OperatorSearch event, Emitter<OperatorState> emit) {
    final currentState = state as OperatorLoaded;
    final roleUser = currentState.filterRoleUser;
    final statusUser = currentState.filterStatusUser;
    final dataFiltered = currentState.dataUser.where(
      (element) => element.getNameUser.toLowerCase().contains(event.search),
    );
    final filteredData = dataFiltered
        .where(
          (element) =>
              element.getstatusUser == statusUser &&
              RoleType.values.contains(roleUser),
        )
        .toList();

    emit(currentState.copyWith(filteredData: filteredData));
  }

  FutureOr<void> _onPermission(
    OperatorPermission event,
    Emitter<OperatorState> emit,
  ) {}

  FutureOr<void> _onRemove(
    OperatorRemoveData event,
    Emitter<OperatorState> emit,
  ) {
    final selectedData = event.data.getIdUser;
    deleteDataUser(selectedData!);
    final dataOperator = repoCache.dataUser;
    final indexOperator = dataOperator.indexWhere(
      (element) => element.getIdUser == selectedData,
    );
    if (indexOperator != -1) {
      dataOperator.removeAt(indexOperator);
    }

    add(OperatorGetData());
  }

  FutureOr<void> _onSelectedData(
    OperatorSelectedData event,
    Emitter<OperatorState> emit,
  ) {
    final currentState = state as OperatorLoaded;
    final selectedData = event.selectedData;
    emit(
      currentState.copyWith(
        selectedData: event.selectedData,
        isEdit: event.selectedData != null ? true : false,
        selectedRole: event.selectedRole ?? selectedData!.getRoleUser,
        selectedStatus: event.selectedStatus ?? selectedData!.getstatusUser,
        selectedPermission:
            event.selectedPermission ?? selectedData!.getPermissionsUser,
      ),
    );
  }

  Future<void> _onUpload(
    OperatorUploadData event,
    Emitter<OperatorState> emit,
  ) async {
    final context = event.context;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Center(child: customSpinKit(color: Colors.white, size: 30));
      },
    );
    final currentState = state as OperatorLoaded;
    final dataOperator = repoCache.dataUser;
    ModelUser data = ModelUser(
      idUser: currentState.selectedData?.idUser,
      permissionsUser: currentState.selectedPermission,
      nameUser: event.name,
      idBranchUser: currentState.idBranch!,
      roleUser: currentState.selectedRole,
      emailUser: event.email,
      phoneUser: event.phone,
      statusUser: currentState.selectedStatus,
      noteUser: event.note,
    );
    final indexOperator = dataOperator.indexWhere(
      (element) => element.getIdUser == currentState.selectedData?.getIdUser,
    );
    if (indexOperator != -1) {
      dataOperator[indexOperator] = data;
    } else {
      final credential = await authenticatorAccount(
        context: context,
        email: data.getEmailUser,
        password: event.password,
        signup: true,
      );

      if (credential == null) return Navigator.of(context).pop();
      final uid = credential.user!.uid;

      data = data.copyWith(idBranchUser: currentState.idBranch, idUser: uid);
    }
    debugPrint("Log OperatorBloc: upload: ${data}");
    await data.pushDataUser();
    add(OperatorGetData());
    Navigator.of(context).pop();
  }

  FutureOr<void> _onResetPassword(
    OperatorResetPassword event,
    Emitter<OperatorState> emit,
  ) {}
}
