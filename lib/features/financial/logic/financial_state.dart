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
  final ModelFinancial? seletcedFinancial;
  final bool isIncome;
  FinancialLoaded({
    this.seletcedFinancial,
    this.isIncome = true,
    this.idBranch,
    this.dataBranch = const [],
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
    seletcedFinancial: selectedFinancial,
    filteredFinancial: filteredFinancial,
    isIncome: isIncome ?? this.isIncome,
    idBranch: idBranch ?? this.idBranch,
    dataBranch: dataBranch ?? this.dataBranch,
    dataFinancial: dataFinancial ?? dataFinancial ?? this.dataFinancial,
  );

  @override
  List<Object?> get props => [
    seletcedFinancial,
    isIncome,
    idBranch,
    idBranch,
    dataFinancial,
    filteredFinancial,
  ];
}
