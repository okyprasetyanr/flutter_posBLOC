import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/partner/logic/partner_event.dart';
import 'package:flutter_pos/features/partner/logic/partner_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/request/delete_data.dart';

class PartnerBloc extends Bloc<PartnerEvent, PartnerState> {
  DataUserRepositoryCache repoCache;
  PartnerBloc(this.repoCache) : super(PartnerInitial()) {
    on<PartnerGetData>(_onGetData);
    on<PartnerSelectedPartner>(_onSelectedPartner);
    on<PartnerUploadDataPartner>(_onUploadataPartner);
    on<PartnerStatusPartner>(_onStatusPartner);
    on<PartnerResetSelectedPartner>(_onResetSelectedPartner);
    on<PartnerSelectedBranch>(_onSelectedBranch);
    on<PartnerDeletePartner>(_onDeletePartner);
  }

  FutureOr<void> _onGetData(PartnerGetData event, Emitter<PartnerState> emit) {
    final currentState = state is PartnerLoaded
        ? state as PartnerLoaded
        : PartnerLoaded();

    final branch = currentState.dataBranch ?? repoCache.getBranch();
    final idBranch =
        event.idBranch ?? currentState.idBranch ?? branch.first.getidBranch;

    List<ModelPartner> partner = event.isCustomer
        ? repoCache.getCustomer(idBranch)
        : repoCache.getSupplier(idBranch);

    partner.sort((a, b) => a.getname.compareTo(b.getname));
    emit(
      currentState.copyWith(
        dataPartner: partner,
        idBranch: idBranch,
        dataBranch: branch,
        isCustomer: event.isCustomer,
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
    await event.partner.pushDataPartner();
    final currentState = state;
    if (currentState is PartnerLoaded) {
      final indexCategory = repoCache.dataPartner!.indexWhere(
        (element) => element.getid == event.partner.getid,
      );

      if (indexCategory != -1) {
        repoCache.dataPartner![indexCategory] = event.partner;
      } else {
        repoCache.dataPartner!.add(event.partner);
      }

      final dataPartner = event.partner.gettype.name == "customer"
          ? repoCache.getCustomer(event.partner.getidBranch)
          : repoCache.getSupplier(event.partner.getidBranch);
      dataPartner.sort((a, b) => a.getname.compareTo(b.getname));
      add(PartnerResetSelectedPartner());
      emit(currentState.copyWith(dataPartner: dataPartner));
    }
  }

  FutureOr<void> _onStatusPartner(event, Emitter<PartnerState> emit) async {
    add(PartnerResetSelectedPartner());

    final currentState = state;
    if (currentState is PartnerLoaded) {
      final isCustomer = !currentState.isCustomer;
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
      repoCache.dataPartner!.removeWhere(
        (element) => element.getid == event.id,
      );
      final dataPartner = event.type.name == "customer"
          ? await repoCache.getCustomer(currentState.idBranch!)
          : await repoCache.getSupplier(currentState.idBranch!);
      dataPartner.sort((a, b) => a.getname.compareTo(b.getname));
      emit(currentState.copyWith(dataPartner: dataPartner));
    }
  }
}
