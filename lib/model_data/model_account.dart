import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/function/function.dart';

class UserModel {
  final String nameCompany, numTelpCompany;
  final DateTime join;
  UserModel({
    required this.nameCompany,
    required this.numTelpCompany,
    required this.join,
  });

  factory UserModel.getFirestore(DocumentSnapshot data) {
    Map dataUser = data.data() as Map<String, dynamic>;
    return UserModel(
      nameCompany: dataUser['name_company'],
      numTelpCompany: dataUser['phone_company'],
      join: parseDate(date: dataUser['join']),
    );
  }
}
