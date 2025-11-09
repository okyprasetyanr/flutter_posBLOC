import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/connection/firestore_worker.dart';
import 'package:flutter_pos/convert_to_map/convert_to_map.dart';
import 'package:flutter_pos/request/push_data.dart';

enum PartnerType { customer, supplier }

class ModelPartner extends Equatable {
  final String _id;
  final String _name;
  final String _phone;
  final String _email;
  final double _balance;
  final PartnerType _type;
  final String _createdAt;
  final String _idBranch;

  const ModelPartner({
    required String idBranch,
    required String id,
    required String name,
    required String phone,
    required String email,
    required double balance,
    required PartnerType type,
    required String createdAt,
  }) : _idBranch = idBranch,
       _id = id,
       _name = name,
       _phone = phone,
       _email = email,
       _createdAt = createdAt,
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
  String get getcreated => _createdAt;

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
    String? createdAt,
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
      createdAt: createdAt ?? this._createdAt,
    );
  }

  factory ModelPartner.fromMap(Map<String, dynamic> map) {
    return ModelPartner(
      idBranch: map['id_branch'],
      id: map['id_partner'],
      name: map['name_partner'],
      phone: map['phone_partner'],
      email: map['email'],
      balance: map['balance'],
      type: PartnerType.values.firstWhere(
        (e) => e.name == map['type'],
        orElse: () => PartnerType.customer,
      ),
      createdAt: map['created'],
    );
  }

  Future<void> pushDataPartner() async {
    pushWorkerDataPartner(
      collection: 'partner',
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
          createdAt: _createdAt,
        ),
      ),
    );
  }

  static List<ModelPartner> getDataListPartner(QuerySnapshot data) {
    return data.docs.map((map) {
      final dataPartner = map.data() as Map<String, dynamic>;
      return ModelPartner(
        idBranch: dataPartner['id_branch'],
        id: dataPartner['id_partner'],
        name: dataPartner['name_partner'],
        phone: dataPartner['phone_partner'],
        email: dataPartner['email_partner'],
        balance: dataPartner['balance_partner'],
        type: PartnerType.values.firstWhere(
          (e) => e.name == dataPartner['type'],
          orElse: () => PartnerType.customer,
        ),
        createdAt: dataPartner['created'],
      );
    }).toList();
  }

  @override
  List<Object?> get props => [
    _id,
    _name,
    _phone,
    _email,
    _balance,
    _type,
    _createdAt,
    _idBranch,
  ];
}
