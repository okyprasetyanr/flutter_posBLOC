import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/partner/logic/partner_event.dart';
import 'package:flutter_pos/features/partner/logic/partner_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';

class PartnerBloc extends Bloc<PartnerEvent, PartnerState> {
  DataUserRepositoryCache repo;
  PartnerBloc(this.repo) : super(PartnerInitial()) {
    on<PartnerGetData>(_onGetData);
    on<PartnerSelectedCustomer>(_onSelectedCustomer);
    on<PartnerUploadDataPartner>(_onUploadataPartner);
    on<PartnerStatusPartner>(_onPartnerStatusPartner);
    on<PartnerResetSelectedPartner>(_onPartnerResetSelectedPartner);
    on<PartnerSelectedBranch>(_onPartnerSelectedBranch);
  }

  FutureOr<void> _onGetData(PartnerGetData event, Emitter<PartnerState> emit) {
    emit(PartnerLoading());
    final currentState = state is PartnerLoaded
        ? state as PartnerLoaded
        : PartnerLoaded();

    final branch = currentState.dataBranch ?? repo.getBranch();
    final idBranch =
        event.idBranch ??
        currentState.selectedIdBranch ??
        branch.first.getidBranch;

    debugPrint("Log PartnerBloc: isCustomer: ${event.isCustomer}");
    debugPrint("Log PartnerBloc: GetData: $idBranch");

    final partner;
    if (event.isCustomer) {
      partner = repo.getCustomer(idBranch);
      debugPrint("Log PartnerBloc: Customer: $partner");
    } else {
      partner = repo.getSupplier(idBranch);
      debugPrint("Log PartnerBloc: Supplier: $partner");
    }

    emit(
      currentState.copyWith(
        dataPartner: partner,
        selectedIdBranch: idBranch,
        dataBranch: branch,
        isCustomer: event.isCustomer,
      ),
    );
  }

  FutureOr<void> _onSelectedCustomer(
    PartnerSelectedCustomer event,
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
    await event.partner.pushDataPartner();
    add(PartnerResetSelectedPartner());
  }

  FutureOr<void> _onPartnerStatusPartner(
    event,
    Emitter<PartnerState> emit,
  ) async {
    add(PartnerResetSelectedPartner());

    final currentState = state;
    if (currentState is PartnerLoaded) {
      final isCustomer = !currentState.isCustomer;
      emit(currentState.copyWith(isCustomer: isCustomer));

      debugPrint("Log PartnerBloc: isCustomer: $isCustomer");
      add(PartnerGetData(isCustomer: isCustomer));
    }
  }

  FutureOr<void> _onPartnerResetSelectedPartner(
    PartnerResetSelectedPartner event,
    Emitter<PartnerState> emit,
  ) {
    final currentState = state;
    if (currentState is PartnerLoaded) {
      emit(currentState.copyWith(selectedPartner: null));
    }
  }

  FutureOr<void> _onPartnerSelectedBranch(
    PartnerSelectedBranch event,
    Emitter<PartnerState> emit,
  ) {
    final currentState = state;
    if (currentState is PartnerLoaded) {
      emit(currentState.copyWith(selectedIdBranch: event.selectedIdBranch));
      add(PartnerGetData(idBranch: event.selectedIdBranch));
      debugPrint(
        "Log PartnerBloc: SelectedIdBranch: ${event.selectedIdBranch}",
      );
    }
  }
}
