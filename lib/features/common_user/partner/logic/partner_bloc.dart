import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_event.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/data_user/isar/action/delete/delete_data_isar_by.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_by.dart';
import 'package:flutter_pos/features/data_user/isar/action/save_update_data_isar.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/request/delete_data.dart';
import 'package:uuid/uuid.dart';

class PartnerBloc extends Bloc<PartnerEvent, PartnerState> {
  DataUserRepositoryCache repoCache;
  PartnerBloc(this.repoCache) : super(PartnerLoaded()) {
    on<PartnerGetData>(_onGetData);
    on<PartnerSelectedPartner>(_onSelectedPartner);
    on<PartnerUploadDataPartner>(_onUploadataPartner);
    on<PartnerStatusPartner>(_onStatusPartner);
    on<PartnerResetSelectedPartner>(_onResetSelectedPartner);
    on<PartnerSelectedBranch>(_onSelectedBranch);
    on<PartnerDeletePartner>(_onDeletePartner);
    on<PartnerSearch>(_onSearch, transformer: debounceRestartable());
  }

  Future<void> _onGetData(
    PartnerGetData event,
    Emitter<PartnerState> emit,
  ) async {
    final currentState = state is PartnerLoaded
        ? state as PartnerLoaded
        : PartnerLoaded();

    final branch = currentState.dataBranch ?? await getAllListBranchIsar();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? branch.first.getidBranch;
    final isCustomer = event.isCustomer ?? currentState.isCustomer;
    List<ModelPartner> partner = isCustomer
        ? await getCustomerIsar(idBranch)
        : await getSupplierIsar(idBranch);

    partner.sort((a, b) => a.getnamePartner.compareTo(b.getnamePartner));
    emit(
      currentState.copyWith(
        filteredPartner: partner,
        dataPartner: partner,
        idBranch: idBranch,
        dataBranch: branch,
        isCustomer: isCustomer,
      ),
    );
  }

  FutureOr<void> _onSelectedPartner(
    PartnerSelectedPartner event,
    Emitter<PartnerState> emit,
  ) {
    final currentState = state;
    if (currentState is PartnerLoaded) {
      emit(currentState.copyWith(selectedPartner: event.selectedPartner));
    }
  }

  Future<void> _onUploadataPartner(
    PartnerUploadDataPartner event,
    Emitter<PartnerState> emit,
  ) async {
    final currentState = state;
    if (currentState is PartnerLoaded) {
      final idPartner =
          currentState.selectedPartner?.getidPartner ??
          Uuid().v4().substring(0, 8);
      final partner = ModelPartner(
        idBranchPartner: currentState.idBranch!,
        idPartner: idPartner,
        namePartner: event.name,
        phonePartner: event.phone,
        emailPartner: event.email,
        balancePartner: 0,
        typePartner: currentState.isCustomer
            ? PartnerType.customer
            : PartnerType.supplier,
        date: parseDate(date: DateTime.now()),
      );

      currentState.isCustomer
          ? await saveCustomer_Isar(partner)
          : await saveSupplier_Isar(partner);
      await partner.pushDataPartner();

      add(PartnerResetSelectedPartner());
      add(PartnerGetData());
    }
  }

  FutureOr<void> _onStatusPartner(
    PartnerStatusPartner event,
    Emitter<PartnerState> emit,
  ) async {
    final currentState = state;
    if (currentState is PartnerLoaded) {
      final isCustomer = event.isCustomer ?? !currentState.isCustomer;
      emit(currentState.copyWith(isCustomer: isCustomer));

      debugPrint("Log PartnerBloc: isCustomer: $isCustomer");
      add(PartnerGetData(isCustomer: isCustomer));
    }
  }

  FutureOr<void> _onResetSelectedPartner(
    PartnerResetSelectedPartner event,
    Emitter<PartnerState> emit,
  ) {
    final currentState = state;
    if (currentState is PartnerLoaded) {
      emit(currentState.copyWith(selectedPartner: null));
    }
  }

  FutureOr<void> _onSelectedBranch(
    PartnerSelectedBranch event,
    Emitter<PartnerState> emit,
  ) {
    final currentState = state;
    if (currentState is PartnerLoaded) {
      emit(currentState.copyWith(idBranch: event.idBranch));
      add(
        PartnerGetData(
          idBranch: event.idBranch,
          isCustomer: currentState.isCustomer,
        ),
      );
      debugPrint("Log PartnerBloc: SelectedIdBranch: ${event.idBranch}");
    }
  }

  Future<void> _onDeletePartner(
    PartnerDeletePartner event,
    Emitter<PartnerState> emit,
  ) async {
    await deleteDataPartner(event.id);
    final currentState = state;
    if (currentState is PartnerLoaded) {
      await deletePartnerById_Isar(event.id);
      final dataPartner = event.type.name == PartnerType.customer
          ? await getCustomerIsar(currentState.idBranch!)
          : await getSupplierIsar(currentState.idBranch!);
      dataPartner.sort((a, b) => a.getnamePartner.compareTo(b.getnamePartner));
      emit(currentState.copyWith(dataPartner: dataPartner));
    }
  }

  FutureOr<void> _onSearch(PartnerSearch event, Emitter<PartnerState> emit) {
    final currentState = state as PartnerLoaded;
    final filteredPartner = event.search.isNotEmpty
        ? currentState.dataPartner!
              .where(
                (element) => element.getnamePartner.toLowerCase().contains(
                  event.search.toLowerCase(),
                ),
              )
              .toList()
        : currentState.dataPartner!.toList();
    filteredPartner.sort(
      (a, b) => a.getnamePartner.compareTo(b.getnamePartner),
    );
    emit(currentState.copyWith(filteredPartner: filteredPartner));
  }
}
