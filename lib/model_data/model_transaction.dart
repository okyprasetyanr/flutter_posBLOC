import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/function/function.dart';
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
  String? get getstatusTransactioin => _statusTransaction;

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

  List<Map<String, dynamic>> convertToMapSplit(List<ModelSplit> split) {
    return split.map((dataSplit) {
      return {
        'payment_debit_name': dataSplit.getpaymentDebitName,
        'payment_name': dataSplit.getpaymentName,
        'payment_total': dataSplit.getpaymentTotal,
      };
    }).toList();
  }

  Map<String, dynamic> convertToMapTransaction() {
    return {
      'id_branch': _idBranch,
      'uid_user': UserSession.ambilUidUser(),
      'items_ordered': convertToMapItemOrdered(),
      'bank_name': _bankName ?? "",
      'data_split': convertToMapSplit(_dataSplit),
      'bill_paid': _billPaid,
      'note': _note,
      'total_charge': _totalCharge,
      'total_discount': _totalDiscount,
      'total_ppn': _totalPpn,
      'payment_method': _paymentMethod,
      'date': _date,
      'invoice': _invoice,
      'name_partner': _namePartner,
      'id_partner': _idPartner,
      'name_operator': _nameOperator,
      'id_operator': _idOperator,
      'discount': _discount,
      'ppn': _ppn,
      'total_item': _totalItem,
      'sub_total': _subTotal,
      'charge': _charge,
      'total': _total,
      'status_transaction': _statusTransaction,
    };
  }

  List<Map<String, dynamic>> convertToMapItemOrdered() {
    return _itemsOrdered.map((item) {
      return {
        'sub_total': item.getsubTotal,
        'name_item': item.getnameItem,
        'id_item': item.getidItem,
        'id_branch': item.getidBranch,
        'id_ordered': item.getidOrdered,
        'qty_item': item.getqtyItem,
        'price_item': item.getpriceItem,
        'price_item_final': item.getpriceItemFinal,
        'discount_item': item.getdiscountItem,
        'id_category_item': item.getidCategoryItem,
        'id_condiment': item.getidCondiment,
        'note': item.getNote,
        'condiment': convertToMapCondimentOrdered(item.getCondiment),
      };
    }).toList();
  }

  List<Map<String, dynamic>> convertToMapCondimentOrdered(
    List<ModelItemOrdered> itemsCondiment,
  ) {
    return itemsCondiment.map((condiment) {
      return {
        'sub_total': condiment.getsubTotal,
        'name_item': condiment.getnameItem,
        'id_item': condiment.getidItem,
        'id_branch': condiment.getidBranch,
        'id_ordered': condiment.getidOrdered,
        'qty_item': condiment.getqtyItem,
        'price_item': condiment.getpriceItem,
        'price_item_final': condiment.getpriceItemFinal,
        'discount_item': condiment.getdiscountItem,
        'id_category_item': condiment.getidCategoryItem,
        'id_condiment': condiment.getidCondiment,
        'note': condiment.getNote,
        'condiment': {},
      };
    }).toList();
  }

  Future<void> pushDataTransaction({required bool isSell}) async {
    await FirebaseFirestore.instance
        .collection(isSell ? "transaction_sell" : "transaction_buy")
        .doc(_invoice)
        .set(convertToMapTransaction());
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
