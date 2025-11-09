import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pos/style_and_transition/transition_navigator/transition_up_down.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<String?> authenticatorAcoount({
  required BuildContext context,
  required String email,
  required String password,
}) async {
  // 1) cek koneksi dulu
  final conn = await Connectivity().checkConnectivity();
  if (conn == ConnectivityResult.none) {
    return 'no-connection';
  }

  try {
    final cred = await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((userCredential) async {
          String uid = userCredential.user!.uid;
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString('uid_user', uid);
          navUpDownTransition(context, '/mainmenu', true);
        });
    // sukses -> return null artinya ga ada error
    return cred;
  } on FirebaseAuthException catch (e) {
    return _mapFirebaseAuthCodeToKey(e);
  } catch (e) {
    return 'unknown-error';
  }
}

// helper: kembalikan key atau message yang konsisten
String _mapFirebaseAuthCodeToKey(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-email':
      return 'invalid-email';
    case 'user-disabled':
      return 'user-disabled';
    case 'user-not-found':
      return 'user-not-found';
    case 'wrong-password':
      return 'wrong-password';
    case 'too-many-requests':
      return 'too-many-requests';
    case 'operation-not-allowed':
      return 'operation-not-allowed';
    case 'email-already-in-use':
      return 'email-already-in-use';
    case 'weak-password':
      return 'weak-password';
    case 'network-request-failed':
      // kadang muncul kalau koneksi jelek / config salah
      return 'network-request-failed';
    default:
      return 'firebase-${e.code}'; // debug: bisa log e.message
  }
}
