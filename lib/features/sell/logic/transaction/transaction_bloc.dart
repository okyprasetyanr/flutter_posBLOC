import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/sell/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/sell/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_category.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final DataUserRepositoryCache repo;

  TransactionBloc(this.repo) : super(TransactionInitial()) {
    on<TransactionAmbilDataSellBloc>(_onAmbilData);
    on<TransactionSearchItem>(
      _onSellSearchItem,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
    on<TransactionSelectedKategoriItem>(_onSelectedKategoriItem);
    on<TransactionSelectedItem>(_onSelectedItem);
    on<TransactionSelectedCondiment>(_onSelectedCondiment);
    on<TransactionResetSelectedItem>(_onResetSelectedItem);
    on<TransactionResetOrderedItem>(_onResetOrderedItem);
    on<TransactionAddOrderedItem>(_onAddOrderedItem);
    on<TransactionAdjustItem>(_onAdjustItem);
    on<TransactionDeleteItemOrdered>(_onDeleteItemOrdered);
    on<TransactionStatusTransaction>(_onStatusTransaction);
  }

  Future<void> _onAmbilData(
    TransactionAmbilDataSellBloc event,
    Emitter<TransactionState> emit,
  ) async {
    final currentState = state is TransactionLoaded
        ? (state as TransactionLoaded)
        : TransactionLoaded();
    emit(TransactionLoading());

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
        filteredItem: currentState.sell
            ? listItem.where((element) => !element.getstatusCondiment).toList()
            : listItem,
        selectedIDCabang: idCabang,
        selectedKategori: selectedIdKategori,
        dataCabang: listCabang,
        dataItem: listItem,
        dataKategori: listKategori,
      ),
    );
  }

  FutureOr<void> _onSellSearchItem(
    TransactionSearchItem event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is TransactionLoaded) {
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
    if (currentState is TransactionLoaded) {
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
    TransactionSelectedKategoriItem event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      emit(
        currentState.copyWith(
          selectedKategori: event.selectedKategori,
          filteredItem: _sellFilterItem(event.selectedKategori.getidCategory),
        ),
      );
    }
  }

  FutureOr<void> _onSelectedItem(
    TransactionSelectedItem event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      emit(
        currentState.copyWith(
          selectedItem: event.selectedItem,
          editSelectedItem: event.edit,
        ),
      );
    }
  }

  FutureOr<void> _onResetSelectedItem(
    TransactionResetSelectedItem event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      print("Log SellBloc: _onResetSelectedItem: masuk");
      emit(currentState.copyWith(selectedItem: null, editSelectedItem: false));
    }
  }

  FutureOr<void> _onSelectedCondiment(
    TransactionSelectedCondiment event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      final data = currentState.selectedItem!.copyWith();
      final condimentList = List<ModelItemOrdered>.from(data.getCondiment);
      List<ModelItemOrdered>? updatedList = [];

      final existingCondiment = condimentList.firstWhereOrNull(
        (e) => e.getidItem == event.selectedCondiment.getidItem,
      );

      if (existingCondiment != null) {
        double qty = existingCondiment.getqtyItem;
        if (event.add) {
          qty++;
        } else {
          qty--;
        }
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
    TransactionAddOrderedItem event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      List<ModelItemOrdered> itemPesanan = List<ModelItemOrdered>.from(
        currentState.itemOrdered ?? [],
      );
      final selected = currentState.selectedItem!;
      if (currentState.editSelectedItem) {
        final index = itemPesanan.indexWhere(
          (element) => element.getidOrdered == selected.getidOrdered,
        );
        if (index != -1) {
          itemPesanan[index] = selected.copyWith();
          emit(currentState.copyWith(itemOrdered: itemPesanan));
        }
      } else {
        emit(currentState.copyWith(itemOrdered: [...itemPesanan, selected]));
      }
      add(TransactionResetSelectedItem());
    }
  }

  FutureOr<void> _onAdjustItem(
    TransactionAdjustItem event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is TransactionLoaded &&
        currentState.selectedItem != null) {
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
      print("Log SellBloc: AdjustItem value: ${event.note}");
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
            note: event.note,
          ),
        ),
      );
    }
  }

  FutureOr<void> _onDeleteItemOrdered(
    TransactionDeleteItemOrdered event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      List<ModelItemOrdered> listItemOrdered = List.from(
        currentState.itemOrdered!,
      );
      listItemOrdered.removeWhere(
        (element) =>
            element.getidOrdered == currentState.selectedItem!.getidOrdered,
      );
      add(TransactionResetSelectedItem());
      emit(currentState.copyWith(itemOrdered: listItemOrdered));
    }
  }

  FutureOr<void> _onResetOrderedItem(
    TransactionResetOrderedItem event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      print("Log SellBloc: ResetOrderedItem");
      emit(
        currentState.copyWith(
          selectedItem: null,
          editSelectedItem: false,
          itemOrdered: [],
        ),
      );
    }
  }

  FutureOr<void> _onStatusTransaction(
    TransactionStatusTransaction event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      add(TransactionResetSelectedItem());
      add(TransactionResetOrderedItem());
      final newStatus = currentState.sell;
      emit(currentState.copyWith(sell: !newStatus));
    }
  }
}
