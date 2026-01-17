import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/enum/enum.dart';
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
import 'package:flutter_pos/model_data/model_item_ordered_batch.dart';
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

    emit(
      currentState.copyWith(
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
    final currentState = state as TransactionLoaded;

    final item = currentState.selectedItem!;
    final fifoActive = UserSession.getStatusFifo();
    final isSell = currentState.isSell;

    List<ModelItemOrderedBatch> batches = List.from(item.getitemOrderedBatch);

    double price = event.customprice != null && event.customprice != 0
        ? event.customprice!
        : batches.isNotEmpty
        ? batches.last.getprice_item
        : item.getpriceItem;

    debugPrint("Log TransactionBloc: Adjustitem SelectedItem:Batch: $batches");

    int discount = event.discount ?? item.getdiscountItem;

    DateTime? expiredDate = item.getexpiredDate;
    if (event.expiredDate != null) {
      expiredDate = parseDate(date: event.expiredDate!);
    }

    if (event.mode != null) {
      if (event.mode!) {
        if (!fifoActive || !isSell) {
          batches.add(
            ModelItemOrderedBatch(
              id_ordered: 'NON_FIFO',
              id_item: item.getidItem,
              invoice: item.getinvoice ?? '',
              qty_item: 1,
              price_item: price,
            ),
          );
        } else {
          _allocateFIFO(
            usedBatches: batches,
            stockBatches: currentState.dataItemBatch!,
            idItem: item.getidItem,
            invoice: item.getinvoice ?? '',
            qtyNeed: 1,
          );
        }
      } else {
        if (batches.isNotEmpty) {
          _releaseFIFO(usedBatches: batches, qtyRelease: 1);
        }
      }
    }

    //custom QTY
    if (event.qty != null) {
      final diff = event.qty! - _totalQty(batches).toInt();
      if (diff > 0) {
        _allocateFIFO(
          usedBatches: batches,
          stockBatches: currentState.dataItemBatch!,
          idItem: item.getidItem,
          invoice: item.getinvoice ?? '',
          qtyNeed: diff,
        );
      } else if (diff < 0) {
        _releaseFIFO(usedBatches: batches, qtyRelease: diff.abs());
      }
    }

    final qtyFinal = _totalQty(batches);

    final subTotal = _calculateSubTotalFromBatch(batches, discount);

    emit(
      currentState.copyWith(
        selectedItem: item.copyWith(
          qtyItem: qtyFinal,
          priceItemFinal: batches.isNotEmpty
              ? batches.last.getprice_item
              : item.getpriceItem,
          dicountItem: discount,
          expiredDate: expiredDate,
          subTotal: subTotal,
          itemOrderedBatch: batches,
          note: event.note,
        ),
      ),
    );
  }

  double _totalQty(List<ModelItemOrderedBatch> batches) {
    return batches.fold(0.0, (sum, e) => sum + e.getqty_item);
  }

  double _allocateFIFO({
    required List<ModelItemOrderedBatch> usedBatches,
    required List<ModelItemBatch> stockBatches,
    required String idItem,
    required String invoice,
    required double qtyNeed,
  }) {
    double need = qtyNeed;

    final fifo =
        stockBatches
            .where(
              (e) =>
                  e.getidItem == idItem && e.getqtyItem_in > e.getqtyItem_out,
            )
            .toList()
          ..sort((a, b) => a.getdateBuy.compareTo(b.getdateBuy));

    for (final batch in fifo) {
      if (need <= 0) break;

      // qty yang sudah dipakai DI TRANSAKSI INI
      final usedQtyInOrder = usedBatches
          .where((e) => e.getid_Ordered == batch.getidOrdered)
          .fold(0.0, (s, e) => s + e.getqty_item);

      // stok REAL batch
      final available =
          batch.getqtyItem_in - batch.getqtyItem_out - usedQtyInOrder;

      if (available <= 0) continue;

      final take = available >= need ? need : available;

      usedBatches.add(
        ModelItemOrderedBatch(
          id_ordered: batch.getidOrdered,
          id_item: idItem,
          invoice: invoice,
          qty_item: take,
          price_item: batch.getpriceItemFinal,
        ),
      );
      need -= take;
      return batch.getpriceItemFinal;
    }
    return 0;
  }

  void _releaseFIFO({
    required List<ModelItemOrderedBatch> usedBatches,
    required double qtyRelease,
  }) {
    double release = qtyRelease;

    for (int i = usedBatches.length - 1; i >= 0; i--) {
      if (release <= 0) break;

      final batch = usedBatches[i];

      if (batch.getqty_item <= release) {
        release -= batch.getqty_item.toInt();
        usedBatches.removeAt(i);
      } else {
        usedBatches[i] = ModelItemOrderedBatch(
          id_ordered: batch.getid_Ordered,
          id_item: batch.getid_Item,
          invoice: batch.getinvoice,
          qty_item: batch.getqty_item - release,
          price_item: batch.getprice_item,
        );
        release = 0;
      }
    }
  }

  double _calculateSubTotalFromBatch(
    List<ModelItemOrderedBatch> batches,
    int discount,
  ) {
    final gross = batches.fold<double>(
      0.0,
      (sum, element) => sum + (element.getqty_item * element.getprice_item),
    );

    if (discount <= 0) return gross;

    return gross - (gross * discount / 100);
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
      (await repoCache.getHiveSavedTransaction()).delete(event.invoice);

      add(TransactionGetData());
    }
  }
}
