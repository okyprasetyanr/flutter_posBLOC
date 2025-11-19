import 'package:equatable/equatable.dart';
import 'package:flutter_pos/request/push_data.dart';

class ModelTransactionFinancial extends Equatable {
  final String invoice, idBranch, idFinancial, nameFinancial, note;
  final DateTime date;
  final double total;

  ModelTransactionFinancial({
    required this.idFinancial,
    required this.nameFinancial,
    required this.idBranch,
    required this.invoice,
    required this.date,
    required this.note,
    required this.total,
  });

  String get getinvoice => invoice;
  String get getidBranch => idBranch;
  String get getidFinancial => idFinancial;
  String get getnameFinancial => nameFinancial;
  String get getnote => note;
  DateTime get getdate => date;
  double get gettotal => total;

  Future<void> pushDataFinancial() async {
    pushWorkerDataFinancial(
      collection: 'transaction_financial',
      id: invoice,
      dataTransFinancial: {
        'id_finance': idFinancial,
        'id_branch': idBranch,
        'invoice': invoice,
        'name_financial': nameFinancial,
        'get_note': note,
        'date': date,
        'total': total,
      },
    );
  }

  ModelTransactionFinancial copyWith({
    String? invoice,
    String? idBranch,
    String? idFinancial,
    String? nameFinancial,
    String? note,
    DateTime? date,
    double? TotpMultiFactorGenerator,
  }) => ModelTransactionFinancial(
    idFinancial: idFinancial ?? this.idFinancial,
    nameFinancial: nameFinancial ?? this.nameFinancial,
    idBranch: idBranch ?? this.idBranch,
    invoice: invoice ?? this.invoice,
    date: date ?? this.date,
    note: note ?? this.note,
    total: total,
  );

  @override
  List<Object?> get props => [
    invoice,
    idBranch,
    idFinancial,
    nameFinancial,
    note,
    date,
    total,
  ];
}
