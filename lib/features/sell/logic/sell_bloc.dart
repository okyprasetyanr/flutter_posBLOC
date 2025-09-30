import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/model_data/model_item.dart';

class SellBloc extends Bloc<SellEvent, SellState> {
  DataUserRepositoryCache repo;

  SellBloc(this.repo) : super(SellInitial()) {
    on<AmbilDataSellBloc>(_onSellAmbilData);
    on<SellSearchItem>(
      _onSellSearchItem,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
  }

  Future<void> _onSellAmbilData(
    AmbilDataSellBloc event,
    Emitter<SellState> emit,
  ) async {
    final currentState = state is SellLoaded
        ? (state as SellLoaded)
        : SellLoaded();
    emit(SellLoading());

    final listCabang = repo.ambilCabang();

    String idCabang = event.idCabang ?? listCabang.first.getidCabang;
    final listItem = repo.ambilItem(idCabang);
    final listKategori = repo.ambilKategori(idCabang);
    emit(
      currentState.copyWith(
        filteredItem: listItem,
        idCabang: idCabang,
        dataCabang: listCabang,
        dataItem: listItem,
        dataKategori: listKategori,
      ),
    );
  }

  FutureOr<void> _onSellSearchItem(
    SellSearchItem event,
    Emitter<SellState> emit,
  ) {
    final currentState = state is SellLoaded
        ? (state as SellLoaded)
        : SellLoaded();

    if (event.text.isNotEmpty) {
      List<ModelItem> item = List.from(
        currentState.dataItem!
            .where(
              (item) => item.getnamaItem.toLowerCase().contains(
                event.text.toLowerCase(),
              ),
            )
            .toList(),
      );

      emit(currentState.copyWith(filteredItem: item));
    } else {
      List<ModelItem> item = List.from(currentState.dataItem!);
      emit(
        currentState.copyWith(
          filteredDataItem: _filterItem(
            list,
            currentState.selectedStatusItem!,
            currentState.selectedFilterItem!,
            currentState.selectedFilterJenisItem!,
            currentState.selectedFilterIDKategoriItem!,
          ),
        ),
      );
    }
  }
}
