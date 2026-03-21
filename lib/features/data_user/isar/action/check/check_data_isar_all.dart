import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_buy_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_sell_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_user_isar.dart';
import 'package:flutter_pos/from_and_to_map/from_isar.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/service/isar_service.dart';
import 'package:isar/isar.dart';

Future<bool> checkUserById_Isar(String idUser) async {
  return await isar.modelUserIsars.where().idUserEqualTo(idUser).count() > 0;
}

Future<ModelTransaction?> checkTransactionById_Isar(
  String invoice, {
  required bool isSell,
}) async {
  final dataTransaction = isSell
      ? await isar.modelTransactionSellIsars
            .where()
            .invoiceEqualTo(invoice)
            .findFirst()
      : await isar.modelTransactionBuyIsars
            .where()
            .invoiceEqualTo(invoice)
            .findFirst();
  ;
  return dataTransaction != null
      ? fromIsarTransaction(object: dataTransaction)
      : null;
}
