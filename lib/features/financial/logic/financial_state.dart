// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_financial.dart';

class FinancialState {}

class FinancialInitial extends FinancialState {}

class FinancialLoaded extends FinancialState with EquatableMixin {
  final String? idBranch;
  final List<ModelBranch>? dataBranch;
  final List<ModelFinancial> dataFinancial;
  final List<ModelFinancial>? filteredFinancial;
  final ModelFinancial? selectedFinancial;
  final bool isIncome;
  FinancialLoaded({
    this.selectedFinancial,
    this.isIncome = true,
    this.idBranch,
    this.dataBranch,
    this.dataFinancial = const [],
    this.filteredFinancial = const [],
  });

  FinancialLoaded copyWith({
    ModelFinancial? selectedFinancial,
    List<ModelFinancial>? filteredFinancial,
    bool? isIncome,
    String? idBranch,
    List<ModelBranch>? dataBranch,
    List<ModelFinancial>? dataFinancial,
  }) => FinancialLoaded(
    selectedFinancial: selectedFinancial,
    filteredFinancial: filteredFinancial ?? this.filteredFinancial,
    isIncome: isIncome ?? this.isIncome,
    idBranch: idBranch ?? this.idBranch,
    dataBranch: dataBranch ?? this.dataBranch,
    dataFinancial: dataFinancial ?? dataFinancial ?? this.dataFinancial,
  );

  @override
  List<Object?> get props => [
    selectedFinancial,
    isIncome,
    idBranch,
    idBranch,
    dataFinancial,
    filteredFinancial,
  ];
}
