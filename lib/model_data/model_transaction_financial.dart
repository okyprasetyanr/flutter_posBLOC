import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/from_and_to_map/convert_to_map.dart';
import 'package:flutter_pos/request/push_data.dart';

class ModelTransactionFinancial extends Equatable {
  final String invoice, idBranch, idFinancial, nameFinancial, note;
  final ListStatusTransaction? statusTransaction;
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
  ListStatusTransaction? get getstatusTransaction => statusTransaction;
  DateTime get getdate => date;
  double get getamount => amount;

  Future<void> pushDataFinancial(bool isIncome) async {
    pushWorkerDataFinancial(
      collection: isIncome ? 'transaction_income' : 'transaction_expense',
      id: invoice,
      dataTransFinancial: convertToMapTransactionIncome(
        ModelTransactionFinancial(
          statusTransaction: statusTransaction,
          idFinancial: idFinancial,
          nameFinancial: nameFinancial,
          idBranch: idBranch,
          invoice: invoice,
          date: date,
          note: note,
          amount: amount,
        ),
      ),
    );
  }

  Future<void> updateCancelDataFinancial(bool isIncome) async {
    FirebaseFirestore.instance
        .collection(isIncome ? 'transaction_income' : 'transaction_expense')
        .doc(invoice)
        .update({"status_transaction": statusTransaction});
  }

  ModelTransactionFinancial copyWith({
    String? invoice,
    String? idBranch,
    String? idFinancial,
    String? nameFinancial,
    String? note,
    ListStatusTransaction? statusTransaction,
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
