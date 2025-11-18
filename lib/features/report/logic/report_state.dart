import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_report.dart';

class ReportState {}

class ReportInitial extends ReportState {}

class ReportLoaded extends ReportState with EquatableMixin {
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String? idBranch;
  final ModelReport? report;
  final bool isSell;
  final List<ModelBranch> dataBranch;
  ReportLoaded({
    this.dataBranch = const [],
    this.report,
    this.dateStart,
    this.dateEnd,
    this.idBranch,
    this.isSell = true,
  });

  ReportLoaded copyWith({
    List<ModelBranch>? dataBranch,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? idBranch,
    ModelReport? report,
    bool? isSell,
  }) {
    return ReportLoaded(
      dataBranch: dataBranch ?? this.dataBranch,
      isSell: isSell ?? this.isSell,
      report: report ?? this.report,
      dateEnd: dateEnd,
      dateStart: dateStart,
      idBranch: idBranch ?? idBranch,
    );
  }

  @override
  List<Object?> get props => [
    dateStart,
    dateEnd,
    idBranch,
    report,
    isSell,
    dataBranch,
  ];
}
