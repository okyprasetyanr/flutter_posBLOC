import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/from_and_to_map/convert_to_map.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_split.dart';

enum PaymentMethod { Cash, Debit, QRIS, Split }

class ModelTransaction extends Equatable {
  final DateTime _date;
  final String _invoice,
      _namePartner,
      _idPartner,
      _nameOperator,
      _paymentMethod,
      _note,
      _idBranch,
      _idOperator;
  final String? _bankName;
  final ListStatusTransaction? _statusTransaction;
  final int _discount, _ppn, _totalItem, _charge;
  final double _subTotal,
      _total,
      _totalPpn,
      _totalDiscount,
      _totalCharge,
      _billPaid;
  final List<ModelSplit> _dataSplit;
  final List<ModelItemOrdered> _itemsOrdered;

  ModelTransaction({
    required String idBranch,
    ListStatusTransaction? statusTransaction,
    required List<ModelItemOrdered> itemsOrdered,
    required List<ModelSplit> dataSplit,
    required DateTime date,
    String? bankName,
    required String note,
    required String invoice,
    required String namePartner,
    required String idPartner,
    required String nameOperator,
    required String idOperator,
    required String paymentMethod,
    required int discount,
    required int ppn,
    required int totalItem,
    required int charge,
    required double subTotal,
    required double billPaid,
    required double totalCharge,
    required double totalPpn,
    required double totalDiscount,
    required double total,
  }) : _bankName = bankName,
       _date = date,
       _note = note,
       _invoice = invoice,
       _namePartner = namePartner,
       _idPartner = idPartner,
       _nameOperator = nameOperator,
       _idOperator = idOperator,
       _discount = discount,
       _ppn = ppn,
       _totalItem = totalItem,
       _subTotal = subTotal,
       _charge = charge,
       _paymentMethod = paymentMethod,
       _total = total,
       _billPaid = billPaid,
       _totalPpn = totalPpn,
       _totalDiscount = totalDiscount,
       _totalCharge = totalCharge,
       _dataSplit = dataSplit,
       _itemsOrdered = itemsOrdered,
       _statusTransaction = statusTransaction,
       _idBranch = idBranch;

  String get getidBranch => _idBranch;
  DateTime get getdate => _date;
  String get getinvoice => _invoice;
  String get getnamePartner => _namePartner;
  String get getidPartner => _idPartner;
  String get getnameOperator => _nameOperator;
  String get getidOperator => _idOperator;
  String get getpaymentMethod => _paymentMethod;
  String get getnote => _note;
  String? get getbankName => _bankName;
  int get getdiscount => _discount;
  int get getppn => _ppn;
  int get gettotalItem => _totalItem;
  int get getcharge => _charge;
  double get getsubTotal => _subTotal;
  double get gettotal => _total;
  double get getbillPaid => _billPaid;
  double get gettotalCharge => _totalCharge;
  double get gettotalDiscount => _totalDiscount;
  double get gettotalPpn => _totalPpn;
  List<ModelSplit> get getdataSplit => _dataSplit;
  List<ModelItemOrdered> get getitemsOrdered => _itemsOrdered;
  ListStatusTransaction? get getstatusTransaction => _statusTransaction;

  ModelTransaction copyWith({
    String? idBranch,
    ListStatusTransaction? statusTransaction,
    String? bankName,
    DateTime? date,
    String? note,
    String? invoice,
    String? namePartner,
    String? idPartner,
    String? nameOperator,
    String? idOperator,
    String? paymentMethod,
    int? discount,
    int? ppn,
    int? totalItem,
    int? charge,
    double? subTotal,
    double? total,
    double? billPaid,
    double? totalCharge,
    double? totalDiscount,
    double? totalPpn,
    List<ModelSplit>? dataSplit,
    List<ModelItemOrdered>? itemsOrdered,
  }) {
    return ModelTransaction(
      idBranch: idBranch ?? _idBranch,
      statusTransaction: statusTransaction,
      itemsOrdered: itemsOrdered ?? _itemsOrdered,
      bankName: bankName,
      dataSplit: dataSplit ?? _dataSplit,
      billPaid: billPaid ?? _billPaid,
      note: note ?? _note,
      totalCharge: totalCharge ?? _totalCharge,
      totalDiscount: totalDiscount ?? _totalDiscount,
      totalPpn: totalPpn ?? _totalPpn,
      paymentMethod: paymentMethod ?? _paymentMethod,
      date: date ?? _date,
      invoice: invoice ?? _invoice,
      namePartner: namePartner ?? _namePartner,
      idPartner: idPartner ?? _idPartner,
      nameOperator: nameOperator ?? _nameOperator,
      idOperator: idOperator ?? _idOperator,
      discount: discount ?? _discount,
      ppn: ppn ?? _ppn,
      totalItem: totalItem ?? _totalItem,
      subTotal: subTotal ?? _subTotal,
      charge: charge ?? _charge,
      total: total ?? _total,
    );
  }

  Future<void> pushDataBatch(DataUserRepositoryCache dataRepo) async {
    List<ModelItemBatch> convertToItemBatch = [];
    for (final itemordered in _itemsOrdered) {
      debugPrint("Log ModelTransaction: ${itemordered}");
      convertToItemBatch.add(
        ModelItemBatch(
          qtyItem_out: 0,
          invoice: _invoice,
          nameItem: itemordered.getnameItem,
          idBranch: itemordered.getidBranch,
          idItem: itemordered.getidItem,
          idOrdered: itemordered.getidOrdered,
          idCategoryItem: itemordered.getidCategoryItem,
          note: itemordered.getNote,
          date_buy: itemordered.getdateBuy!,
          expiredDate: itemordered.getexpiredDate,
          discountItem: itemordered.getdiscountItem,
          qtyItem_in: itemordered.getqtyItem,
          priceItem: itemordered.getpriceItem,
          subTotal: itemordered.getsubTotal,
          priceItemFinal: itemordered.getpriceItemFinal,
        ),
      );
    }

    final newBatch = ModelBatch(
      invoice: _invoice,
      idBranch: _idBranch,
      date_buy: _date,
      items_batch: convertToItemBatch,
    );

    final batchRef = FirebaseFirestore.instance
        .collection("batch")
        .doc(_invoice);

    await batchRef.set(convertToMapBatch(newBatch));

    final itemsRef = batchRef.collection("items_batch");
    final writeBatch = FirebaseFirestore.instance.batch();

    for (final itemBatch in convertToItemBatch) {
      final itemDoc = itemsRef.doc(itemBatch.getidOrdered);
      writeBatch.set(itemDoc, convertToMapItemBatch(itemBatch, _invoice));
    }

    await writeBatch.commit();

    dataRepo.dataBatch.add(newBatch);
  }

  Future<void> pushDataTransaction({
    bool? statusRemove,
    required bool isSell,
    required DataUserRepositoryCache dataRepo,
  }) async {
    final remove = statusRemove ?? false;

    if (!isSell) {
      pushDataBatch(dataRepo);
    } else {
      if (UserSession.getStatusFifo()) {
        if (remove) {
          pushDataBatch(dataRepo);
        } else {
          await commitStockFromOrderedBatch(dataRepo: dataRepo);
        }
      }
    }

    final dataTransaction = isSell
        ? dataRepo.dataTransSell
        : dataRepo.dataTransBuy;

    final transaction = ModelTransaction(
      statusTransaction: _statusTransaction,
      idBranch: _idBranch,
      date: _date,
      note: _note,
      invoice: _invoice,
      namePartner: _namePartner,
      idPartner: _idPartner,
      nameOperator: _nameOperator,
      idOperator: _idOperator,
      paymentMethod: _paymentMethod,
      discount: _discount,
      ppn: _ppn,
      totalItem: _totalItem,
      charge: _charge,
      subTotal: _subTotal,
      billPaid: _billPaid,
      totalCharge: _totalCharge,
      totalPpn: _totalPpn,
      totalDiscount: _totalDiscount,
      total: _total,
      itemsOrdered: [],
      dataSplit: [],
    );

    final index = dataTransaction.indexWhere(
      (element) => element.getinvoice == _invoice,
    );

    index != -1
        ? dataTransaction[index] = dataTransaction[index].copyWith(
            itemsOrdered: _itemsOrdered,
            dataSplit: _dataSplit,
            statusTransaction: _statusTransaction,
          )
        : dataTransaction.add(
            transaction.copyWith(
              itemsOrdered: _itemsOrdered,
              dataSplit: _dataSplit,
              statusTransaction: _statusTransaction,
            ),
          );

    debugPrint("Log ModelTransaction: Cek Transaksi: $dataTransaction");

    final transRef = FirebaseFirestore.instance
        .collection(isSell ? "transaction_sell" : "transaction_buy")
        .doc(_invoice);
    final writeBatch = FirebaseFirestore.instance.batch();
    writeBatch.set(transRef, convertToMapTransaction(transaction));

    final itemsRef = transRef.collection("items_ordered");

    for (final itemOrdered in _itemsOrdered) {
      final itemIdOrdered = itemsRef.doc(itemOrdered.getidOrdered);
      final condimentRef = itemIdOrdered.collection("condiment");
      final itemOrderedBatchRef = itemIdOrdered.collection(
        "item_ordered_batch",
      );
      for (final itemBatch in itemOrdered.getitemOrderedBatch) {
        debugPrint(
          "Log ModelTransaction: PushData: Check ItemOrderedBatch: ${itemBatch.getid_Ordered}",
        );
        final itemIdOrderedBatch = itemOrderedBatchRef.doc(
          itemBatch.getid_Ordered,
        );

        writeBatch.set(
          itemIdOrderedBatch,
          convertToMapItemOrderedBatch(itemBatch),
        );
      }

      for (final condimentOrdered in itemOrdered.getCondiment) {
        final condimentIdOrdered = condimentRef.doc(
          condimentOrdered.getidOrdered,
        );
        writeBatch.set(
          condimentIdOrdered,
          convertToMapItemOrdered(condimentOrdered),
        );
      }
      writeBatch.set(itemIdOrdered, convertToMapItemOrdered(itemOrdered));
    }

    final splitRef = transRef.collection("data_split");
    int inc = 0;
    for (final split in _dataSplit) {
      final idInc = splitRef.doc("${inc++}");
      writeBatch.set(idInc, convertToMapSplit(split));
    }

    await writeBatch.commit();
  }

  Future<void> commitStockFromOrderedBatch({
    required DataUserRepositoryCache dataRepo,
  }) async {
    final firestore = FirebaseFirestore.instance;
    final batchWrite = firestore.batch();

    final allOrderedBatch = _itemsOrdered
        .expand((e) => e.getitemOrderedBatch)
        .toList();

    debugPrint(
      "Log ModelTransaction: commitStockFromOrderedBatch: $allOrderedBatch",
    );

    final dataItemBatch = dataRepo.dataBatch
        .expand((b) => b.getitems_batch)
        .toList();

    for (final orderedBatch in allOrderedBatch) {
      final index = dataItemBatch.indexWhere(
        (x) =>
            x.getidOrdered == orderedBatch.getid_Ordered &&
            x.getidItem == orderedBatch.getid_Item,
      );

      if (index != -1) {
        final updated = dataItemBatch[index].copyWith(
          qtyItem_out:
              dataItemBatch[index].getqtyItem_out + orderedBatch.getqty_item,
        );

        dataItemBatch[index] = updated;

        final docRef = firestore
            .collection("batch")
            .doc(updated.getinvoice)
            .collection("items_batch")
            .doc(updated.getidOrdered);

        batchWrite.update(docRef, {'qty_item_out': updated.getqtyItem_out});
      }
    }

    await batchWrite.commit();
  }

  @override
  List<Object?> get props => [
    _idBranch,
    _statusTransaction,
    _itemsOrdered,
    _bankName,
    _dataSplit,
    _billPaid,
    _note,
    _date,
    _invoice,
    _namePartner,
    _idPartner,
    _nameOperator,
    _idOperator,
    _paymentMethod,
    _discount,
    _ppn,
    _totalItem,
    _subTotal,
    _charge,
    _total,
    _totalCharge,
    _totalDiscount,
    _totalPpn,
  ];
}
