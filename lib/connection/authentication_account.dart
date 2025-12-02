import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pos/style_and_transition/transition_navigator/transition_up_down.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';
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

  try {
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
      final uidOwner = data['uid_owner'];

      final pref = await SharedPreferences.getInstance();
      await pref.setString('uid_owner', uidOwner ?? uidUser);
      await pref.setBool('fifo', true);

      Navigator.pop(context);
      navUpDownTransition(context, '/mainmenu', true);
      return userCredential;
    }
  } on FirebaseAuthException catch (e) {
    customSnackBar(context, _mapFirebaseAuthCodeToKey(e));
    return null;
  } catch (e) {
    customSnackBar(context, "Terjadi kesalahan");
    return null;
  }
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
