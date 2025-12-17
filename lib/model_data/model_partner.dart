import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pos/from_and_to_map/convert_to_map.dart';
import 'package:flutter_pos/request/push_data.dart';

enum PartnerType { customer, supplier }

class ModelPartner extends Equatable {
  final String _id;
  final String _name;
  final String _phone;
  final String _email;
  final double _balance;
  final PartnerType _type;
  final DateTime _date;
  final String _idBranch;

  const ModelPartner({
    required String idBranch,
    required String id,
    required String name,
    required String phone,
    required String email,
    required double balance,
    required PartnerType type,
    required DateTime date,
  }) : _idBranch = idBranch,
       _id = id,
       _name = name,
       _phone = phone,
       _email = email,
       _date = date,
       _balance = balance,
       _type = type;

  bool get isCustomer => _type == PartnerType.customer;
  bool get isSupplier => _type == PartnerType.supplier;
  String get getid => _id;
  String get getname => _name;
  String get getphone => _phone;
  String get getemail => _email;
  double get getbalance => _balance;
  String get getidBranch => _idBranch;
  PartnerType get gettype => _type;
  DateTime get getdate => _date;

  ModelPartner copyWith({
    String? idBranch,
    String? uidUser,
    String? id,
    String? name,
    String? phone,
    String? email,
    String? notes,
    double? balance,
    PartnerType? type,
    DateTime? date,
    String? updatedAt,
  }) {
    return ModelPartner(
      idBranch: idBranch ?? this._idBranch,
      id: id ?? this._id,
      name: name ?? this._name,
      phone: phone ?? this._phone,
      email: email ?? this._email,
      balance: balance ?? this._balance,
      type: type ?? this._type,
      date: date ?? this._date,
    );
  }

  Future<void> pushDataPartner() async {
    debugPrint("Log ModelPartner: _date: $_date");
    pushWorkerDataPartner(
      collection: 'partners',
      id: _id,
      dataPartner: convertToMapPartner(
        ModelPartner(
          idBranch: _idBranch,
          id: _id,
          name: _name,
          phone: _phone,
          email: _email,
          balance: _balance,
          type: _type,
          date: _date,
        ),
      ),
    );
  }

  @override
  List<Object?> get props => [
    _id,
    _name,
    _phone,
    _email,
    _balance,
    _type,
    _date,
    _idBranch,
  ];
}
