import 'package:equatable/equatable.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_partner.dart';

class PartnerState {}

class PartnerInitial extends PartnerState {}

class PartnerLoading extends PartnerState {}

class PartnerLoaded extends PartnerState with EquatableMixin {
  final List<ModelPartner>? dataPartner;
  final List<ModelBranch>? dataBranch;
  final bool isCustomer;
  final String? selectedIdBranch;
  final ModelPartner? selectedPartner;

  PartnerLoaded({
    this.dataBranch = const [],
    this.dataPartner = const [],
    this.selectedPartner,
    this.selectedIdBranch,
    this.isCustomer = false,
  });

  PartnerLoaded copyWith({
    List<ModelBranch>? dataBranch,
    List<ModelPartner>? dataPartner,
    ModelPartner? selectedPartner,
    String? selectedIdBranch,
    bool? isCustomer,
  }) {
    return PartnerLoaded(
      dataBranch: dataBranch ?? this.dataBranch,
      dataPartner: dataPartner ?? this.dataPartner,
      selectedPartner: selectedPartner,
      selectedIdBranch: selectedIdBranch ?? this.selectedIdBranch,
      isCustomer: isCustomer ?? this.isCustomer,
    );
  }

  @override
  List<Object?> get props => [
    dataPartner,
    selectedIdBranch,
    selectedPartner,
    dataBranch,
    isCustomer,
  ];
}
