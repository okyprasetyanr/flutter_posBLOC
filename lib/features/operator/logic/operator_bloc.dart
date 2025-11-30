import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/operator/logic/operator_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/request/delete_data.dart';

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

  FutureOr<void> _onGetData(
    OperatorGetData event,
    Emitter<OperatorState> emit,
  ) {
    final currentState = state is OperatorLoaded
        ? state as OperatorLoaded
        : OperatorLoaded();

    final dataBranch = currentState.dataBranch ?? repoCache.dataBranch;
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? dataBranch.first.getidBranch;
    final indexRole = event.roleUser ?? currentState.roleUser;
    final statusUser = event.statusUser ?? currentState.statusUser;
    final dataOperator = repoCache.dataOperator;
    final filteredData = dataOperator
        .where(
          (element) =>
              RoleType.values.contains(element.getRoleUser) && statusUser == 0
              ? element.getstatusUser
              : !element.getstatusUser,
        )
        .toList();
    emit(
      OperatorLoaded(
        dataBranch: dataBranch,
        idBranch: idBranch,
        dataOperator: dataOperator,
        filteredData: filteredData,
        roleUser: indexRole,
        statusUser: statusUser,
      ),
    );
  }

  FutureOr<void> _onFilterOperator(
    OperatorFilterOperator event,
    Emitter<OperatorState> emit,
  ) {
    final currentState = state as OperatorLoaded;
    final roleUser = event.roleUser ?? currentState.roleUser;
    final statusUser = event.statusUser ?? currentState.statusUser;
    final filteredData = currentState.dataOperator.where((element) {
      if (event.statusUser != null) {
        final byStatus = element.getstatusUser == statusUser;
        if (!byStatus) return false;
      }
      if (event.roleUser != null) {
        final byRole = RoleType.values.contains(element.getRoleUser);
        if (!byRole) return false;
      }

      return true;
    }).toList();

    emit(
      currentState.copyWith(
        filteredData: filteredData,
        roleUser: roleUser,
        statusUser: statusUser,
      ),
    );
  }

  FutureOr<void> _onSearch(OperatorSearch event, Emitter<OperatorState> emit) {
    final currentState = state as OperatorLoaded;
    final roleUser = currentState.roleUser;
    final statusUser = currentState.statusUser;
    final dataFiltered = currentState.dataOperator.where(
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
    deleteDataOperator(selectedData!);
    final dataOperator = repoCache.dataOperator;
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
    emit(currentState.copyWith(selectedData: event.selectedData));
  }

  Future<void> _onUpload(
    OperatorUploadData event,
    Emitter<OperatorState> emit,
  ) async {
    final currentState = state as OperatorLoaded;
    final dataOperator = repoCache.dataOperator;
    ModelUser data = event.data;
    final indexOperator = dataOperator.indexWhere(
      (element) => element.getIdUser == currentState.selectedData?.getIdUser,
    );
    if (indexOperator != -1) {
      dataOperator[indexOperator] = event.data;
    } else {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: data.getEmailUser,
            password: event.password,
          );

      final uid = credential.user!.uid;

      data = data.copyWith(idBranchUser: uid);
    }

    data.pushDataUser();
    add(OperatorGetData());
  }

  FutureOr<void> _onResetPassword(
    OperatorResetPassword event,
    Emitter<OperatorState> emit,
  ) {}
}
