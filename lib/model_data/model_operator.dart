import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/request/push_data.dart';

enum RoleType { Pemilik, Kasir, Admin }

extension RoleTypeX on RoleType {
  int get id {
    switch (this) {
      case RoleType.Pemilik:
        return 0;
      case RoleType.Admin:
        return 1;
      case RoleType.Kasir:
        return 2;
    }
  }
}

RoleType fromIdRoleType(int id) {
  switch (id) {
    case 0:
      return RoleType.Pemilik;
    case 1:
      return RoleType.Admin;
    case 2:
      return RoleType.Kasir;
    default:
      return RoleType.Pemilik;
  }
}

class ModelOperator extends Equatable {
  final String idOperator;
  final String nameOperator;
  final String idBranchOperator;
  final int roleOperator;
  final String emailOperator;
  final String phoneOperator;
  final String note;
  final String uidOwner;
  final bool statusOperator;
  final DateTime created;

  ModelOperator({
    required this.idOperator,
    required this.nameOperator,
    required this.idBranchOperator,
    required this.roleOperator,
    required this.emailOperator,
    required this.phoneOperator,
    required this.statusOperator,
    required this.uidOwner,
    required this.created,
    required this.note,
  });

  String get getidOperator => idOperator;
  String get getnameOperator => nameOperator;
  String get getidBranchOperator => idBranchOperator;
  String get getemailOperator => emailOperator;
  String get getphoneOperator => phoneOperator;
  String get getuidOwner => uidOwner;
  String get getnote => note;
  bool get getstatusOperator => statusOperator;
  int get getroleOperator => roleOperator;
  DateTime get getcreated => created;

  ModelOperator copyWith({
    String? idOperator,
    String? nameOperator,
    String? idBranchOperator,
    int? roleOperator,
    String? emailOperator,
    String? phoneOperator,
    String? note,
    String? uidOwner,
    bool? statusOperator,
    DateTime? created,
  }) {
    return ModelOperator(
      idOperator: idOperator ?? this.idOperator,
      nameOperator: nameOperator ?? this.nameOperator,
      idBranchOperator: idBranchOperator ?? this.idBranchOperator,
      roleOperator: roleOperator ?? this.roleOperator,
      emailOperator: emailOperator ?? this.emailOperator,
      phoneOperator: phoneOperator ?? this.phoneOperator,
      statusOperator: statusOperator ?? this.statusOperator,
      uidOwner: uidOwner ?? this.uidOwner,
      created: created ?? this.created,
      note: note ?? this.note,
    );
  }

  Future<void> pushDataOperator() async {
    pushWorkerDataOperator(
      collection: 'operator',
      id: idOperator,
      dataOperator: {
        'id_perator': idOperator,
        'name_perator': nameOperator,
        'id_branch': idBranchOperator,
        'role_operator': roleOperator,
        'email_operator': emailOperator,
        'phone_operator': phoneOperator,
        'status_operator': statusOperator,
        'uid_owner': uidOwner,
        'created': created,
        'note': note,
        'uid_user': UserSession.getUidUser(),
      },
    );
  }

  factory ModelOperator.fromMap(Map<String, dynamic> data, id) {
    return ModelOperator(
      idOperator: data['id_operator'],
      nameOperator: data['name_operator'],
      idBranchOperator: data['id_branch'],
      roleOperator: data['role_operator'],
      emailOperator: data['email_operator'],
      phoneOperator: data['phone_operator'],
      statusOperator: data['status_operator'],
      uidOwner: data['uid_owner'],
      created: data['createSd'],
      note: data['note'],
    );
  }

  static List<ModelOperator> getDataListOperator(QuerySnapshot data) {
    return data.docs.map((map) {
      final data = map.data() as Map<String, dynamic>;
      return ModelOperator.fromMap(data, map.id);
    }).toList();
  }

  @override
  List<Object?> get props => [
    idOperator,
    nameOperator,
    idBranchOperator,
    roleOperator,
    emailOperator,
    phoneOperator,
    statusOperator,
    uidOwner,
    created,
    note,
  ];
}
