import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_category.dart';

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
    on<SellAdjustItem>(_onAdjustItem);
  }

  Future<void> _onSellAmbilData(
    AmbilDataSellBloc event,
    Emitter<SellState> emit,
  ) async {
    final currentState = state is SellLoaded
        ? (state as SellLoaded)
        : SellLoaded();
    emit(SellLoading());

    final listCabang = repo.getBranch();

    String idCabang = event.idCabang ?? listCabang.first.getidBranch;
    final listItem = repo
        .getItem(idCabang)
        .where((element) => element.getStatusItem)
        .toList();
    List<ModelKategori> listKategori = [
      ModelKategori(nameCategory: "All", idCategory: "0", idBranch: "0"),
      ...repo.getCategory(idCabang),
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
                    element.getidBranch == currentState.selectedIDBranch,
              )
              .where(
                (item) => item.getnameItem.toLowerCase().contains(
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
          (element) => element.getidBranch == currentState.selectedIDBranch,
        ),
      );
      String finalidkategori =
          idkategori ?? currentState.selectedKategori!.getidCategory;
      if (finalidkategori != "0") {
        list = list
            .where((element) => element.getidCategoryiItem == finalidkategori)
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
          filteredItem: _sellFilterItem(event.selectedKategori.getidCategory),
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
      emit(
        currentState.copyWith(
          selectedItem: event.selectedItem,
          editSelectedItem: event.edit,
        ),
      );
    }
  }

  FutureOr<void> _onResetSelectedItem(
    SellResetSelectedItem event,
    Emitter<SellState> emit,
  ) {
    final currentState = state;
    if (currentState is SellLoaded) {
      print("Log SellBloc _onResetSelectedItem: masuk");
      emit(currentState.copyWith(selectedItem: null, editSelectedItem: false));
    }
  }

  FutureOr<void> _onSelectedCondiment(
    SellSelectedCondiment event,
    Emitter<SellState> emit,
  ) {
    final currentState = state;
    if (currentState is SellLoaded) {
      final data = currentState.selectedItem!.copyWith();
      final condimentList = List<ModelItemPesanan>.from(data.getCondiment);
      List<ModelItemPesanan>? updatedList = [];

      final existingCondiment = condimentList.firstWhereOrNull(
        (e) => e.getidItem == event.selectedCondiment.getidItem,
      );

      if (existingCondiment != null) {
        final qty = existingCondiment.getqtyItem + 1;
        final subTotal = existingCondiment.getpriceItem * qty;
        final updatedCondiment = existingCondiment.copyWith(
          qtyItem: qty,
          subTotal: subTotal,
        );
        updatedList = condimentList
            .map(
              (e) => e.getidItem == updatedCondiment.getidItem
                  ? updatedCondiment
                  : e,
            )
            .toList();
      } else {
        updatedList = [...condimentList, event.selectedCondiment];
      }
      emit(
        currentState.copyWith(
          selectedItem: data.copyWith(condiment: updatedList),
        ),
      );
    }
  }

  FutureOr<void> _onAddOrderedItem(
    SellAddOrderedItem event,
    Emitter<SellState> emit,
  ) {
    final currentState = state;
    if (currentState is SellLoaded) {
      List<ModelItemPesanan> itemPesanan = List<ModelItemPesanan>.from(
        currentState.itemOrdered ?? [],
      );
      final selected = currentState.selectedItem!;
      if (currentState.editSelectedItem) {
        final index = itemPesanan.indexWhere(
          (element) => element.getidOrdered == selected.getidOrdered,
        );
        if (index != -1) {
          itemPesanan[index] = selected.copyWith();
          emit(currentState.copyWith(itemPesanan: itemPesanan));
        }
      } else {
        emit(
          currentState.copyWith(
            itemPesanan: [...itemPesanan, selected],
            selectedItem: null,
          ),
        );
      }
    }
  }

  FutureOr<void> _onAdjustItem(SellAdjustItem event, Emitter<SellState> emit) {
    final currentState = state;
    if (currentState is SellLoaded && currentState.selectedItem != null) {
      final selectedItem = currentState.selectedItem!.copyWith();
      double qty = selectedItem.getqtyItem;
      int discount = selectedItem.getdiscountItem;
      double price = event.customprice == 0
          ? selectedItem.getpriceItem
          : selectedItem.getpriceItemCustom;

      if (event.mode != null) {
        if (event.mode!) {
          qty++;
        } else {
          qty--;
        }
      }
      if (event.customprice != null && event.customprice != 0) {
        print("Log SellBloc: test Nominal");
        price = event.customprice!;
      }
      if (event.discount != null) {
        discount = event.discount!;
        print("Log SellBloc: Diskon value: $discount");
      }
      if (event.qty != null) {
        qty = event.qty!;
      }

      double subTotal = price * qty - (price * qty * discount / 100);
      emit(
        currentState.copyWith(
          selectedItem: selectedItem.copyWith(
            qtyItem: qty,
            subTotal: subTotal,
            priceItemCustom: price,
            dicountItem: discount,
          ),
        ),
      );
    }
  }
}
