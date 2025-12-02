import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/request/push_data.dart';

class ModelTransactionFinancial extends Equatable {
  final String invoice, idBranch, idFinancial, nameFinancial, note;
  final String? statusTransaction;
  final DateTime date;
  final double amount;

  ModelTransactionFinancial({
    this.statusTransaction,
    required this.idFinancial,
    required this.nameFinancial,
    required this.idBranch,
    required this.invoice,
    required this.date,
    required this.note,
    required this.amount,
    re,
  });

  String get getinvoice => invoice;
  String get getidBranch => idBranch;
  String get getidFinancial => idFinancial;
  String get getnameFinancial => nameFinancial;
  String get getnote => note;
  String? get getstatusTransaction => statusTransaction;
  DateTime get getdate => date;
  double get getamount => amount;

  Future<void> pushDataFinancial(bool isIncome) async {
    pushWorkerDataFinancial(
      collection: isIncome ? 'transaction_income' : 'transaction_expense',
      id: invoice,
      dataTransFinancial: {
        'status_transaction': statusTransaction,
        'id_financial': idFinancial,
        'id_branch': idBranch,
        'name_financial': nameFinancial,
        'note': note,
        'date': formatDate(date: date, minute: true),
        'amount': amount,
        'uid_owner': UserSession.getUidOwner(),
      },
    );
  }

  Future<void> updateCancelDataFinancial(bool isIncome) async {
    FirebaseFirestore.instance
        .collection(isIncome ? 'transaction_income' : 'transaction_expense')
        .doc(invoice)
        .update({"status_transaction": statusTransaction});
  }

  factory ModelTransactionFinancial.fromMap(
    Map<String, dynamic> data,
    String id,
  ) {
    return ModelTransactionFinancial(
      statusTransaction: data['status_transaction'],
      idFinancial: data['id_financial'],
      nameFinancial: data['name_financial'],
      idBranch: data['id_branch'],
      invoice: id,
      date: parseDate(date: data['date']),
      note: data['date'],
      amount: data['amount'].toDouble(),
    );
  }

  static List<ModelTransactionFinancial> getDataListTransFinancial(
    QuerySnapshot data,
  ) {
    return data.docs.map((map) {
      final dataFinancial = map.data() as Map<String, dynamic>;
      return ModelTransactionFinancial.fromMap(dataFinancial, map.id);
    }).toList();
  }

  ModelTransactionFinancial copyWith({
    String? invoice,
    String? idBranch,
    String? idFinancial,
    String? nameFinancial,
    String? note,
    String? statusTransaction,
    DateTime? date,
    double? amount,
  }) => ModelTransactionFinancial(
    statusTransaction: statusTransaction,
    idFinancial: idFinancial ?? this.idFinancial,
    nameFinancial: nameFinancial ?? this.nameFinancial,
    idBranch: idBranch ?? this.idBranch,
    invoice: invoice ?? this.invoice,
    date: date ?? this.date,
    note: note ?? this.note,
    amount: amount ?? this.amount,
  );

  @override
  List<Object?> get props => [
    statusTransaction,
    invoice,
    idBranch,
    idFinancial,
    nameFinancial,
    note,
    date,
    amount,
  ];
}
