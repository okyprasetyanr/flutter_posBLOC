import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/style_and_transition_text/transition_navigator/transition_up_down.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<UserCredential?> authenticatorAccount({
  required BuildContext context,
  required String email,
  required String password,
  required bool signup,
}) async {
  final conn = await Connectivity().checkConnectivity();
  if (conn == ConnectivityResult.none) {
    customSnackBar(context, "Tidak ada koneksi!");
    return null;
  }
  // try {
  if (signup) {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } else {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uidUser = userCredential.user!.uid;
    final data = await FirebaseFirestore.instance
        .collection("users")
        .doc(uidUser)
        .get();
    final uidOwner = data['uid_owner'] ?? uidUser;
    final map = data.data()!;
    context.read<DataUserRepositoryCache>().dataAccount = await ModelUser(
      idUser: uidUser,
      statusUser: StatusDataX.fromString(map[FieldDataUser.status_user.name]),
      nameUser: map[FieldDataUser.name_user.name],
      emailUser: map[FieldDataUser.email_user.name],
      phoneUser: map[FieldDataUser.phone_user.name],
      roleUser: RoleTypeX.fromString(map[FieldDataUser.role_user.name])!,
      idBranchUser: map[FieldDataUser.id_branch.name],
      permissionsUser: {
        for (final permission in Permission.values)
          permission:
              StatusDataX.fromString(map[FieldDataUser.status_user.name]) ==
                  StatusData.Aktif
              ? map[FieldDataUser.permissions_user.name][permission.name] ??
                    false
              : false,
      },
      createdUser: parseDate(
        date: map[FieldDataUser.created_user.name],
        minute: false,
      ),
      noteUser: map[FieldDataUser.note_user.name],
    );

    final pref = await SharedPreferences.getInstance();
    await pref.setString('uid_owner', uidOwner);

    final repo = context.read<DataUserRepositoryCache>();
    await UserSession.init(repo);

    // Navigator.pop(context);
    // navUpDownTransition(context, '/mainmenu', true);
    return userCredential;
  }
  // } on FirebaseAuthException catch (e) {
  //   customSnackBar(context, "Terjadi kesalahan! Silahkan coba kembali.");
  //   customSnackBar(context, _mapFirebaseAuthCodeToKey(e));
  //   Navigator.pop(context);
  //   return null;
  // } catch (e) {
  //   customSnackBar(context, "Terjadi kesalahan");
  //   debugPrint("Log AuthAccont : $e");
  //   Navigator.pop(context);
  //   return null;
  // }
}

String _mapFirebaseAuthCodeToKey(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-email':
      return 'E-mail tidak sesuai!';
    case 'user-disabled':
      return 'Akun diBekukan!';
    case 'user-not-found':
      return 'E-mail tidak ditemukan!';
    case 'wrong-password':
      return 'Kata Sandi salah!';
    case 'too-many-requests':
      return 'Coba lagi setelah beberapa saat!';
    case 'operation-not-allowed':
      return 'Proses tidak diIjinkan';
    case 'email-already-in-use':
      return 'Email sudah digunakan!';
    case 'weak-password':
      return 'Kata Sandi bermasalah!';
    case 'network-request-failed':
      return 'Koneksi tidak tersedia!';
    default:
      return 'firebase-${e.code}';
  }
}
