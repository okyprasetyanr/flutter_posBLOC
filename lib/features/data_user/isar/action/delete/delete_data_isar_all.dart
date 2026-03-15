import 'package:flutter_pos/features/data_user/isar/action/delete/delete_data_isar_by_collection.dart';
import 'package:flutter_pos/service/isar_service.dart';

Future<void> deleteAllDataIsar() async {
  await isar.writeTxn(() async => await isar.clear());
}

Future<void> deleteAllCommonDataIsar() async {
  await deleteBatchCollection();
  await deleteCategoryCollection();
  await deleteItemCollection();
  await deletePartnerCollection();
  await deleteCounterCollection();
  await deleteFinancialCollection();
  await deleteTransactionBuyCollection();
  await deleteTransactionSellCollection();
  await deleteTransactionFinancialIncomeCollection();
  await deleteTransactionFinancialExpenseCollection();
}
