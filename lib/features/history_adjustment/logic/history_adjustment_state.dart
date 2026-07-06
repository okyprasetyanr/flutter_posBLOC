import 'package:equatable/equatable.dart';
import 'package:flutter_pos/shared/model/model_branch.dart';
import 'package:flutter_pos/features/history_adjustment/model/model_transaction_adjustment_in.dart';
import 'package:flutter_pos/features/history_adjustment/model/model_transaction_adjustment_out.dart';

class HistoryAdjustmentState {}

class HistoryAdjustmentInitial extends HistoryAdjustmentState {}

class HistoryAdjustmentLoaded extends HistoryAdjustmentState
    with EquatableMixin {
  final String? idBranch;
  final List<ModelBranch> dataBranch;
  final ModelTransactionAdjustmentIn? selectedTransactionAdjustmentIn;
  final ModelTransactionAdjustmentOut? selectedTransactionAdjustmentOut;
  final List<ModelTransactionAdjustmentIn> dataAdjustmentIn;
  final List<ModelTransactionAdjustmentOut> dataAdjustmentOut;
  final List<ModelTransactionAdjustmentIn> filteredDataAdjustmentIn;
  final List<ModelTransactionAdjustmentOut> filteredDataAdjustmentOut;
  final bool isAdjustmentIn;
  final String search;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String displayDate;

  HistoryAdjustmentLoaded({
    this.idBranch,
    this.dataBranch = const [],
    this.dataAdjustmentIn = const [],
    this.dataAdjustmentOut = const [],
    this.filteredDataAdjustmentIn = const [],
    this.filteredDataAdjustmentOut = const [],
    this.isAdjustmentIn = true,
    this.search = "",
    this.dateStart,
    this.dateEnd,
    this.displayDate = "Hari ini",
    this.selectedTransactionAdjustmentIn,
    this.selectedTransactionAdjustmentOut,
  });

  HistoryAdjustmentLoaded copyWith({
    String? idBranch,
    List<ModelBranch>? dataBranch,
    ModelTransactionAdjustmentIn? selectedTransactionAdjustmentIn,
    ModelTransactionAdjustmentOut? selectedTransactionAdjustmentOut,
    List<ModelTransactionAdjustmentIn>? dataAdjustmentIn,
    List<ModelTransactionAdjustmentOut>? dataAdjustmentOut,
    List<ModelTransactionAdjustmentIn>? filteredDataAdjustmentIn,
    List<ModelTransactionAdjustmentOut>? filteredDataAdjustmentOut,
    bool? isAdjustmentIn,
    String? search,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? displayDate,
  }) {
    return HistoryAdjustmentLoaded(
      selectedTransactionAdjustmentIn: selectedTransactionAdjustmentIn,
      selectedTransactionAdjustmentOut: selectedTransactionAdjustmentOut,
      dataBranch: dataBranch ?? this.dataBranch,
      dataAdjustmentIn: dataAdjustmentIn ?? this.dataAdjustmentIn,
      dataAdjustmentOut: dataAdjustmentOut ?? this.dataAdjustmentOut,
      dateEnd: dateEnd ?? this.dateEnd,
      dateStart: dateStart ?? this.dateStart,
      displayDate: displayDate ?? this.displayDate,
      filteredDataAdjustmentIn:
          filteredDataAdjustmentIn ?? this.filteredDataAdjustmentIn,
      filteredDataAdjustmentOut:
          filteredDataAdjustmentOut ?? this.filteredDataAdjustmentOut,
      idBranch: idBranch ?? this.idBranch,
      isAdjustmentIn: isAdjustmentIn ?? this.isAdjustmentIn,
      search: search ?? this.search,
    );
  }

  @override
  List<Object?> get props => [
    idBranch,
    dataBranch,
    selectedTransactionAdjustmentIn,
    selectedTransactionAdjustmentOut,
    dataAdjustmentIn,
    dataAdjustmentOut,
    filteredDataAdjustmentIn,
    filteredDataAdjustmentOut,
    isAdjustmentIn,
    search,
    dateStart,
    dateEnd,
    displayDate,
  ];
}
