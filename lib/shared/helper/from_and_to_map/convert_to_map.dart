import 'package:flutter_pos/shared/helper/enum_and_string/enum.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/history_adjustment/model/model_transaction_adjustment_in.dart';
import 'package:flutter_pos/features/history_adjustment/model/model_transaction_adjustment_out.dart';
import 'package:flutter_pos/features/batch/model/model_batch.dart';
import 'package:flutter_pos/features/inventory/model/model_category.dart';
import 'package:flutter_pos/shared/model/model_counter.dart';
import 'package:flutter_pos/features/financial/model/model_financial.dart';
import 'package:flutter_pos/features/inventory/model/model_item.dart';
import 'package:flutter_pos/features/batch/model/model_item_batch.dart';
import 'package:flutter_pos/features/transaction/model/model_item_ordered.dart';
import 'package:flutter_pos/features/batch/model/model_item_ordered_batch.dart';
import 'package:flutter_pos/features/partner/model/model_partner.dart';
import 'package:flutter_pos/features/transaction/model/model_split.dart';
import 'package:flutter_pos/features/transaction/model/model_transaction.dart';
import 'package:flutter_pos/features/history_financial/model/model_transaction_financial.dart';
import 'package:flutter_pos/features/operator/model/model_user.dart';

Map<String, dynamic> convertToMapSplit(ModelSplit _dataSplit) {
  return {
    FieldDataSplit.payment_debit_name.name: _dataSplit.getpaymentDebitName,
    FieldDataSplit.payment_name.name: _dataSplit.getpaymentName.name,
    FieldDataSplit.payment_total.name: _dataSplit.getpaymentTotal,
  };
}

Map<String, dynamic> convertToMapUser(ModelUser user, String? uidUser) {
  return {
    FieldDataUser.status_user.name: user.getstatusUser.name,
    FieldDataUser.name_user.name: user.getNameUser,
    FieldDataUser.email_user.name: user.getEmailUser,
    FieldDataUser.phone_user.name: user.getPhoneUser,
    FieldDataUser.role_user.name: user.getRoleUser.name,
    FieldDataUser.uid_owner.name: user.getRoleUser == RoleType.Pemilik
        ? null
        : UserSession.getUidOwner(),
    FieldDataUser.id_branch.name: user.getRoleUser == RoleType.Pemilik
        ? null
        : user.getIdBranchUser,
    FieldDataUser.permissions_user.name: {
      for (final permission in Permission.values)
        permission.name: user.permissionsUser[permission],
    },
    FieldDataUser.created_user.name: formatDate(
      date: user.getCreatedUser ?? DateTime.now(),
      minute: false,
    ),
    FieldDataUser.note_user.name: user.getNoteUser,
  };
}

Map<String, dynamic> convertToMapTransactionSaveHive(
  ModelTransaction transaction,
) {
  return {
    ...convertToMapTransaction(transaction),

    "items_ordered": transaction.getitemsOrdered.map((item) {
      return {
        ...convertToMapItemOrdered(item, saved: true),

        "condiment": item.getCondiment
            .map((condiment) => convertToMapItemOrdered(condiment, saved: true))
            .toList(),
      };
    }).toList(),

    "data_split": transaction.getdataSplit
        .map((split) => convertToMapSplit(split))
        .toList(),
  };
}

Map<String, dynamic> convertToMapTransaction(ModelTransaction transaction) {
  return {
    FieldDataTransaction.id_branch.name: transaction.getidBranch,
    FieldDataTransaction.uid_owner.name: UserSession.getUidOwner(),
    FieldDataTransaction.bank_name.name: transaction.getbankName,
    FieldDataTransaction.bill_paid.name: transaction.getbillPaid,
    FieldDataTransaction.note.name: transaction.getnote,
    FieldDataTransaction.total_charge.name: transaction.gettotalCharge,
    FieldDataTransaction.total_discount.name: transaction.gettotalDiscount,
    FieldDataTransaction.total_ppn.name: transaction.gettotalPpn,
    FieldDataTransaction.payment_method.name: transaction.getpaymentMethod.name,
    FieldDataTransaction.date.name: formatDate(date: transaction.getdate),
    FieldDataTransaction.name_partner.name: transaction.getnamePartner,
    FieldDataTransaction.id_partner.name: transaction.getidPartner,
    FieldDataTransaction.name_operator.name: transaction.getnameOperator,
    FieldDataTransaction.id_operator.name: transaction.getidOperator,
    FieldDataTransaction.discount.name: transaction.getdiscount,
    FieldDataTransaction.ppn.name: transaction.getppn,
    FieldDataTransaction.total_item.name: transaction.gettotalItem,
    FieldDataTransaction.sub_total.name: transaction.getsubTotal,
    FieldDataTransaction.charge.name: transaction.getcharge,
    FieldDataTransaction.total.name: transaction.gettotal,
    FieldDataTransaction.status_transaction.name:
        transaction.getstatusTransaction!.name,
  };
}

Map<String, dynamic> convertToMapItemOrdered(
  ModelItemOrdered _itemsOrdered, {
  bool saved = false,
}) {
  final data = {
    if (_itemsOrdered.getinvoice != null)
      FieldDataItemOrdered.invoice.name: _itemsOrdered.getinvoice,

    FieldDataItemOrdered.sub_total.name: _itemsOrdered.getsubTotal,
    FieldDataItemOrdered.name_item.name: _itemsOrdered.getnameItem,
    FieldDataItemOrdered.id_item.name: _itemsOrdered.getidItem,
    FieldDataItemOrdered.id_branch.name: _itemsOrdered.getidBranch,
    FieldDataItemOrdered.qty_item.name: _itemsOrdered.getqtyItem,
    FieldDataItemOrdered.price_item.name: _itemsOrdered.getpriceItem,
    FieldDataItemOrdered.price_item_final.name: _itemsOrdered.getpriceItemFinal,
    FieldDataItemOrdered.price_item_buy.name: _itemsOrdered.getpriceItemBuy,
    FieldDataItemOrdered.discount_item.name: _itemsOrdered.getdiscountItem,
    FieldDataItemOrdered.id_category_item.name: _itemsOrdered.getidCategoryItem,
    FieldDataItemOrdered.note.name: _itemsOrdered.getNote,
  };
  if (saved) {
    data[FieldDataItemOrdered.id_ordered.name] = _itemsOrdered.getidOrdered;
    data[FieldDataItemOrdered.custom_price_status.name] =
        _itemsOrdered.getcustomPrice;
  }
  return data;
}

Map<String, dynamic> convertToMapItemOrderedBatch(
  ModelItemOrderedBatch _itemsOrderedBatch,
) {
  return {
    FieldDataItemOrderedBatch.id_item.name: _itemsOrderedBatch.getid_Item,
    FieldDataItemOrderedBatch.invoice.name: _itemsOrderedBatch.getinvoice,
    FieldDataItemOrderedBatch.price_item.name: _itemsOrderedBatch.getprice_item,
    FieldDataItemOrderedBatch.qty_item.name: _itemsOrderedBatch.getqty_item,
    FieldDataItemOrderedBatch.price_itemBuy.name:
        _itemsOrderedBatch.getprice_itemBuy,
  };
}

Map<String, dynamic> convertToMapTransactionIncome(
  ModelTransactionFinancial transfinancial,
) {
  return {
    FieldDataTransFinancial.status_transaction.name:
        transfinancial.statusTransaction!.name,
    FieldDataTransFinancial.id_financial.name: transfinancial.getidFinancial,
    FieldDataTransFinancial.id_branch.name: transfinancial.getidBranch,
    FieldDataTransFinancial.name_financial.name:
        transfinancial.getnameFinancial,
    FieldDataTransFinancial.note.name: transfinancial.getnote,
    FieldDataTransFinancial.date.name: formatDate(date: transfinancial.getdate),
    FieldDataTransFinancial.amount.name: transfinancial.getamount,
    FieldDataTransFinancial.uid_owner.name: UserSession.getUidOwner(),
  };
}

Map<String, dynamic> convertToMapItem(ModelItem item) {
  return {
    FieldDataItem.uid_owner.name: UserSession.getUidOwner(),
    FieldDataItem.name_item.name: item.getnameItem,
    FieldDataItem.price_item.name: item.getpriceItem,
    FieldDataItem.id_category.name: item.getidCategoryiItem,
    FieldDataItem.status_condiment.name: item.getstatusCondiment.name,
    FieldDataItem.url_image.name: item.geturlImage,
    FieldDataItem.qty_item.name: item.getqtyItem,
    FieldDataItem.id_branch.name: item.getidBranch,
    FieldDataItem.barcode.name: item.getBarcode,
    FieldDataItem.status_item.name: item.getStatusItem.name,
    FieldDataItem.date.name: formatDate(date: item.getDateItem, minute: false),
  };
}

Map<String, dynamic> convertToMapBatch(ModelBatch batch) {
  return {
    FieldDataBatch.uid_owner.name: UserSession.getUidOwner(),
    FieldDataBatch.id_branch.name: batch.getidBranch,
    FieldDataBatch.date_buy.name: formatDate(date: batch.getdate_buy),
  };
}

Map<String, dynamic> convertToMapItemBatch(
  ModelItemBatch itemBatch,
  String invoice,
) {
  return {
    FieldDataItemBatch.invoice.name: itemBatch.getinvoice,
    FieldDataItemBatch.name_item.name: itemBatch.getnameItem,
    FieldDataItemBatch.id_branch.name: itemBatch.getidBranch,
    FieldDataItemBatch.id_item.name: itemBatch.getidItem,
    FieldDataItemBatch.id_category_item.name: itemBatch.getidCategoryItem,
    FieldDataItemBatch.note.name: itemBatch.getnote,
    FieldDataItemBatch.date_buy.name: formatDate(date: itemBatch.getdateBuy),
    FieldDataItemBatch.expired_date.name: itemBatch.getexpiredDate != null
        ? formatDate(date: itemBatch.getexpiredDate!, minute: false)
        : null,
    FieldDataItemBatch.discount_item.name: itemBatch.getdiscountItem,
    FieldDataItemBatch.qty_item_in.name: itemBatch.getqtyItem_in,
    FieldDataItemBatch.qty_item_out.name: itemBatch.getqtyItem_out,
    FieldDataItemBatch.price_item.name: itemBatch.getpriceItem,
    FieldDataItemBatch.sub_total.name: itemBatch.getsubTotal,
    FieldDataItemBatch.price_item_final.name: itemBatch.getpriceItemFinal,
    FieldDataItemBatch.price_item_buy.name: itemBatch.getpriceItemBuy,
  };
}

Map<String, dynamic> convertToMapPartner(ModelPartner partner) {
  return {
    FieldDataPartner.id_branch.name: partner.getidBranchPartner,
    FieldDataPartner.uid_owner.name: UserSession.getUidOwner(),
    FieldDataPartner.name_partner.name: partner.getnamePartner,
    FieldDataPartner.phone_partner.name: partner.getphonePartner,
    FieldDataPartner.email_partner.name: partner.getemailPartner,
    FieldDataPartner.balance_partner.name: partner.getbalancePartner,
    FieldDataPartner.type.name: partner.gettypePartner.name,
    FieldDataPartner.date.name: formatDate(
      date: partner.getdate,
      minute: false,
    ),
  };
}

Map<String, dynamic> convertToMapCategory(ModelCategory category) {
  return {
    FieldDataCategory.name_category.name: category.getnameCategory,
    FieldDataCategory.id_branch.name: category.getidBranch,
    FieldDataCategory.uid_owner.name: UserSession.getUidOwner(),
  };
}

Map<String, dynamic> convertToMapFinancial(ModelFinancial financial) {
  return {
    FieldDataFinancial.name_financial.name: financial.getnameFinancial,
    FieldDataFinancial.id_branch.name: financial.getidBranch,
    FieldDataFinancial.type.name: financial.getfinancialType.name,
    FieldDataFinancial.uid_owner.name: UserSession.getUidOwner(),
  };
}

Map<String, dynamic> convertToMapCounter(ModelCounter dataCounter) {
  return {
    FieldDataCounter.counter_sell.name: dataCounter.getcounterSell,
    FieldDataCounter.counter_buy.name: dataCounter.getcounterBuy,
    FieldDataCounter.counter_income.name: dataCounter.getcounterIncome,
    FieldDataCounter.counter_expense.name: dataCounter.getcounterExpense,
    FieldDataCounter.counter_adjustment_in.name:
        dataCounter.getcounterAdjustmentIn,
    FieldDataCounter.counter_adjustment_out.name:
        dataCounter.getcounterAdjustmentOut,
  };
}

Map<String, dynamic> convertToMapCompanySignUp({
  required String nameCompany,
  required String phoneCompany,
  required String created,
  required List<Map<String, dynamic>> listBranch,
}) {
  return {
    FieldDataCompany.created_company.name: created,
    FieldDataCompany.name_company.name: nameCompany,
    FieldDataCompany.phone_company.name: phoneCompany,
    FieldDataCompany.list_branch.name: listBranch,
  };
}

Map<String, dynamic> convertToMapAdjustmentIn({
  required ModelTransactionAdjustmentIn data,
}) {
  return {
    FieldDataAdjustmentIn.invoice.name: data.getinvoice,
    FieldDataAdjustmentIn.id_branch.name: data.getidBranch,
    FieldDataAdjustmentIn.item_invoice.name: data.getitemInvoice,
    FieldDataAdjustmentIn.item_name.name: data.getitemName,
    FieldDataAdjustmentIn.buy_price_after.name: data.getbuyPriceAfter,
    FieldDataAdjustmentIn.buy_price_before.name: data.getbuyPriceBefore,
    FieldDataAdjustmentIn.sell_price_after.name: data.getsellPriceAfter,
    FieldDataAdjustmentIn.sell_price_before.name: data.getsellPriceBefore,
    FieldDataAdjustmentIn.expired_date_after.name:
        data.getexpiredDateAfter != null
        ? formatDate(date: data.getexpiredDateAfter!, minute: false)
        : null,
    FieldDataAdjustmentIn.expired_date_before.name:
        data.getexpiredDateBefore != null
        ? formatDate(date: data.getexpiredDateBefore!, minute: false)
        : null,
    FieldDataAdjustmentIn.qty_in_after.name: data.getqty_in_after,
    FieldDataAdjustmentIn.qty_in_before.name: data.getqty_in_before,
    FieldDataAdjustmentIn.date.name: formatDate(date: data.getdate),
    FieldDataAdjustmentIn.note.name: data.getnote,
    FieldDataAdjustmentIn.uid_owner.name: UserSession.getUidOwner(),
  };
}

Map<String, dynamic> convertToMapAdjustmentOut({
  required ModelTransactionAdjustmentOut data,
}) {
  return {
    FieldDataAdjustmentOut.invoice.name: data.getinvoice,
    FieldDataAdjustmentOut.id_branch.name: data.getidBranch,
    FieldDataAdjustmentOut.item_invoice.name: data.getitemInvoice,
    FieldDataAdjustmentOut.item_name.name: data.getitemName,
    FieldDataAdjustmentOut.date.name: formatDate(date: data.getdate),
    FieldDataAdjustmentOut.qty_out_after.name: data.getqty_out_after,
    FieldDataAdjustmentOut.qty_out_before.name: data.getqty_out_before,
    FieldDataAdjustmentOut.note.name: data.getnote,
    FieldDataAdjustmentOut.uid_owner.name: UserSession.getUidOwner(),
  };
}
