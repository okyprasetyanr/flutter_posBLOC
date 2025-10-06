import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';

class SellBloc extends Bloc<SellEvent, SellState> {
  final DataUserRepositoryCache repo;

  SellBloc(this.repo) : super(SellInitial()) {
    on<AmbilDataSellBloc>(_onSellAmbilData);
    on<SellSearchItem>(
      _onSellSearchItem,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
    on<SellSelectedKategoriItem>(_onSelectedKategoriItem);
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
    final listItem = repo
        .ambilItem(idCabang)
        .where((element) => element.getStatusItem)
        .toList();
    List<ModelKategori> listKategori = [
      ModelKategori(namaKategori: "All", idkategori: "0", idCabang: "0"),
      ...repo.ambilKategori(idCabang),
    ];

    String selectedIdKategori =
        currentState.selectedIDKategori ?? listKategori.first.getidKategori;
    emit(
      currentState.copyWith(
        filteredItem: listItem,
        selectedIDCabang: idCabang,
        selectedIDKategori: selectedIdKategori,
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
    final currentState = state;
    if (currentState is SellLoaded) {
      if (event.text != "") {
        List<ModelItem> item = List.from(
          currentState.dataItem!
              .where(
                (element) =>
                    element.getidCabang == currentState.selectedIDCabang,
              )
              .where(
                (item) => item.getnamaItem.toLowerCase().contains(
                  event.text.toLowerCase(),
                ),
              )
              .toList(),
        );

        emit(currentState.copyWith(filteredItem: item));
      } else {
        emit(currentState.copyWith(filteredItem: _sellFilterItem()));
      }
    }
  }

  _sellFilterItem() {
    final currentState = state;
    if (currentState is SellLoaded) {
      List<ModelItem> list = List.from(
        currentState.dataItem!.where(
          (element) => element.getidCabang == currentState.selectedIDCabang,
        ),
      );
      String idkategori = currentState.selectedIDKategori!;
      if (idkategori != "0") {
        list = list
            .where((element) => element.getidKategoriItem == idkategori)
            .toList();
      } else {
        list;
      }
      return list;
    }
  }

  FutureOr<void> _onSelectedKategoriItem(
    SellSelectedKategoriItem event,
    Emitter<SellState> emit,
  ) {
    final currentState = state;
    if (currentState is SellLoaded) {
      emit(currentState.copyWith(filteredItem: _sellFilterItem()));
    }
  }
}
