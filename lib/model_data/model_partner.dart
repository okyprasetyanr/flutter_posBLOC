import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pos/from_and_to_map/convert_to_map.dart';
import 'package:flutter_pos/request/push_data.dart';

enum PartnerType { customer, supplier }

class ModelPartner extends Equatable {
  final String _idPartner;
  final String _namePartner;
  final String _phonePartner;
  final String _emailPartner;
  final double _balancePartner;
  final PartnerType _typePartner;
  final DateTime _datePartner;
  final String _idBranchPartner;

  const ModelPartner({
    required String idBranchPartner,
    required String idPartner,
    required String namePartner,
    required String phonePartner,
    required String emailPartner,
    required double balancePartner,
    required PartnerType typePartner,
    required DateTime date,
  }) : _idBranchPartner = idBranchPartner,
       _idPartner = idPartner,
       _namePartner = namePartner,
       _phonePartner = phonePartner,
       _emailPartner = emailPartner,
       _datePartner = date,
       _balancePartner = balancePartner,
       _typePartner = typePartner;

  bool get isCustomer => _typePartner == PartnerType.customer;
  bool get isSupplier => _typePartner == PartnerType.supplier;
  String get getidPartner => _idPartner;
  String get getnamePartner => _namePartner;
  String get getphonePartner => _phonePartner;
  String get getemailPartner => _emailPartner;
  double get getbalancePartner => _balancePartner;
  String get getidBranchPartner => _idBranchPartner;
  PartnerType get gettypePartner => _typePartner;
  DateTime get getdate => _datePartner;

  ModelPartner copyWith({
    String? idBranchPartner,
    String? uidUserPartner,
    String? idPartner,
    String? namePartner,
    String? phonePartner,
    String? emailPartner,
    String? notesPartner,
    double? balancePartner,
    PartnerType? typePartner,
    DateTime? date,
    String? updatedAt,
  }) {
    return ModelPartner(
      idBranchPartner: idBranchPartner ?? this._idBranchPartner,
      idPartner: idPartner ?? this._idPartner,
      namePartner: namePartner ?? this._namePartner,
      phonePartner: phonePartner ?? this._phonePartner,
      emailPartner: emailPartner ?? this._emailPartner,
      balancePartner: balancePartner ?? this._balancePartner,
      typePartner: typePartner ?? this._typePartner,
      date: date ?? this._datePartner,
    );
  }

  Future<void> pushDataPartner() async {
    debugPrint("Log ModelPartner: _date: $_datePartner");
    pushWorkerDataPartner(
      collection: 'partners',
      id: _idPartner,
      dataPartner: convertToMapPartner(
        ModelPartner(
          idBranchPartner: _idBranchPartner,
          idPartner: _idPartner,
          namePartner: _namePartner,
          phonePartner: _phonePartner,
          emailPartner: _emailPartner,
          balancePartner: _balancePartner,
          typePartner: _typePartner,
          date: _datePartner,
        ),
      ),
    );
  }

  factory ModelPartner.empty() {
    return ModelPartner(
      idBranchPartner: "",
      idPartner: "",
      namePartner: "",
      phonePartner: "",
      emailPartner: "",
      balancePartner: 0,
      typePartner: PartnerType.customer,
      date: DateTime(2010, 10, 12),
    );
  }

  @override
  List<Object?> get props => [
    _idPartner,
    _namePartner,
    _phonePartner,
    _emailPartner,
    _balancePartner,
    _typePartner,
    _datePartner,
    _idBranchPartner,
  ];
}
