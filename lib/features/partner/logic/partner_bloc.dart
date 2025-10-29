import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/partner/logic/partner_event.dart';
import 'package:flutter_pos/features/partner/logic/partner_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';

class PartnerBloc extends Bloc<PartnerEvent, PartnerState> {
  DataUserRepositoryCache repo;
  PartnerBloc(this.repo) : super(PartnerInitial()) {
    on<PartnerGetData>(_onGetData);
    on<PartnerSelectedCustomer>(_onSelectedCustomer);
    on<PartnerPushDataPartner>(_onPushDataPartner);
  }

  FutureOr<void> _onGetData(PartnerGetData event, Emitter<PartnerState> emit) {
    emit(PartnerLoading());
    final currentState = state is PartnerLoaded
        ? state as PartnerLoaded
        : PartnerLoaded();

    final branch = repo.getBranch();
    final idBranch = event.idBranch ?? branch.first.getidBranch;
    final partner;
    if (event.isCustomer) {
      partner = repo.getCustomer(idBranch);
    } else {
      partner = repo.getSupplier(idBranch);
    }
    emit(
      currentState.copyWith(
        dataPartner: partner,
        idBranch: event.idBranch,
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

  Future<void> _onPushDataPartner(
    PartnerPushDataPartner event,
    Emitter<PartnerState> emit,
  ) async {
    emit(PartnerLoading());
    await event.partner.pushDataPartner();
  }
}
