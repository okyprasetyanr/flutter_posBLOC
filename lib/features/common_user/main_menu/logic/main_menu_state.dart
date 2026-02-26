// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';

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
  final List<ModelItemBatch> expiredItem;
  final ModelItem? lowStock;
  final ModelItem? bestSeller;
  final ModelItem? worstSeller;

  DataReportLoaded({
    this.expiredItem = const [],
    this.lowStock,
    this.bestSeller,
    this.worstSeller,
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
    List<ModelItemBatch>? expiredItem,
    ModelItem? lowStock,
    ModelItem? bestSeller,
    ModelItem? worstSeller,
  }) {
    return DataReportLoaded(
      bestSeller: bestSeller ?? this.bestSeller,
      expiredItem: expiredItem ?? this.expiredItem,
      lowStock: lowStock ?? this.lowStock,
      worstSeller: worstSeller ?? this.worstSeller,
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
    expiredItem,
    lowStock,
    bestSeller,
    worstSeller,
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
