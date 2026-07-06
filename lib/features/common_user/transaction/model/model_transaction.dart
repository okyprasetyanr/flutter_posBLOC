import 'package:equatable/equatable.dart';
import 'package:flutter_pos/enum_and_string/enum.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_split.dart';

enum PaymentMethod { Cash, Debit, QRIS, Split }

class ModelTransaction extends Equatable {
  final DateTime _date;
  final String _invoice, _note, _idBranch;
  final String? _namePartner, _idPartner, _nameOperator, _idOperator;

  final LabelPaymentMethod _paymentMethod;
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

  factory ModelTransaction.empty() => ModelTransaction(
    idBranch: "",
    itemsOrdered: [],
    dataSplit: [],
    date: DateTime.now(),
    note: "",
    invoice: "",
    namePartner: null,
    idPartner: null,
    nameOperator: null,
    idOperator: null,
    paymentMethod: LabelPaymentMethod.Cash,
    discount: 0,
    ppn: 0,
    totalItem: 0,
    charge: 0,
    subTotal: 0,
    billPaid: 0,
    totalCharge: 0,
    totalPpn: 0,
    totalDiscount: 0,
    total: 0,
  );

  ModelTransaction({
    required String idBranch,
    ListStatusTransaction? statusTransaction,
    required List<ModelItemOrdered> itemsOrdered,
    required List<ModelSplit> dataSplit,
    required DateTime date,
    String? bankName,
    required String note,
    required String invoice,
    String? namePartner,
    String? idPartner,
    String? nameOperator,
    String? idOperator,
    required LabelPaymentMethod paymentMethod,
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
  String? get getnamePartner => _namePartner;
  String? get getidPartner => _idPartner;
  String? get getnameOperator => _nameOperator;
  String? get getidOperator => _idOperator;
  LabelPaymentMethod get getpaymentMethod => _paymentMethod;
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
    LabelPaymentMethod? paymentMethod,
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
