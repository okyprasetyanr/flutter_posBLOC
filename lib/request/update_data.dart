import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_company_isar.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/service/isar_service.dart';
import 'package:isar/isar.dart';

Future<void> updateLogoHeaderFoter({
  required String header,
  required String footer,
}) async {
  final company = await isar.modelCompanyIsars.where().findFirst();
  await isar.writeTxn(() async {
    company!.footer = footer;
    company.header = header;
    isar.modelCompanyIsars.put(company);
  });

  await FirebaseFirestore.instance
      .collection('companies')
      .doc(UserSession.getUidOwner())
      .set({'header': header, 'footer': footer}, SetOptions(merge: true));
}
