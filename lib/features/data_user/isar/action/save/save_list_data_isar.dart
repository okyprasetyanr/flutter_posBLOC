import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_adjustment_in_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_adjustment_out_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_category_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_counter_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_customer_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_expense_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_income_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_supplier_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_buy_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_expense_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_income_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_sell_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_user_isar.dart';
import 'package:flutter_pos/from_and_to_map/convert_to_isar.dart';
import 'package:flutter_pos/model_data/model_transaction_adjustment_in.dart';
import 'package:flutter_pos/model_data/model_transaction_adjustment_out.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_counter.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/service/isar_service.dart';

Future<void> saveAdjustment_In_List_Isar(
  List<ModelTransactionAdjustmentIn> data,
) async {
  List<ModelTransactionAdjustmentInIsar> convertedData = [];
  for (final rawData in data) {
    convertedData.add(await convertAdjustmentIn(rawData));
  }
  await isar.writeTxn(
    () => isar.modelTransactionAdjustmentInIsars.putAll(convertedData),
  );
}

Future<void> saveAdjustment_Out_List_Isar(
  List<ModelTransactionAdjustmentOut> data,
) async {
  List<ModelTransactionAdjustmentOutIsar> convertedData = [];
  for (final rawData in data) {
    convertedData.add(await convertAdjustmentOut(rawData));
  }
  await isar.writeTxn(
    () => isar.modelTransactionAdjustmentOutIsars.putAll(convertedData),
  );
}

Future<void> saveIncome_List_Isar(List<ModelFinancial> data) async {
  List<ModelIncomeIsar> convertedData = [];
  for (final rawData in data) {
    convertedData.add(await convertFinancial(rawData, ModelIncomeIsar.new));
  }
  await isar.writeTxn(() => isar.modelIncomeIsars.putAll(convertedData));
}

Future<void> saveExpense_List_Isar(List<ModelFinancial> data) async {
  List<ModelExpenseIsar> convertedData = [];
  for (final rawData in data) {
    convertedData.add(await convertFinancial(rawData, ModelExpenseIsar.new));
  }
  await isar.writeTxn(() => isar.modelExpenseIsars.putAll(convertedData));
}

Future<void> saveTransactionSell_List_Isar(List<ModelTransaction> data) async {
  List<ModelTransactionSellIsar> convertedData = [];
  for (final rawData in data) {
    convertedData.add(
      await convertTransaction(rawData, ModelTransactionSellIsar.new),
    );
  }
  await isar.writeTxn(
    () => isar.modelTransactionSellIsars.putAll(convertedData),
  );
}

Future<void> saveTransactionBuy_List_Isar(List<ModelTransaction> data) async {
  List<ModelTransactionBuyIsar> convertedData = [];
  for (final rawData in data) {
    convertedData.add(
      await convertTransaction(rawData, ModelTransactionBuyIsar.new),
    );
  }
  await isar.writeTxn(
    () => isar.modelTransactionBuyIsars.putAll(convertedData),
  );
}

Future<void> saveTransactionFinancialncome_List_Isar(
  List<ModelTransactionFinancial> data,
) async {
  List<ModelTransactionFinancialIncomeIsar> convertedData = [];
  for (final rawData in data) {
    convertedData.add(
      await convertTransactionFinancial(
        rawData,
        ModelTransactionFinancialIncomeIsar.new,
      ),
    );
  }
  await isar.writeTxn(
    () => isar.modelTransactionFinancialIncomeIsars.putAll(convertedData),
  );
}

Future<void> saveTransactionFinancialExpense_List_Isar(
  List<ModelTransactionFinancial> data,
) async {
  List<ModelTransactionFinancialExpenseIsar> convertedData = [];
  for (final rawData in data) {
    convertedData.add(
      await convertTransactionFinancial(
        rawData,
        ModelTransactionFinancialExpenseIsar.new,
      ),
    );
  }
  await isar.writeTxn(
    () => isar.modelTransactionFinancialExpenseIsars.putAll(convertedData),
  );
}

Future<void> saveCounter_List_Isar(List<ModelCounter> data) async {
  List<ModelCounterIsar> convertedData = [];
  for (final rawData in data) {
    convertedData.add(await convertCounter(rawData));
  }
  await isar.writeTxn(() => isar.modelCounterIsars.putAll(convertedData));
}

Future<void> saveItem_List_Isar(List<ModelItem> data) async {
  List<ModelItemIsar> convertedData = [];
  for (final rawData in data) {
    convertedData.add(await convertItem(rawData));
  }
  await isar.writeTxn(() => isar.modelItemIsars.putAll(convertedData));
}

Future<void> saveCategory_List_Isar(List<ModelCategory> data) async {
  List<ModelCategoryIsar> convertedData = [];
  for (final rawData in data) {
    convertedData.add(await convertCategory(rawData));
  }
  await isar.writeTxn(() => isar.modelCategoryIsars.putAll(convertedData));
}

Future<void> saveCustomer_List_Isar(List<ModelPartner> data) async {
  List<ModelCustomerIsar> convertedData = [];
  for (final rawData in data) {
    convertedData.add(await convertPartner(rawData, ModelCustomerIsar.new));
  }
  await isar.writeTxn(() => isar.modelCustomerIsars.putAll(convertedData));
}

Future<void> saveSupplier_List_Isar(List<ModelPartner> data) async {
  List<ModelSupplierIsar> convertedData = [];
  for (final rawData in data) {
    convertedData.add(await convertPartner(rawData, ModelSupplierIsar.new));
  }
  await isar.writeTxn(() => isar.modelSupplierIsars.putAll(convertedData));
}

Future<void> saveBatch_List_Isar(List<ModelBatch> data) async {
  List<ModelBatchIsar> convertedData = [];
  for (final rawData in data) {
    convertedData.add(await convertBatch(rawData));
  }
  await isar.writeTxn(() => isar.modelBatchIsars.putAll(convertedData));
}

Future<void> saveUser_List_Isar(List<ModelUser> data) async {
  List<ModelUserIsar> convertedData = [];
  for (final rawData in data) {
    convertedData.add(await convertUser(rawData, ModelUserIsar.new));
  }
  await isar.writeTxn(() => isar.modelUserIsars.putAll(convertedData));
}
