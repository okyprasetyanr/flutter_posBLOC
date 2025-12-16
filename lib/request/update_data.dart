import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/function/function.dart';

Future<void> updateLogoHeaderFoter({
  required String header,
  required String footer,
}) async {
  await FirebaseFirestore.instance
      .collection('companies')
      .doc(UserSession.getUidOwner())
      .set({'header': header, 'footer': footer}, SetOptions(merge: true));
}
