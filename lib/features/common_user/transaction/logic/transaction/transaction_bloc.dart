import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/request/delete_data.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final DataUserRepositoryCache repo;

  TransactionBloc(this.repo) : super(TransactionInitial()) {
    on<TransactionGetData>(_onGetData);
    on<TransactionSearchItem>(
      _onSellSearchItem,
      transformer: debounceRestartable(),
    );
    on<TransactionSelectedCategoryItem>(_onSelectedCategoryItem);
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
    on<TransactionDeleteItemSaved>(_onDeleteItemSaved);
  }

  Future<void> _onGetData(
    TransactionGetData event,
    Emitter<TransactionState> emit,
  ) async {
    final currentState = state is TransactionLoaded
        ? (state as TransactionLoaded)
        : TransactionLoaded();

    final listBranch = repo.getBranch();

    String idBranch =
        event.idBranch ?? currentState.idBranch ?? listBranch.first.getidBranch;
    final listItem = repo
        .getItem(idBranch)
        .where((element) => element.getStatusItem)
        .toList();
    listItem.sort((a, b) => a.getnameItem.compareTo(b.getnameItem));
    List<ModelCategory> listCategory = [
      ModelCategory(nameCategory: "All", idCategory: "0", idBranch: "0"),
      ...repo.getCategory(idBranch),
    ];

    List<ModelPartner> partner = currentState.isSell
        ? repo.getCustomer(idBranch)
        : repo.getSupplier(idBranch);

    List<ModelTransaction> dataTransactionSaved = repo
        .getTransactionSell(idBranch)
        .where(
          (element) =>
              element.getstatusTransaction == statusTransaction(index: 1),
        )
        .toList();

    ModelCategory selectedIdCategory =
        currentState.selectedCategory ?? listCategory.first;
    emit(
      currentState.copyWith(
        dataTransactionSaved: dataTransactionSaved,
        dataPartner: partner,
        filteredItem: currentState.isSell
            ? listItem.where((element) => !element.getstatusCondiment).toList()
            : listItem,
        selectedIDBranch: idBranch,
        selectedCategory: selectedIdCategory,
        dataBranch: listBranch,
        dataItem: listItem,
        dataCategory: listCategory,
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
              .where((element) => element.getidBranch == currentState.idBranch)
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

  _sellFilterItem(String? idCategory) {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      List<ModelItem> list = List.from(
        currentState.dataItem!.where(
          (element) => element.getidBranch == currentState.idBranch,
        ),
      );
      if (currentState.isSell) {
        list = list.where((element) => !element.getstatusCondiment).toList();
      }
      String finalidCategory =
          idCategory ?? currentState.selectedCategory!.getidCategory;
      if (finalidCategory != "0") {
        list = list
            .where((element) => element.getidCategoryiItem == finalidCategory)
            .toList();
      } else {
        list;
      }
      return list;
    }
  }

  FutureOr<void> _onSelectedCategoryItem(
    TransactionSelectedCategoryItem event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      emit(
        currentState.copyWith(
          selectedCategory: event.selectedCategory,
          filteredItem: _sellFilterItem(event.selectedCategory.getidCategory),
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
      debugPrint("Log TransactionBloc: _onResetSelectedItem: masuk");
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
        currentState.itemOrdered ?? const [],
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
      DateTime? expiredDate = selectedItem.getexpiredDate;

      if (event.expiredDate != null) {
        expiredDate = parseDate(date: event.expiredDate!);
        debugPrint("Log TransactionBloc: ExpiredDate value: $expiredDate}");
      }

      if (event.mode != null) {
        if (event.mode!) {
          qty++;
        } else {
          qty--;
        }
      }
      debugPrint("Log TransactionBloc: AdjustItem value: ${event.note}");
      if (event.customprice != null && event.customprice != 0) {
        debugPrint("Log TransactionBloc: test Nominal");
        price = event.customprice!;
      }
      if (event.discount != null) {
        discount = event.discount!;
        debugPrint("Log TransactionBloc: Diskon value: $discount");
      }
      if (event.qty != null) {
        qty = event.qty!;
      }

      double subTotal = price * qty - (price * qty * discount / 100);
      emit(
        currentState.copyWith(
          selectedItem: selectedItem.copyWith(
            expiredDate: expiredDate,
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
      debugPrint("Log TransactionBloc: ResetOrderedItem");
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
        currentState.copyWith(
          selectedTransaction: event.currentTransaction,
          revision: event.revision ?? false,
        ),
      );
    }
  }

  Future<void> _onDeleteItemSaved(
    TransactionDeleteItemSaved event,
    Emitter<TransactionState> emit,
  ) async {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      repo.dataTransSell.removeWhere(
        (element) => element.getinvoice == event.invoice,
      );
      await deleteDataTransaction(event.invoice);
      add(TransactionGetData());
    }
  }
}
