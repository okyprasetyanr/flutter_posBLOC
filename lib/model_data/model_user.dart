import 'package:equatable/equatable.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/from_and_to_map/convert_to_map.dart';
import 'package:flutter_pos/request/push_data.dart';

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
  final StatusData statusUser;

  const ModelUser({
    this.statusUser = StatusData.Nonaktif,
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

  StatusData get getstatusUser => statusUser;
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
    StatusData? statusUser,
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

  Future<void> pushDataUser({String? uidOwner}) async {
    pushWorkerDataUser(
      collection: 'users',
      id: idUser!,
      dataUser: convertToMapUser(
        ModelUser(
          nameUser: nameUser,
          emailUser: emailUser,
          phoneUser: phoneUser,
          roleUser: roleUser,
          permissionsUser: permissionsUser,
        ),
        uidOwner,
      ),
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
