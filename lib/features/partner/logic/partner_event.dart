import 'package:flutter_pos/model_data/model_partner.dart';

class PartnerEvent {}

class PartnerGetData extends PartnerEvent {
  final String? idBranch;
  final bool isCustomer;

  PartnerGetData({this.idBranch, this.isCustomer = true});
}

class PartnerSelectedPartner extends PartnerEvent {
  final ModelPartner selectedPartner;

  PartnerSelectedPartner({required this.selectedPartner});
}

class PartnerUploadDataPartner extends PartnerEvent {
  final String name;
  final String phone;
  final String email;

  PartnerUploadDataPartner({
    required this.name,
    required this.phone,
    required this.email,
  });
}

class PartnerStatusPartner extends PartnerEvent {}

class PartnerResetSelectedPartner extends PartnerEvent {}

class PartnerDeletePartner extends PartnerEvent {
  final String id;
  final PartnerType type;

  PartnerDeletePartner({required this.type, required this.id});
}

class PartnerSelectedBranch extends PartnerEvent {
  String idBranch;

  PartnerSelectedBranch({required this.idBranch});
}

class PartnerSearch extends PartnerEvent {
  final String search;

  PartnerSearch({required this.search});
}
