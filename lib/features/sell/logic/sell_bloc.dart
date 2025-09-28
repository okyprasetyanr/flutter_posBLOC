import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';

class SellBloc extends Bloc<SellEvent, SellState> {
  DataUserRepositoryCache repo;

  SellBloc(this.repo) : super(SellInitial()) {
    on<AmbilDataSellBloc>(_onSellAmbilData);
  }

  FutureOr<void> _onSellAmbilData(
    AmbilDataSellBloc event,
    Emitter<SellState> emit,
  ) {}
}
