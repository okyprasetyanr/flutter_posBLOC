import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/convert_to_map/convert_to_map.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_split.dart';

class ModelTransaction extends Equatable {
  final String _date,
      _invoice,
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
    required String date,
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
  String get getdate => _date;
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
    String? date,
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

  Future<void> pushDataTransaction({required bool isSell}) async {
    if (!isSell) {
      await FirebaseFirestore.instance
          .collection("items_batch")
          .doc(_invoice)
          .set({
            'invoice': _invoice,
            'items': convertToMapItemBatch(_itemsOrdered, _invoice),
          });
    }

    await FirebaseFirestore.instance
        .collection(isSell ? "transaction_sell" : "transaction_buy")
        .doc(_invoice)
        .set(
          convertToMapTransaction(
            ModelTransaction(
              idBranch: _idBranch,
              itemsOrdered: _itemsOrdered,
              dataSplit: _dataSplit,
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
            ),
          ),
        );
  }

  static List<ModelTransaction> getDataListTansaction(QuerySnapshot data) {
    return data.docs.map((map) {
      final dataTransaction = map.data() as Map<String, dynamic>;
      return ModelTransaction(
        idBranch: dataTransaction['id_branch'],
        bankName: dataTransaction['bank_name'],
        itemsOrdered: (dataTransaction['items_ordered'] as List<dynamic>? ?? [])
            .map(
              (items) => ModelItemOrdered.fromMap(
                items as Map<String, dynamic>,
                false,
              ),
            )
            .toList(),
        dataSplit: (dataTransaction['data_split'] as List<dynamic>? ?? [])
            .map((split) => ModelSplit.fromMap(split as Map<String, dynamic>))
            .toList(),
        date: dataTransaction['date'],
        note: dataTransaction['note'],
        invoice: dataTransaction['invoice'],
        namePartner: dataTransaction['name_partner'],
        idPartner: dataTransaction['id_partner'],
        nameOperator: dataTransaction['name_operator'],
        idOperator: dataTransaction['id_operator'],
        paymentMethod: dataTransaction['payment_method'],
        discount: int.tryParse(dataTransaction['discount'].toString())!,
        ppn: int.tryParse(dataTransaction['ppn'].toString())!,
        totalItem: int.tryParse(dataTransaction['total_item'].toString())!,
        charge: int.tryParse(dataTransaction['charge'].toString())!,
        subTotal: double.tryParse(dataTransaction['sub_total'].toString())!,
        billPaid: double.tryParse(dataTransaction['bill_paid'].toString())!,
        totalCharge: double.tryParse(
          dataTransaction['total_charge'].toString(),
        )!,
        totalPpn: double.tryParse(dataTransaction['total_ppn'].toString())!,
        totalDiscount: double.tryParse(
          dataTransaction['total_discount'].toString(),
        )!,
        total: double.tryParse(dataTransaction['total'].toString())!,
        statusTransaction: dataTransaction['status_transaction'],
      );
    }).toList();
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
