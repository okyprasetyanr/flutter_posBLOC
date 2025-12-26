// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';

class DataReportState {}

class DataReportInitial extends DataReportState {}

class DataReportLoaded extends DataReportState with EquatableMixin {
  final List<ModelBranch> dataBranch;
  final String? idBranch;
  final double totalNeto;
  final double totalSell;
  final int totalTransaction;
  final int totalItemTranasction;
  final double totalIncome;
  final double totalExpense;

  DataReportLoaded({
    this.dataBranch = const [],
    this.idBranch,
    this.totalNeto = 0,
    this.totalSell = 0,
    this.totalTransaction = 0,
    this.totalItemTranasction = 0,
    this.totalIncome = 0,
    this.totalExpense = 0,
  });

  DataReportLoaded copyWith({
    List<ModelBranch>? dataBranch,
    String? idBranch,
    double? totalNeto,
    double? totalSell,
    int? totalTransaction,
    int? totalItemTranasction,
    double? totalIncome,
    double? totalExpense,
  }) {
    return DataReportLoaded(
      dataBranch: dataBranch ?? this.dataBranch,
      idBranch: idBranch ?? this.idBranch,
      totalExpense: totalExpense ?? this.totalExpense,
      totalIncome: totalIncome ?? this.totalIncome,
      totalItemTranasction: totalItemTranasction ?? this.totalItemTranasction,
      totalNeto: totalNeto ?? this.totalNeto,
      totalSell: totalSell ?? this.totalSell,
      totalTransaction: totalTransaction ?? this.totalTransaction,
    );
  }

  @override
  List<Object?> get props => [
    dataBranch,
    idBranch,
    totalExpense,
    totalIncome,
    totalItemTranasction,
    totalNeto,
    totalSell,
    totalTransaction,
  ];
}
