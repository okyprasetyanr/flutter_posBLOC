import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/fifo_logic/fifo_logic.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/from_and_to_map/from_map.dart';
import 'package:flutter_pos/function/event_transformer.dart.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_split.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final DataUserRepositoryCache repoCache;

  TransactionBloc(this.repoCache) : super(TransactionLoaded()) {
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
    on<TransactionAdjustItem>(
      _onAdjustItem,
      transformer: debounceRestartable(),
    );
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

    final listBranch = repoCache.getBranch();

    String idBranch =
        event.idBranch ?? currentState.idBranch ?? listBranch.first.getidBranch;
    final listItem = repoCache
        .getItem(idBranch)
        .where((element) => element.getStatusItem == StatusData.Aktif)
        .toList();
    listItem.sort((a, b) => a.getnameItem.compareTo(b.getnameItem));

    List<ModelCategory> listCategory = [
      ModelCategory(nameCategory: "All", idCategory: "0", idBranch: "0"),
      ...repoCache.getCategory(idBranch),
    ];

    List<ModelPartner> partner = currentState.isSell
        ? repoCache.getCustomer(idBranch)
        : repoCache.getSupplier(idBranch);

    final hiveTransactionSaved = (await repoCache.getHiveSavedTransaction())
        .values
        .toList();

    debugPrint(
      "Log transactionBloc: Hive Data: ${hiveTransactionSaved.toString()}",
    );

    List<ModelTransaction> dataTransactionSaved = [];
    hiveTransactionSaved.forEach((element) {
      final rawItems = element.datatransactionSaved['items_ordered'] as List?;

      final List<ModelItemOrdered> itemOrdered =
          rawItems?.map((e) {
            final mapItem = Map<String, dynamic>.from(e as Map);

            final List<ModelItemOrdered> condiment =
                (mapItem['condiment'] as List?)
                    ?.map(
                      (c) => fromMapItemOrdered(
                        items: Map<String, dynamic>.from(c as Map),
                        condiment: [],
                        itemBatch: [],
                        isCondiment: true,
                        id_ordered: null,
                      ),
                    )
                    .toList() ??
                [];

            return fromMapItemOrdered(
              items: mapItem,
              condiment: condiment,
              itemBatch: [],
              isCondiment: false,
              id_ordered: null,
            );
          }).toList() ??
          [];

      final List<dynamic>? rawSplitData =
          element.datatransactionSaved['data_split'] as List?;

      List<ModelSplit> dataSplit =
          rawSplitData?.map((mapSplit) {
            return fromMapSplit(
              Map<String, dynamic>.from(mapSplit as Map),
              invoice: element.invoice,
            );
          }).toList() ??
          [];

      final transaction = fromMapTransaction(
        element.datatransactionSaved,
        itemOrdered,
        dataSplit,
        element.invoice,
      );
      final transactionWithItems = transaction.copyWith(
        itemsOrdered: itemOrdered,
      );

      dataTransactionSaved.add(transactionWithItems);
    });

    ModelCategory selectedIdCategory =
        currentState.selectedCategory ?? listCategory.first;

    List<ModelItemBatch> dataItemBatch = [];
    repoCache
        .getBatch(idBranch)
        .forEach(
          (element) => element.getitems_batch.forEach(
            (element) => dataItemBatch.add(element),
          ),
        );

    final fifoMap = buildFifoBatchMap(dataItemBatch);

    applyFifoPriceToItem(listItem: listItem, fifoMap: fifoMap);

    final isSell = !UserSession.getStatusFifo() ? true : currentState.isSell;
    debugPrint("Log TransactionBloc: GetData: isSell: ${isSell}");
    emit(
      currentState.copyWith(
        isSell: isSell,
        selectedTransaction: ModelTransaction.empty(),
        dataItemBatch: dataItemBatch,
        dataTransactionSaved: dataTransactionSaved,
        dataPartner: partner,
        filteredItem: currentState.isSell
            ? listItem
                  .where(
                    (element) =>
                        element.getstatusCondiment == StatusData.Nonaktif,
                  )
                  .toList()
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
        list = list
            .where(
              (element) => element.getstatusCondiment == StatusData.Nonaktif,
            )
            .toList();
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

  Map<String, List<ModelItemBatch>> buildFifoBatchMap(
    List<ModelItemBatch> dataItemBatch,
  ) {
    final Map<String, List<ModelItemBatch>> fifoMap = {};

    for (final batch in dataItemBatch) {
      final availableQty = batch.getqtyItem_in - batch.getqtyItem_out;
      if (availableQty <= 0) continue;

      fifoMap.putIfAbsent(batch.getidItem, () => []);
      fifoMap[batch.getidItem]!.add(batch);
    }

    fifoMap.forEach((_, batches) {
      batches.sort((a, b) => a.getdateBuy.compareTo(b.getdateBuy));
    });

    return fifoMap;
  }

  void applyFifoPriceToItem({
    required List<ModelItem> listItem,
    required Map<String, List<ModelItemBatch>> fifoMap,
  }) {
    for (int i = 0; i < listItem.length; i++) {
      final item = listItem[i];
      final fifoBatches = fifoMap[item.getidItem];

      if (fifoBatches == null || fifoBatches.isEmpty) continue;

      final oldestBatch = fifoBatches.first;

      listItem[i] = item.copyWith(priceItem: oldestBatch.getpriceItemFinal);
      debugPrint(
        "Log TransactionBloc ApplyFifotoItem: price: ${oldestBatch.getpriceItemFinal}, invoice_Batch: ${oldestBatch.getinvoice}",
      );
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

  FutureOr<void> _onResetSelectedItem(
    TransactionResetSelectedItem event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      debugPrint("Log TransactionBloc: _onResetSelectedItem: masuk");
      emit(
        currentState.copyWith(
          selectedItem: null,
          editSelectedItem: false,
          customPrice: 0,
        ),
      );
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
          if (!UserSession.getStatusFifo()) {
            qty++;
          } else if (qty <
              currentState.dataItem!
                  .firstWhere(
                    (element) =>
                        element.getidItem == existingCondiment.getidItem,
                  )
                  .getqtyItem) {
            qty++;
          }
        } else {
          if (qty > 0) {
            qty--;
          }
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
        double qty = event.selectedCondiment.getqtyItem;
        if (event.add) {
          if (!UserSession.getStatusFifo()) {
            qty++;
          } else if (qty <
              currentState.dataItem!
                  .firstWhere(
                    (element) =>
                        element.getidItem == event.selectedCondiment.getidItem,
                  )
                  .getqtyItem) {
            qty++;
          }
        } else {
          if (qty > 0) {
            qty--;
          }
        }
        updatedList = [
          ...condimentList,
          event.selectedCondiment.copyWith(
            qtyItem: qty,
            subTotal: event.selectedCondiment.getpriceItem * qty,
          ),
        ];
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
        currentState.itemOrdered,
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

  Future<void> _onSelectedItem(
    TransactionSelectedItem event,
    Emitter<TransactionState> emit,
  ) async {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      ModelItemOrdered item;

      if (event.edit) {
        item = event.selectedItem;
      } else {
        debugPrint("Log TransactionBloc: SelectedItem: check flow");
        final resultFifo = await fifoLogic(
          state: currentState,
          item: event.selectedItem,
          mode: true,
        );
        item = event.selectedItem.copyWith(
          qtyItem: resultFifo.qty,
          subTotal: resultFifo.subTotal,
          itemOrderedBatch: resultFifo.batch,
        );
      }

      emit(
        currentState.copyWith(selectedItem: item, editSelectedItem: event.edit),
      );
    }
  }

  FutureOr<void> _onAdjustItem(
    TransactionAdjustItem event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state as TransactionLoaded;

    final item = currentState.selectedItem!;

    int discount = event.discount ?? item.getdiscountItem;

    DateTime? expiredDate = item.getexpiredDate;
    if (event.expiredDate != null) {
      expiredDate = parseDate(date: event.expiredDate!);
    }

    final resultFifo = fifoLogic(
      secondCustomPrice: event.secondCustomPrice,
      state: currentState,
      item: item,
      customPrice: event.customPrice,
      mode: event.mode,
      qty: event.qty,
      discount: discount,
    );

    debugPrint("Log TransactionLoaded: adjustItem: price: ${resultFifo.price}");

    emit(
      currentState.copyWith(
        customPrice: resultFifo.price,
        selectedItem: item.copyWith(
          priceItemBuy: resultFifo.priceBuy,
          qtyItem: resultFifo.qty,
          priceItemFinal: resultFifo.price,
          dicountItem: discount,
          expiredDate: expiredDate,
          subTotal: resultFifo.subTotal,
          itemOrderedBatch: resultFifo.batch,
          note: event.note,
        ),
      ),
    );
  }

  FutureOr<void> _onDeleteItemOrdered(
    TransactionDeleteItemOrdered event,
    Emitter<TransactionState> emit,
  ) {
    final currentState = state;
    if (currentState is TransactionLoaded) {
      List<ModelItemOrdered> listItemOrdered = List.from(
        currentState.itemOrdered,
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
    add(TransactionResetSelectedItem());
    if (currentState is TransactionLoaded) {
      debugPrint("Log TransactionBloc: ResetOrderedItem");
      emit(
        currentState.copyWith(
          selectedTransaction: ModelTransaction.empty(),
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
      // add(TransactionResetSelectedItem());
      add(TransactionResetOrderedItem());
      final newStatus = currentState.isSell;
      emit(currentState.copyWith(isSell: !newStatus));
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
      final itemOrdered = event.currentTransaction.getitemsOrdered;
      List<ModelItemOrdered> itemOrderedFinal = [];
      for (int i = 0; i < itemOrdered.length; i++) {
        ModelItemOrdered item = itemOrdered[i];
        final resultFifo = fifoLogic(
          state: currentState,
          customPrice: item.getpriceItemFinal,
          item: item,
          qty: item.getqtyItem,
          simulatedItemOrdered: itemOrderedFinal,
        );

        debugPrint(
          "Log TransactionBloc: LoadedTransaction: ${item.getpriceItemFinal}, priceFinal: ${resultFifo.price}",
        );
        item = item.copyWith(
          qtyItem: resultFifo.qty,
          priceItemFinal: resultFifo.price,
          subTotal: resultFifo.subTotal,
          itemOrderedBatch: resultFifo.batch,
        );
        itemOrderedFinal.add(item);
      }
      add(TransactionAddOrderedItem(orderedItem: itemOrderedFinal));

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
      (await repoCache.getHiveSavedTransaction()).delete(event.invoice);

      add(TransactionGetData());
    }
  }
}
