import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/core/data_user/isar/collection/model_company_isar.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/batch/model/model_item_batch.dart';
import 'package:flutter_pos/core/service/isar_service.dart';
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

Future<void> updateItemBatch({required ModelItemBatch data}) async {
  await FirebaseFirestore.instance
      .collection('batch/${data.getinvoice}/items_batch')
      .doc(data.getidOrdered)
      .set({
        'price_item_final': data.getpriceItemFinal,
        'price_item_buy': data.getpriceItemBuy,
        'qty_item_in': data.getqtyItem_in,
        'qty_item_out': data.getqtyItem_out,
        'expired_date': data.getexpiredDate != null
            ? formatDate(date: data.getexpiredDate!, minute: false)
            : null,
      }, SetOptions(merge: true));
}

Future<void> updateCounter({
  required String field,
  required String idBranch,
}) async {
  await FirebaseFirestore.instance
      .collection('counter')
      .doc(UserSession.uid_owner)
      .collection('branch')
      .doc(idBranch)
      .set({field: FieldValue.increment(1)}, SetOptions(merge: true));
}
