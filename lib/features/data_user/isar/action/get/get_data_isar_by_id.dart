import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_expense_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_supplier_isar.dart';
import 'package:flutter_pos/features/hive_setup/saved_transaction/model_transaction_save.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_category_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_counter_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_income_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_customer_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_buy_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_expense_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_income_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_sell_isar.dart';
import 'package:flutter_pos/from_and_to_map/from_isar.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_counter.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_item_ordered_batch.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_split.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/service/isar_service.dart';
import 'package:hive/hive.dart';
import 'package:isar/isar.dart';

Future<List<ModelBatch>> getBatchIsar(String idBranch) async {
  return fromIsarBatch(
    await isar.modelBatchIsars.where().idBranchEqualTo(idBranch).findAll(),
  );
}

Future<List<ModelItemBatch>> getItemBatchIsar(String idBranch) async {
  final itemBatchProperty = await isar.modelBatchIsars
      .where()
      .idBranchEqualTo(idBranch)
      .itemsBatchProperty()
      .findAll();

  final flatData = itemBatchProperty.expand((list) => list).toList();

  return await fromIsarItemBatch(flatData);
}

Future<List<ModelCategory>> getCategoryIsar(String idBranch) async {
  final allCategory = await isar.modelCategoryIsars
      .filter()
      .idBranchEqualTo(idBranch)
      .findAll();

  return allCategory
      .map(
        (element) => ModelCategory(
          nameCategory: element.nameCategory,
          idCategory: element.idCategory,
          idBranch: element.idBranch,
        ),
      )
      .toList();
}

Future<ModelCounter> getCounterIsar(String idBranch) async {
  final allCounter = await isar.modelCounterIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findFirst();
  return ModelCounter(
    counterSellSaved: await Hive.box<TransactionSavedHive>(
      'saved_transaction',
    ).length,
    counterSell: allCounter!.counterSell,
    counterBuy: allCounter.counterBuy,
    counterIncome: allCounter.counterIncome,
    counterExpense: allCounter.counterExpense,
    idBranch: allCounter.idBranch,
  );
}

Future<List<ModelFinancial>> getIncomeIsar(String idBranch) async {
  final allIncome = await isar.modelIncomeIsars.where().findAll();
  return convertFinancial(income: true, object: allIncome);
}

Future<List<ModelFinancial>> getExpenseIsar(String idBranch) async {
  final allExpense = await isar.modelExpenseIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return convertFinancial(income: false, object: allExpense);
}

List<ModelFinancial> convertFinancial<T>({
  required bool income,
  required List<T> object,
}) {
  return (income
          ? object as List<ModelIncomeIsar>
          : object as List<ModelExpenseIsar>)
      .map(
        (e) => ModelFinancial(
          type: FinancialType.values.firstWhere(
            (element) => element.name == e.type,
          ),
          idFinancial: e.idFinancial,
          nameFinancial: e.nameFinancial,
          idBranch: e.idBranch,
        ),
      )
      .toList();
}

Future<List<ModelItem>> getItemIsar(String idBranch) async {
  final allItem = await fromIsarItem(
    await isar.modelItemIsars.where().idBranchEqualTo(idBranch).findAll(),
  );
  for (int i = 0; i < allItem.length; i++) {
    final item = allItem[i];
    double qty = item.getqtyItem;
    final batch = await getBatchIsar(idBranch);
    final allBatchItems = batch
        .expand((batch) => batch.getitems_batch)
        .where((element) => element.getidItem == item.getidItem);

    for (final itemBatch in allBatchItems) {
      qty += itemBatch.getqtyItem_in - itemBatch.getqtyItem_out;
    }
    allItem[i] = item.copyWith(qtyItem: qty);
  }
  return allItem;
}

Future<List<ModelPartner>> getCustomerIsar(String idBranch) async {
  final allCustomer = await isar.modelCustomerIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return fromPartner(customer: true, object: allCustomer);
}

Future<List<ModelPartner>> getSupplierIsar(String idBranch) async {
  final allSupplier = await isar.modelSupplierIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return fromPartner(customer: false, object: allSupplier);
}

List<ModelPartner> fromPartner<T>({required bool customer, required T object}) {
  return (customer
          ? object as List<ModelCustomerIsar>
          : object as List<ModelSupplierIsar>)
      .map(
        (e) => ModelPartner(
          idBranchPartner: e.idBranch,
          idPartner: e.idPartner,
          namePartner: e.namePartner,
          phonePartner: e.phonePartner,
          emailPartner: e.emailPartner,
          balancePartner: e.balancePartner,
          typePartner: PartnerType.values.firstWhere(
            (element) => element.name == e.typePartner,
          ),
          date: e.date,
        ),
      )
      .toList();
}

Future<List<ModelTransaction>> getTransactionBuyIsar(String idBranch) async {
  final allTransactionBuy = await isar.modelTransactionBuyIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return fromTransactionIsar(object: allTransactionBuy, sell: false);
}

Future<List<ModelTransaction>> getTransactionSellIsar(String idBranch) async {
  final allTransactionSell = await isar.modelTransactionSellIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return fromTransactionIsar(object: allTransactionSell, sell: true);
}

List<ModelTransaction> fromTransactionIsar<T>({
  required bool sell,
  required T object,
}) {
  return (sell
          ? object as List<ModelTransactionSellIsar>
          : object as List<ModelTransactionBuyIsar>)
      .map(
        (e) => ModelTransaction(
          idBranch: e.idBranch,
          itemsOrdered: e.itemsOrdered
              .map(
                (item) => ModelItemOrdered(
                  priceItemFinal: item.priceItemFinal,
                  subTotal: item.subTotal,
                  nameItem: item.nameItem,
                  idItem: item.idItem,
                  idBranch: item.idBranch,
                  idOrdered: item.idOrdered,
                  qtyItem: item.qtyItem,
                  priceItem: item.priceItem,
                  priceItemBuy: item.priceItemBuy,
                  discountItem: item.discountItem,
                  idCategoryItem: item.idCategoryItem,
                  note: item.note,
                  dateBuy: item.dateBuy,
                  expiredDate: item.expiredDate,
                  invoice: item.invoice,
                  itemOrderedBatch: item.itemOrderedBatch
                      .map(
                        (itemBatch) => ModelItemOrderedBatch(
                          price_itemBuy: itemBatch.price_itemBuy,
                          isNegative: itemBatch.isNegative,
                          id_ordered: itemBatch.id_ordered,
                          id_item: itemBatch.id_item,
                          invoice: itemBatch.invoice,
                          qty_item: itemBatch.qty_item,
                          price_item: itemBatch.price_item,
                        ),
                      )
                      .toList(),
                  condiment: item.condiment
                      .map(
                        (condiment) => ModelItemOrdered(
                          priceItemFinal: condiment.priceItemFinal,
                          subTotal: condiment.subTotal,
                          nameItem: condiment.nameItem,
                          idItem: condiment.idItem,
                          idBranch: condiment.idBranch,
                          idOrdered: condiment.idOrdered,
                          qtyItem: condiment.qtyItem,
                          priceItem: condiment.priceItem,
                          priceItemBuy: condiment.priceItemBuy,
                          discountItem: condiment.discountItem,
                          idCategoryItem: condiment.idCategoryItem,
                          note: condiment.note,
                          itemOrderedBatch: [],
                          condiment: [],
                        ),
                      )
                      .toList(),
                ),
              )
              .toList(),
          dataSplit: e.dataSplit
              .map(
                (split) => ModelSplit(
                  paymentName: LabelPaymentMethodX.fromString(
                    split.paymentName,
                  )!,
                  paymentTotal: split.paymentTotal,
                  paymentDebitName: split.paymentDebitName,
                  paymentInvoice: split.paymentInvoice,
                ),
              )
              .toList(),
          date: e.date,
          note: e.note,
          invoice: e.invoice,
          paymentMethod: LabelPaymentMethodX.fromString(e.paymentMethod)!,
          discount: e.discount,
          ppn: e.ppn,
          totalItem: e.totalItem,
          charge: e.charge,
          subTotal: e.subTotal,
          billPaid: e.billPaid,
          totalCharge: e.totalCharge,
          totalPpn: e.totalPpn,
          totalDiscount: e.totalDiscount,
          total: e.total,
          statusTransaction: ListStatusTransactionX.fromString(
            e.statusTransaction,
          ),
          bankName: e.bankName,
          idOperator: e.idOperator,
          nameOperator: e.nameOperator,
          idPartner: e.idPartner,
          namePartner: e.namePartner,
        ),
      )
      .toList();
}

Future<List<ModelTransactionFinancial>> getTransactionFinancialIncome(
  String idBranch,
) async {
  final allTransactionFinancialIncome = await isar
      .modelTransactionFinancialIncomeIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return fromTransactionFinancialIsar(
    object: allTransactionFinancialIncome,
    income: true,
  );
}

Future<List<ModelTransactionFinancial>> getTransactionFinancialExpense(
  String idBranch,
) async {
  final allTransactionFinancialExpense = await isar
      .modelTransactionFinancialExpenseIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return fromTransactionFinancialIsar(
    object: allTransactionFinancialExpense,
    income: false,
  );
}

List<ModelTransactionFinancial> fromTransactionFinancialIsar<T>({
  required List<T> object,
  required bool income,
}) {
  return (income
          ? object as List<ModelTransactionFinancialIncomeIsar>
          : object as List<ModelTransactionFinancialExpenseIsar>)
      .map(
        (e) => ModelTransactionFinancial(
          idFinancial: e.idFinancial,
          nameFinancial: e.nameFinancial,
          idBranch: e.idBranch,
          invoice: e.invoice,
          date: e.date,
          note: e.note,
          amount: e.amount,
          statusTransaction: ListStatusTransactionX.fromString(
            e.statusTransaction,
          ),
        ),
      )
      .toList();
}
