import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/convert_to_map/convert_to_map.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_data_counter.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_split.dart';

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
  final String? _bankName, _statusTransaction;
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
    String? statusTransaction,
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
  String? get getstatusTransaction => _statusTransaction;

  ModelTransaction copyWith({
    String? idBranch,
    String? statusTransaction,
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

    dataRepo.dataBatch!.add(newBatch);

    ModelCounter.pushDataCounter(
      ModelCounter(
        counterSell: 0,
        counterBuy: 1,
        counterIncome: 0,
        counterExpense: 0,
        idBranch: _idBranch,
      ),
    );
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
        remove
            ? pushDataBatch(dataRepo)
            : reduceQtyFIFO(dataBatch: dataRepo.dataBatch!);
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

    final index = dataTransaction!.indexWhere(
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

  Future<void> reduceQtyFIFO({required List<ModelBatch> dataBatch}) async {
    final firestore = FirebaseFirestore.instance;
    final batchWrite = firestore.batch();

    final dataItemBatch = dataBatch.expand((b) => b.getitems_batch).toList();

    for (final transItem in _itemsOrdered) {
      double qtyItemTrans = transItem.getqtyItem;

      final itemBatchs =
          dataItemBatch
              .where((b) => b.getidItem == transItem.getidItem)
              .toList()
            ..sort((a, b) => a.getdateBuy.compareTo(b.getdateBuy));

      for (int i = 0; i < itemBatchs.length && qtyItemTrans > 0; i++) {
        final batch = itemBatchs[i];
        final availableQty = batch.getqtyItem_in - batch.getqtyItem_out;

        if (availableQty <= 0) continue;

        final used = (availableQty >= qtyItemTrans)
            ? qtyItemTrans
            : availableQty;
        qtyItemTrans -= used;

        final updatedBatch = batch.copyWith(
          qtyItem_out: batch.getqtyItem_out + used,
        );

        final index = dataItemBatch.indexWhere(
          (x) =>
              x.getinvoice == updatedBatch.getinvoice &&
              x.getidItem == updatedBatch.getidItem,
        );
        if (index != -1) {
          dataItemBatch[index] = updatedBatch;
        }

        final docRef = firestore
            .collection("batch")
            .doc(updatedBatch.getinvoice)
            .collection("items_batch")
            .doc(updatedBatch.getidOrdered);

        batchWrite.update(docRef, {
          'qty_item_out': updatedBatch.getqtyItem_out,
        });
      }
    }

    for (int i = 0; i < dataBatch.length; i++) {
      final batch = dataBatch[i];
      final updatedItems = dataItemBatch
          .where((x) => x.getinvoice == batch.getinvoice)
          .toList();

      dataBatch[i] = batch.copyWith(items_batch: updatedItems);
    }

    await batchWrite.commit();
  }

  static Future<List<ModelTransaction>> getDataListTransaction(
    QuerySnapshot data, {
    required bool isSell,
  }) async {
    final firestore = FirebaseFirestore.instance;
    final String collection = isSell ? 'transaction_sell' : 'transaction_buy';

    return await Future.wait(
      data.docs.map((map) async {
        final dataTransaction = map.data() as Map<String, dynamic>;

        final itemsSnapshot = await firestore
            .collection(collection)
            .doc(map.id)
            .collection('items_ordered')
            .get();

        final itemsOrdered = await Future.wait(
          itemsSnapshot.docs.map((itemDoc) async {
            final condimentSnapshot = await firestore
                .collection(collection)
                .doc(map.id)
                .collection('items_ordered')
                .doc(itemDoc.id)
                .collection('condiment')
                .get();

            final condiments = condimentSnapshot.docs
                .map(
                  (condimentDoc) => ModelItemOrdered.fromMap(
                    condimentDoc.data(),
                    [],
                    true,
                    condimentDoc.id,
                  ),
                )
                .toList();

            return ModelItemOrdered.fromMap(
              itemDoc.data(),
              condiments,
              false,
              itemDoc.id,
            );
          }),
        );
        final splitSnapshot = await firestore
            .collection(collection)
            .doc(map.id)
            .collection('data_split')
            .get();

        final splitData = splitSnapshot.docs
            .map((splitDoc) => ModelSplit.fromMap(splitDoc.data()))
            .toList();

        return ModelTransaction(
          idBranch: dataTransaction['id_branch'],
          bankName: dataTransaction['bank_name'],
          itemsOrdered: itemsOrdered,
          dataSplit: splitData,
          date: parseDate(date: dataTransaction['date']),
          note: dataTransaction['note'],
          invoice: map.id,
          namePartner: dataTransaction['name_partner'],
          idPartner: dataTransaction['id_partner'],
          nameOperator: dataTransaction['name_operator'],
          idOperator: dataTransaction['id_operator'],
          paymentMethod: dataTransaction['payment_method'],
          discount: int.tryParse(dataTransaction['discount'].toString()) ?? 0,
          ppn: int.tryParse(dataTransaction['ppn'].toString()) ?? 0,
          totalItem:
              int.tryParse(dataTransaction['total_item'].toString()) ?? 0,
          charge: int.tryParse(dataTransaction['charge'].toString()) ?? 0,
          subTotal:
              double.tryParse(dataTransaction['sub_total'].toString()) ?? 0.0,
          billPaid:
              double.tryParse(dataTransaction['bill_paid'].toString()) ?? 0.0,
          totalCharge:
              double.tryParse(dataTransaction['total_charge'].toString()) ??
              0.0,
          totalPpn:
              double.tryParse(dataTransaction['total_ppn'].toString()) ?? 0.0,
          totalDiscount:
              double.tryParse(dataTransaction['total_discount'].toString()) ??
              0.0,
          total: double.tryParse(dataTransaction['total'].toString()) ?? 0.0,
          statusTransaction: dataTransaction['status_transaction'],
        );
      }),
    );
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
