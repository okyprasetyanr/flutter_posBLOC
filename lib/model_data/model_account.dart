import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String nameCompany, numTelpCompany, join;
  UserModel({
    required this.nameCompany,
    required this.numTelpCompany,
    required this.join,
  });

  factory UserModel.getFirestore(DocumentSnapshot data) {
    Map dataUser = data.data() as Map<String, dynamic>;
    return UserModel(
      nameCompany: dataUser['nama_perusahaan'],
      numTelpCompany: dataUser['no_telp_perusahaan'],
      join: dataUser['bergabung'],
    );
  }
}
