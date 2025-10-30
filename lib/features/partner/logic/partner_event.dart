import 'package:flutter_pos/model_data/model_partner.dart';

class PartnerEvent {}

class PartnerGetData extends PartnerEvent {
  final String? idBranch;
  final bool isCustomer;

  PartnerGetData({required this.idBranch,required this.isCustomer});
}

class PartnerSelectedCustomer extends PartnerEvent {
  final ModelPartner selectedPartner;

  PartnerSelectedCustomer({required this.selectedPartner});
}

class PartnerPushDataPartner extends PartnerEvent{
  final ModelPartner partner;

  PartnerPushDataPartner({required this.partner});
}

class PartnerStatusPartner extends PartnerEvent{}

class PartnerResetSelectedPartner extends PartnerEvent{}
