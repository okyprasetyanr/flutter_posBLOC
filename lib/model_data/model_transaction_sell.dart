import 'package:equatable/equatable.dart';

class ModelTransactionSell extends Equatable {
  final String _date,
      _invoice,
      _nameCustomer,
      _idCustomer,
      _nameOperator,
      _idOperator;
  final int _discount, _ppn;
  final double _totalItem, _subTotal, _charge, _total;

  ModelTransactionSell({
    required String date,
    required String invoice,
    required String nameCustomer,
    required String idCustomer,
    required String nameOperator,
    required String idOperator,
    required int discount,
    required int ppn,
    required double totalItem,
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
       _total = total;

  String get getdate => _date;
  String get getinvoice => _invoice;
  String get getnameCustomer => _nameCustomer;
  String get getidCustomer => _idCustomer;
  String get getnameOperator => _nameOperator;
  String get getidOperator => _idOperator;
  int get getdiscount => _discount;
  int get getppn => _ppn;
  double get gettotalItem => _totalItem;
  double get subTotal => _subTotal;
  double get getcharge => _charge;
  double get gettotal => _total;

  @override
  List<Object?> get props => throw UnimplementedError();
}
