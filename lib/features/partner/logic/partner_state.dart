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
  final String? idBranch;
  final ModelPartner? selectedPartner;

  PartnerLoaded({
    this.dataBranch = const [],
    this.dataPartner = const [],
    this.selectedPartner,
    this.idBranch,
    this.isCustomer = false,
  });

  PartnerLoaded copyWith({
    List<ModelBranch>? dataBranch,
    List<ModelPartner>? dataPartner,
    ModelPartner? selectedPartner,
    String? idBranch,
    bool? isCustomer,
  }) {
    return PartnerLoaded(
      dataBranch: dataBranch ?? this.dataBranch,
      dataPartner: dataPartner ?? this.dataPartner,
      selectedPartner: selectedPartner ?? this.selectedPartner,
      idBranch: idBranch ?? this.idBranch,
      isCustomer: isCustomer ?? this.isCustomer,
    );
  }

  @override
  List<Object?> get props => [
    dataPartner,
    idBranch,
    selectedPartner,
    dataBranch,
    isCustomer,
  ];
}
