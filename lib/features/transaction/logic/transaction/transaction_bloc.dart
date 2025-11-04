import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final DataUserRepositoryCache repo;

  TransactionBloc(this.repo) : super(TransactionInitial()) {
    on<TransactionGetData>(_onGetData);
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
    on<TransactionSelectedPartner>(_onSelectedPartner);
    on<TransactionDeleteItemOrdered>(_onDeleteItemOrdered);
    on<TransactionStatusTransaction>(_onStatusTransaction);
    on<TransactionLoadTransaction>(_onTransactionLoadTransaction);
  }

  Future<void> _onGetData(
    TransactionGetData event,
    Emitter<TransactionState> emit,
  ) async {
    final currentState = state is TransactionLoaded
        ? (state as TransactionLoaded)
        : TransactionLoaded();
    emit(TransactionLoading());

    final listCabang = repo.getBranch();

    String idBranch = event.idBranch ?? listCabang.first.getidBranch;
    final listItem = repo
        .getItem(idBranch)
        .where((element) => element.getStatusItem)
        .toList();
    List<ModelCategory> listKategori = [
      ModelCategory(nameCategory: "All", idCategory: "0", idBranch: "0"),
      ...repo.getCategory(idBranch),
    ];

    List<ModelPartner> partner = currentState.isSell
        ? repo.getCustomer(idBranch)
        : repo.getSupplier(idBranch);

    List<ModelTransaction> dataTransactionSaved = repo
        .getTransaction(idBranch)
        .where(
          (element) =>
              element.getstatusTransactioin == statusTransaction(index: 1),
        )
        .toList();

    ModelCategory selectedIdKategori =
        currentState.selectedCategory ?? listKategori.first;
    emit(
      currentState.copyWith(
        dataTransactionSaved: dataTransactionSaved,
        dataPartner: partner,
        filteredItem: currentState.isSell
            ? listItem.where((element) => !element.getstatusCondiment).toList()
            : listItem,
        selectedIDBranch: idBranch,
        selectedCategory: selectedIdKategori,
        dataBranch: listCabang,
        dataItem: listItem,
        dataCategory: listKategori,
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
          idkategori ?? currentState.selectedCategory!.getidCategory;
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
          selectedCategory: event.selectedKategori,
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
      debugPrint("Log TransactionBloc: SelectedItem: ${event.selectedItem}");
      emit(
        currentState.copyWith(
          selectedItem: event.selectedItem.copyWith(),
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
      print("Log TransactionBloc: _onResetSelectedItem: masuk");
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
      final selected = currentState.selectedItem;

      if (currentState.editSelectedItem) {
        final index = itemPesanan.indexWhere(
          (element) => element.getidOrdered == selected!.getidOrdered,
        );
        if (index != -1) {
          itemPesanan[index] = selected!.copyWith();
          emit(currentState.copyWith(itemOrdered: itemPesanan));
        }
      } else {
        if (event.orderedItem != null) {
          debugPrint("cek ${event.orderedItem!.toList()}");
          emit(currentState.copyWith(itemOrdered: event.orderedItem));
        } else {
          emit(currentState.copyWith(itemOrdered: [...itemPesanan, selected!]));
        }
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
          : selectedItem.getpriceItemFinal;

      if (event.mode != null) {
        if (event.mode!) {
          qty++;
        } else {
          qty--;
        }
      }
      print("Log TransactionBloc: AdjustItem value: ${event.note}");
      if (event.customprice != null && event.customprice != 0) {
        print("Log TransactionBloc: test Nominal");
        price = event.customprice!;
      }
      if (event.discount != null) {
        discount = event.discount!;
        print("Log TransactionBloc: Diskon value: $discount");
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
            priceItemFinal: price,
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
      print("Log TransactionBloc: ResetOrderedItem");
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
      final newStatus = currentState.isSell;
      emit(currentState.copyWith(sell: !newStatus));
    }
  }

  FutureOr<void> _onSelectedPartner(
    TransactionSelectedPartner event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      emit(currentState.copyWith(selectedPartner: event.selectedPartner));
    }
  }

  FutureOr<void> _onTransactionLoadTransaction(
    TransactionLoadTransaction event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      add(
        TransactionAddOrderedItem(
          orderedItem: event.currentTransaction.getitemsOrdered,
        ),
      );
      debugPrint(
        "Log TransactionBloc: LoadedTransaction: ${event.currentTransaction}",
      );
      emit(
        currentState.copyWith(selectedTransaction: event.currentTransaction),
      );
    }
  }
}
