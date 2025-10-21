import 'package:equatable/equatable.dart';

class ModelTransactionSell extends Equatable {
  final String _date,
      _invoice,
      _nameCustomer,
      _idCustomer,
      _nameOperator,
      _paymentMethod,
      _idOperator;
  final int _discount, _ppn, _totalItem;
  final double _subTotal, _charge, _total;

  ModelTransactionSell({
    required String date,
    required String invoice,
    required String nameCustomer,
    required String idCustomer,
    required String nameOperator,
    required String idOperator,
    required String paymentMethod,
    required int discount,
    required int ppn,
    required int totalItem,
    required double subTotal,
    required double charge,
    required double total,
  }) : _date = date,
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
       _total = total;

  String get getdate => _date;
  String get getinvoice => _invoice;
  String get getnameCustomer => _nameCustomer;
  String get getidCustomer => _idCustomer;
  String get getnameOperator => _nameOperator;
  String get getidOperator => _idOperator;
  String get getpaymentMethod => _paymentMethod;
  int get getdiscount => _discount;
  int get getppn => _ppn;
  int get gettotalItem => _totalItem;
  double get subTotal => _subTotal;
  double get getcharge => _charge;
  double get gettotal => _total;

  ModelTransactionSell copyWith({
    String? date,
    String? invoice,
    String? nameCustomer,
    String? idCustomer,
    String? nameOperator,
    String? idOperator,
    String? paymentMethod,
    int? discount,
    int? ppn,
    int? totalItem,
    double? subTotal,
    double? charge,
    double? total,
  }) {
    return ModelTransactionSell(
      paymentMethod: paymentMethod ?? _paymentMethod,
      date: date ?? _date,
      invoice: invoice ?? _invoice,
      nameCustomer: nameCustomer ?? _nameCustomer,
      idCustomer: idCustomer ?? _idCustomer,
      nameOperator: nameOperator ?? _nameOperator,
      idOperator: idOperator ?? _idOperator,
      discount: discount ?? _discount,
      ppn: ppn ?? _discount,
      totalItem: totalItem ?? _totalItem,
      subTotal: subTotal ?? _subTotal,
      charge: charge ?? _charge,
      total: total ?? _total,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
