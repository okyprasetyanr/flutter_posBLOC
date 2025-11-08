import 'package:flutter_pos/model_data/model_partner.dart';

class PartnerEvent {}

class PartnerGetData extends PartnerEvent {
  final String? idBranch;
  final bool isCustomer;

  PartnerGetData({this.idBranch, this.isCustomer = true});
}

class PartnerSelectedCustomer extends PartnerEvent {
  final ModelPartner selectedPartner;

  PartnerSelectedCustomer({required this.selectedPartner});
}

class PartnerUploadDataPartner extends PartnerEvent {
  final ModelPartner partner;

  PartnerUploadDataPartner({required this.partner});
}

class PartnerStatusPartner extends PartnerEvent {}

class PartnerResetSelectedPartner extends PartnerEvent {}

class PartnerDeletePartner extends PartnerEvent {
  final String id;
  final PartnerType type;

  PartnerDeletePartner({required this.type, required this.id});
}

class PartnerSelectedBranch extends PartnerEvent {
  String selectedIdBranch;

  PartnerSelectedBranch({required this.selectedIdBranch});
}
