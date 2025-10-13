import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_pesanan.dart';
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
    on<SellSelectedItem>(_onSelectedItem);
    on<SellSelectedCondiment>(_onSelectedCondiment);
    on<SellResetSelectedItem>(_onResetSelectedItem);
    on<SellAddOrderedItem>(_onAddOrderedItem);
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

    ModelKategori selectedIdKategori =
        currentState.selectedKategori ?? listKategori.first;
    emit(
      currentState.copyWith(
        filteredItem: listItem,
        selectedIDCabang: idCabang,
        selectedKategori: selectedIdKategori,
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
          currentState.filteredItem!
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
        emit(currentState.copyWith(filteredItem: _sellFilterItem(null)));
      }
    }
  }

  _sellFilterItem(String? idkategori) {
    final currentState = state;
    if (currentState is SellLoaded) {
      List<ModelItem> list = List.from(
        currentState.dataItem!.where(
          (element) => element.getidCabang == currentState.selectedIDCabang,
        ),
      );
      String finalidkategori =
          idkategori ?? currentState.selectedKategori!.getidKategori;
      if (finalidkategori != "0") {
        list = list
            .where((element) => element.getidKategoriItem == finalidkategori)
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
      emit(
        currentState.copyWith(
          selectedKategori: event.selectedKategori,
          filteredItem: _sellFilterItem(event.selectedKategori.getidKategori),
        ),
      );
    }
  }

  FutureOr<void> _onSelectedItem(
    SellSelectedItem event,
    Emitter<SellState> emit,
  ) {
    final currentState = state;
    if (currentState is SellLoaded) {
      emit(currentState.copyWith(selectedItem: event.selectedItem));
    }
  }

  FutureOr<void> _onResetSelectedItem(
    SellResetSelectedItem event,
    Emitter<SellState> emit,
  ) {
    final currentState = state;
    if (currentState is SellLoaded) {
      print("Log SellBloc _onResetSelectedItem: masuk");
      emit(currentState.copyWith(selectedItem: null));
    }
  }

  FutureOr<void> _onSelectedCondiment(
    SellSelectedCondiment event,
    Emitter<SellState> emit,
  ) {
    final currentState = state;
    if (currentState is SellLoaded) {
      final data = currentState.selectedItem!.copyWith();

      final condimentList = List<ModelItemPesanan>.from(
        data.getCondiment ?? [],
      );

      final existingCondiment = condimentList.firstWhereOrNull(
        (e) => e.getidItem == event.selectedCondiment.getidItem,
      );

      if (existingCondiment != null) {
        final updatedCondiment = existingCondiment.copyWith(
          qtyItem: existingCondiment.getqtyItem + 1,
        );

        final updatedList = condimentList
            .map(
              (e) => e.getidItem == updatedCondiment.getidItem
                  ? updatedCondiment
                  : e,
            )
            .toList();

        emit(
          currentState.copyWith(
            selectedItem: data.copyWith(condiment: updatedList),
          ),
        );
      } else {
        final updatedList = [...condimentList, event.selectedCondiment];
        emit(
          currentState.copyWith(
            selectedItem: data.copyWith(condiment: updatedList),
          ),
        );
      }
    }
  }

  FutureOr<void> _onAddOrderedItem(
    SellAddOrderedItem event,
    Emitter<SellState> emit,
  ) {
    final currentState = state;
    if (currentState is SellLoaded) {
      final itemPesanan = List.from(currentState.itemPesanan ?? []);
      emit(
        currentState.copyWith(
          itemPesanan: [...itemPesanan, event.orderedItem],
          selectedItem: null,
        ),
      );
    }
  }
}
