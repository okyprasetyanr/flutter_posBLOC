import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/function/function.dart';

enum PartnerType { customer, supplier }

class ModelPartner extends Equatable {
  final String _id;
  final String _name;
  final String _phone;
  final String _email;
  final String _address;
  final String _notes;
  final double _balance;
  final PartnerType _type;
  final DateTime _createdAt;
  final String _idBranch;

  const ModelPartner({
    required String idBranch,
    required String id,
    required String name,
    required String phone,
    required String email,
    required String address,
    required String notes,
    required double balance,
    required PartnerType type,
    required DateTime createdAt,
  }) : 
       _idBranch = idBranch,
       _id = id,
       _name = name,
       _phone = phone,
       _email = email,
       _address = address,
       _notes = notes,
       _createdAt = createdAt,
       _balance = balance,
       _type = type;

  bool get isCustomer => _type == PartnerType.customer;
  bool get isSupplier => _type == PartnerType.supplier;
  String get getid => _id;
  String get getname => _name;
  String get getphone => _phone;
  String get getemail => _email;
  String get getaddress => _address;
  String get getnotes => _notes;
  double get getbalance => _balance;
  String get getidBranch => _idBranch;
  PartnerType get gettype => _type;
  DateTime get getcreatedAt => _createdAt;

  ModelPartner copyWith({
    String? idBranch,
    String? uidUser,
    String? id,
    String? name,
    String? phone,
    String? email,
    String? address,
    String? notes,
    double? balance,
    PartnerType? type,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ModelPartner(
      idBranch: idBranch ?? this._idBranch,
      id: id ?? this._id,
      name: name ?? this._name,
      phone: phone ?? this._phone,
      email: email ?? this._email,
      address: address ?? this._address,
      notes: notes ?? this._notes,
      balance: balance ?? this._balance,
      type: type ?? this._type,
      createdAt: createdAt ?? this._createdAt,
    );
  }

  Map<String, dynamic> convertToMapPartner() {
    return {
      'id_branch': _idBranch,
      'uid_user': UserSession.ambilUidUser(),
      'id': _id,
      'name': _name,
      'phone': _phone,
      'email': _email,
      'address': _address,
      'notes': _notes,
      'balance': _balance,
      'type': _type.name,
      'createdAt': _createdAt.millisecondsSinceEpoch,
    };
  }

  factory ModelPartner.fromMap(Map<String, dynamic> map) {
    return ModelPartner(
      idBranch: map['id_branch'],
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'],
      address: map['address'],
      notes: map['notes'],
      balance: (map['balance'] ?? 0).toDouble(),
      type: PartnerType.values.firstWhere(
        (e) => e.name == map['type'],
        orElse: () => PartnerType.customer,
      ),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  Future<void> pushDataPartner() async {
    await FirebaseFirestore.instance
        .collection('${this._type.name}')
        .add(convertToMapPartner());
  }

  static List<ModelPartner> getDataListPartner(QuerySnapshot data) {
    return data.docs.map((map) {
      final dataPartner = map.data() as Map<String, dynamic>;
      return ModelPartner(
        idBranch: dataPartner['id_branch'],
        id: dataPartner['id'],
        name: dataPartner['name'],
        phone: dataPartner['phone'],
        email: dataPartner['email'],
        address: dataPartner['address'],
        notes: dataPartner['notes'],
        balance: (dataPartner['balance'] ?? 0).toDouble(),
        type: PartnerType.values.firstWhere(
          (e) => e.name == dataPartner['type'],
          orElse: () => PartnerType.customer,
        ),
        createdAt: DateTime.fromMillisecondsSinceEpoch(
          dataPartner['createdAt'],
        ),
      );
    }).toList();
  }

  @override
  List<Object?> get props => [
    _id,
    _name,
    _phone,
    _email,
    _address,
    _notes,
    _balance,
    _type,
    _createdAt,
    _idBranch,
  ];
}
