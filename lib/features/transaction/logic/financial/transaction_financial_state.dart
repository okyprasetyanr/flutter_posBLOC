import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';

class TransFinancialState {}

class TransFinancialInitial extends TransFinancialState {}

class TransFinancialLoaded extends TransFinancialState with EquatableMixin {
  final List<ModelFinancial> dataFinancial;
  final List<ModelBranch>? dataBranch;
  final ModelTransactionFinancial? selectedFinancial;
  final bool isIncome;
  final String? idBranch;

  TransFinancialLoaded({
    this.idBranch,
    this.dataBranch,
    this.dataFinancial = const [],
    this.selectedFinancial,
    this.isIncome = true,
  });

  TransFinancialLoaded copyWith({
    String? idBranch,
    List<ModelBranch>? dataBranch,
    List<ModelFinancial>? dataFinancial,
    ModelTransactionFinancial? selectedFinancial,
    bool? isIncome,
  }) => TransFinancialLoaded(
    idBranch: idBranch ?? this.idBranch,
    dataBranch: dataBranch ?? this.dataBranch,
    dataFinancial: dataFinancial ?? this.dataFinancial,
    isIncome: isIncome ?? this.isIncome,
    selectedFinancial: selectedFinancial,
  );

  @override
  List<Object?> get props => [
    idBranch,
    dataFinancial,
    selectedFinancial,
    isIncome,
    dataBranch,
  ];
}
