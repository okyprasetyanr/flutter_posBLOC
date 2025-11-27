import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/operator/logic/operator_event.dart';
import 'package:flutter_pos/features/operator/logic/operator_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_operator.dart';
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
    final indexRole = event.indexRole ?? currentState.indexRole;
    final indexStatus = event.indexStatus ?? currentState.indexStatus;
    final dataOperator = repoCache.dataOperator;
    final filteredData = dataOperator
        .where(
          (element) =>
              element.getroleOperator == fromIdRoleType(indexRole) &&
                  indexStatus == 0
              ? element.getstatusOperator
              : !element.getstatusOperator,
        )
        .toList();
    emit(
      OperatorLoaded(
        dataBranch: dataBranch,
        idBranch: idBranch,
        dataOperator: dataOperator,
        filteredData: filteredData,
        indexRole: indexRole,
        indexStatus: indexStatus,
      ),
    );
  }

  FutureOr<void> _onFilterOperator(
    OperatorFilterOperator event,
    Emitter<OperatorState> emit,
  ) {
    final currentState = state as OperatorLoaded;
    final indexRole = event.indexRole ?? currentState.indexRole;
    final indexStatus = event.indexStatus ?? currentState.indexStatus;
    final filteredData = currentState.dataOperator.where((element) {
      if (event.indexStatus != null) {
        final byStatus = element.getstatusOperator == statusData[indexStatus];
        if (!byStatus) return false;
      }
      if (event.indexRole != null) {
        final byRole = element.getroleOperator == fromIdRoleType(indexRole);
        if (!byRole) return false;
      }

      return true;
    }).toList();

    emit(
      currentState.copyWith(
        filteredData: filteredData,
        indexRole: indexRole,
        indexStatus: indexStatus,
      ),
    );
  }

  FutureOr<void> _onSearch(OperatorSearch event, Emitter<OperatorState> emit) {
    final currentState = state as OperatorLoaded;
    final indexRole = currentState.indexRole;
    final indexStatus = currentState.indexStatus;
    final dataFiltered = currentState.dataOperator.where(
      (element) => element.getnameOperator.toLowerCase().contains(event.search),
    );
    final filteredData = dataFiltered
        .where(
          (element) =>
              element.getstatusOperator == statusData[indexStatus] &&
              element.getroleOperator == fromIdRoleType(indexRole),
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
    final currentState = state as OperatorLoaded;
    deleteDataOperator(currentState.selectedData!.getidOperator!);
    final dataOperator = repoCache.dataOperator;
    final indexOperator = dataOperator.indexWhere(
      (element) =>
          element.idOperator == currentState.selectedData!.getidOperator,
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
    ModelOperator data = event.data;
    final indexOperator = dataOperator.indexWhere(
      (element) =>
          element.idOperator == currentState.selectedData?.getidOperator,
    );
    if (indexOperator != -1) {
      dataOperator[indexOperator] = event.data;
    } else {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: data.getemailOperator,
            password: event.password,
          );

      final uid = credential.user!.uid;

      data = data.copyWith(idOperator: uid, uidOwner: UserSession.getUidUser());
    }

    data.pushDataOperator();
    add(OperatorGetData());
  }

  FutureOr<void> _onResetPassword(
    OperatorResetPassword event,
    Emitter<OperatorState> emit,
  ) {}
}
