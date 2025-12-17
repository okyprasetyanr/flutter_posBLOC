import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_counter.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_split.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/model_data/model_user.dart';

Map<String, dynamic> convertToMapSplit(ModelSplit _dataSplit) {
  return {
    'payment_debit_name': _dataSplit.getpaymentDebitName,
    'payment_name': _dataSplit.getpaymentName,
    'payment_total': _dataSplit.getpaymentTotal,
  };
}

Map<String, dynamic> convertToMapUser(ModelUser user, String? uidUser) {
  return {
    FieldDataUser.status_user.name: user.getstatusUser,
    FieldDataUser.name_user.name: user.getNameUser,
    FieldDataUser.email_user.name: user.getEmailUser,
    FieldDataUser.phone_user.name: user.getPhoneUser,
    FieldDataUser.role_user.name: user.getRoleUser,
    FieldDataUser.uid_owner.name: uidUser ?? UserSession.getUidOwner(),
    FieldDataUser.id_branch.name: user.getIdBranchUser,
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

Map<String, dynamic> convertToMapTransaction(ModelTransaction transaction) {
  return {
    FieldDataTransaction.id_branch.name: transaction.getidBranch,
    FieldDataTransaction.uid_owner.name: UserSession.getUidOwner(),
    FieldDataTransaction.bank_name.name: transaction.getbankName ?? "",
    FieldDataTransaction.bill_paid.name: transaction.getbillPaid,
    FieldDataTransaction.note.name: transaction.getnote,
    FieldDataTransaction.total_charge.name: transaction.gettotalCharge,
    FieldDataTransaction.total_discount.name: transaction.gettotalDiscount,
    FieldDataTransaction.total_ppn.name: transaction.gettotalPpn,
    FieldDataTransaction.payment_method.name: transaction.getpaymentMethod,
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
        transaction.getstatusTransaction,
  };
}

Map<String, dynamic> convertToMapItemOrdered(ModelItemOrdered _itemsOrdered) {
  return {
    'sub_total': _itemsOrdered.getsubTotal,
    'name_item': _itemsOrdered.getnameItem,
    'id_item': _itemsOrdered.getidItem,
    'id_branch': _itemsOrdered.getidBranch,
    'qty_item': _itemsOrdered.getqtyItem,
    'price_item': _itemsOrdered.getpriceItem,
    'price_item_final': _itemsOrdered.getpriceItemFinal,
    'discount_item': _itemsOrdered.getdiscountItem,
    'id_category_item': _itemsOrdered.getidCategoryItem,
    'id_condiment': _itemsOrdered.getidCondiment,
    'note': _itemsOrdered.getNote,
  };
}

Map<String, dynamic> convertToMapTransactionIncome(
  ModelTransactionFinancial transfinancial,
) {
  return {
    FieldDataTransFinancial.status_transaction.name:
        transfinancial.statusTransaction,
    FieldDataTransFinancial.id_financial.name: transfinancial.getidFinancial,
    FieldDataTransFinancial.id_branch.name: transfinancial.getidBranch,
    FieldDataTransFinancial.name_financial.name:
        transfinancial.getnameFinancial,
    FieldDataTransFinancial.note.name: transfinancial.getnote,
    FieldDataTransFinancial.date.name: formatDate(
      date: transfinancial.getdate,
      minute: true,
    ),
    FieldDataTransFinancial.amount.name: transfinancial.getamount,
    FieldDataTransFinancial.uid_owner.name: UserSession.getUidOwner(),
  };
}

List<Map<String, dynamic>> convertToMapCondimentOrdered(
  List<ModelItemOrdered> itemsCondiment,
) {
  return itemsCondiment.map((condiment) {
    return {
      'sub_total': condiment.getsubTotal,
      'name_item': condiment.getnameItem,
      'id_item': condiment.getidItem,
      'id_branch': condiment.getidBranch,
      'qty_item': condiment.getqtyItem,
      'price_item': condiment.getpriceItem,
      'price_item_final': condiment.getpriceItemFinal,
      'discount_item': condiment.getdiscountItem,
      'id_category_item': condiment.getidCategoryItem,
      'id_condiment': condiment.getidCondiment,
      'note': condiment.getNote,
      'condiment': {},
    };
  }).toList();
}

Map<String, dynamic> convertToMapItem(ModelItem item) {
  return {
    FieldDataItem.uid_owner.name: UserSession.getUidOwner(),
    FieldDataItem.name_item.name: item.getnameItem,
    FieldDataItem.price_item.name: item.getpriceItem,
    FieldDataItem.id_category.name: item.getidCategoryiItem,
    FieldDataItem.status_condiment.name: item.getstatusCondiment,
    FieldDataItem.url_image.name: item.geturlImage,
    FieldDataItem.qty_item.name: item.getqtyItem,
    FieldDataItem.id_branch.name: item.getidBranch,
    FieldDataItem.barcode.name: item.getBarcode,
    FieldDataItem.status_item.name: item.getStatusItem,
    FieldDataItem.date.name: formatDate(date: item.getDateItem),
  };
}

Map<String, dynamic> convertToMapBatch(ModelBatch batch) {
  return {
    'uid_owner': UserSession.getUidOwner(),
    'id_branch': batch.getidBranch,
    'date_buy': formatDate(date: batch.getdate_buy),
  };
}

Map<String, dynamic> convertToMapItemBatch(
  ModelItemBatch itemBatch,
  String invoice,
) {
  return {
    'invoice': itemBatch.getinvoice,
    'name_item': itemBatch.getnameItem,
    'id_branch': itemBatch.getidBranch,
    'id_item': itemBatch.getidItem,
    'id_category_item': itemBatch.getidCategoryItem,
    'note': itemBatch.getnote,
    'date_buy': formatDate(date: itemBatch.getdateBuy),
    'expired_date': itemBatch.getexpiredDate != null
        ? formatDate(date: itemBatch.getexpiredDate!, minute: false)
        : null,
    'discount_item': itemBatch.getdiscountItem,
    'qty_item_in': itemBatch.getqtyItem_in,
    'qty_item_out': itemBatch.getqtyItem_out,
    'price_item': itemBatch.getpriceItem,
    'sub_total': itemBatch.getsubTotal,
    'price_item_final': itemBatch.getpriceItemFinal,
  };
}

Map<String, dynamic> convertToMapPartner(ModelPartner partner) {
  return {
    FieldDataPartner.id_branch.name: partner.getidBranch,
    FieldDataPartner.id_branch.name: UserSession.getUidOwner(),
    FieldDataPartner.id_branch.name: partner.getname,
    FieldDataPartner.id_branch.name: partner.getphone,
    FieldDataPartner.id_branch.name: partner.getemail,
    FieldDataPartner.id_branch.name: partner.getbalance,
    FieldDataPartner.id_branch.name: partner.gettype.name,
    FieldDataPartner.id_branch.name: formatDate(date: partner.getdate),
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
    'counter_sell': dataCounter.getcounterSell,
    'counter_buy': dataCounter.getcounterBuy,
    'counter_income': dataCounter.getcounterIncome,
    'counter_expense': dataCounter.getcounterExpense,
  };
}

Map<String, dynamic> convertToMapBranch({
  required String nameCompany,
  required String phoneCompany,
  required String created,
  required List<Map<String, dynamic>> listBranch,
}) {
  return {
    'created_company': created,
    'name_company': nameCompany,
    'phone_company': phoneCompany,
    'list_branch': listBranch,
  };
}
