import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_operator.dart';

class OperatorState {}

class OperatorInitial extends OperatorState {}

class OperatorLoaded extends OperatorState with EquatableMixin {
  final List<ModelBranch>? dataBranch;
  final List<ModelOperator> dataOperator;
  final List<ModelOperator> filteredData;
  final String? idBranch;
  final int indexRole;
  final int indexStatus;
  final ModelOperator? selectedData;

  OperatorLoaded({
    this.dataBranch,
    this.dataOperator = const [],
    this.filteredData = const [],
    this.idBranch,
    this.indexRole = 0,
    this.indexStatus = 0,
    this.selectedData,
  });

  OperatorLoaded copyWith({
    List<ModelBranch>? dataBranch,
    List<ModelOperator>? dataOperator,
    List<ModelOperator>? filteredData,
    String? idBranch,
    int? indexRole,
    int? indexStatus,
    ModelOperator? selectedData,
  }) {
    return OperatorLoaded(
      dataBranch: dataBranch ?? this.dataBranch,
      dataOperator: dataOperator ?? this.dataOperator,
      filteredData: filteredData ?? this.filteredData,
      idBranch: idBranch ?? this.idBranch,
      indexRole: indexRole ?? this.indexRole,
      indexStatus: indexStatus ?? this.indexStatus,
      selectedData: selectedData ?? this.selectedData,
    );
  }

  @override
  List<Object?> get props => [
    dataBranch,
    indexStatus,
    dataOperator,
    filteredData,
    idBranch,
    indexRole,
    selectedData,
  ];
}
