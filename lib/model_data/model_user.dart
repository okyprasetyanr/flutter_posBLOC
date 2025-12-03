import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/request/push_data.dart';

enum RoleType { Pemilik, Kasir, Admin }

extension RoleTypeX on RoleType {
  static RoleType? fromString(String value) {
    try {
      return RoleType.values.firstWhere((e) => e.name == value);
    } catch (_) {
      return null;
    }
  }
}

enum Permission {
  Penjualan,
  Pembelian,
  Pendapatan,
  Pengeluaran,
  Data_Pelanggan,
  Data_Pemasok,
  Data_Pemasukan,
  Data_Pengeluaran,
  Riwayat_Penjualan,
  Riwayat_Pembelian,
  Riwayat_Pendapatan,
  Riwayat_Pengeluaran,
  Laporan,
}

class ModelUser extends Equatable {
  final String? idUser;
  final String nameUser;
  final String emailUser;
  final String phoneUser;
  final RoleType roleUser;
  final String? idBranchUser;
  final Map<Permission, bool> permissionsUser;
  final DateTime? createdUser;
  final String? noteUser;
  final bool statusUser;

  const ModelUser({
    this.statusUser = false,
    this.idUser,
    required this.nameUser,
    required this.emailUser,
    required this.phoneUser,
    required this.roleUser,
    this.idBranchUser,
    required this.permissionsUser,
    this.createdUser,
    this.noteUser,
  });

  bool get getstatusUser => statusUser;
  String? get getIdUser => idUser;
  String get getNameUser => nameUser;
  String get getEmailUser => emailUser;
  String get getPhoneUser => phoneUser;
  RoleType get getRoleUser => roleUser;
  String? get getIdBranchUser => idBranchUser;
  Map<Permission, bool> get getPermissionsUser => permissionsUser;
  DateTime? get getCreatedUser => createdUser;
  String? get getNoteUser => noteUser;

  ModelUser copyWith({
    bool? statusUser,
    String? idUser,
    String? nameUser,
    String? emailUser,
    String? phoneUser,
    RoleType? roleUser,
    String? idBranchUser,
    Map<Permission, bool>? permissionsUser,
    DateTime? createdUser,
    String? noteUser,
  }) {
    return ModelUser(
      statusUser: statusUser ?? this.statusUser,
      idUser: idUser ?? this.idUser,
      nameUser: nameUser ?? this.nameUser,
      emailUser: emailUser ?? this.emailUser,
      phoneUser: phoneUser ?? this.phoneUser,
      roleUser: roleUser ?? this.roleUser,
      idBranchUser: idBranchUser ?? this.idBranchUser,
      permissionsUser: permissionsUser ?? this.permissionsUser,
      createdUser: createdUser ?? this.createdUser,
      noteUser: noteUser ?? this.noteUser,
    );
  }

  static List<ModelUser> getDataListUser(
    QuerySnapshot<Map<String, dynamic>> data,
  ) {
    return data.docs
        .map((map) => ModelUser.fromMap(map.data(), map.id))
        .toList();
  }

  factory ModelUser.fromMap(Map<String, dynamic> data, String uid) {
    return ModelUser(
      idUser: uid,
      statusUser: data['status_user'],
      nameUser: data['name_user'],
      emailUser: data['email_user'],
      phoneUser: data['phone_user'],
      roleUser: RoleTypeX.fromString(data['role_user'])!,
      idBranchUser: data['id_branch'],
      permissionsUser: {
        for (final permission in Permission.values)
          permission: data['permissions_user'][permission.name] ?? false,
      },
      createdUser: parseDate(date: data['created_user'], minute: false),
      noteUser: data['note_user'],
    );
  }

  Map<String, dynamic> toMap(String? uidOwner) {
    return {
      'status_user': statusUser,
      'name_user': nameUser,
      'email_user': emailUser,
      'phone_user': phoneUser,
      'role_user': roleUser.name,
      'uid_owner': uidOwner ?? UserSession.uid_owner,
      'id_branch': idBranchUser,
      'permissions_user': {
        for (final permission in Permission.values)
          permission.name: permissionsUser[permission],
      },
      'created_user': formatDate(
        date: createdUser ?? DateTime.now(),
        minute: false,
      ),
      'note_user': noteUser,
    };
  }

  Future<void> pushDataUser({String? uidOwner}) async {
    pushWorkerDataUser(
      collection: 'users',
      id: idUser!,
      dataUser: toMap(uidOwner),
    );
  }

  @override
  List<Object?> get props => [
    idUser,
    nameUser,
    emailUser,
    phoneUser,
    roleUser,
    idBranchUser,
    permissionsUser,
    createdUser,
    noteUser,
  ];
}
