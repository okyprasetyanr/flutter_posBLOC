import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_split.dart';

class ModelTransactionSell extends Equatable {
  final String _date,
      _invoice,
      _nameCustomer,
      _idCustomer,
      _nameOperator,
      _paymentMethod,
      _note,
      _idOperator;
  final String? bankName;
  final int _discount, _ppn, _totalItem, _charge;
  final double _subTotal,
      _total,
      _totalPpn,
      _totalDiscount,
      _totalCharge,
      _billPaid;
  final List<ModelSplit> _dataSplit;

  ModelTransactionSell({
    required List<ModelSplit> dataSplit,
    required String date,
    this.bankName,
    required String note,
    required String invoice,
    required String nameCustomer,
    required String idCustomer,
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
  }) : _date = date,
       _note = note,
       _invoice = invoice,
       _nameCustomer = nameCustomer,
       _idCustomer = idCustomer,
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
       _dataSplit = dataSplit;

  String get getdate => _date;
  String get getinvoice => _invoice;
  String get getnameCustomer => _nameCustomer;
  String get getidCustomer => _idCustomer;
  String get getnameOperator => _nameOperator;
  String get getidOperator => _idOperator;
  String get getpaymentMethod => _paymentMethod;
  String get getnote => _note;
  String? get getbankName => bankName;
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

  ModelTransactionSell copyWith({
    String? bankName,
    String? date,
    String? note,
    String? invoice,
    String? nameCustomer,
    String? idCustomer,
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
  }) {
    return ModelTransactionSell(
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
      nameCustomer: nameCustomer ?? _nameCustomer,
      idCustomer: idCustomer ?? _idCustomer,
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
    bankName,
    _dataSplit,
    _billPaid,
    _note,
    _date,
    _invoice,
    _nameCustomer,
    _idCustomer,
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
