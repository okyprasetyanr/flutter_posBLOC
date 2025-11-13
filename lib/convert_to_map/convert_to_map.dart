import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_data_counter.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_split.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

Map<String, dynamic> convertToMapSplit(ModelSplit _dataSplit) {
  return {
    'payment_debit_name': _dataSplit.getpaymentDebitName,
    'payment_name': _dataSplit.getpaymentName,
    'payment_total': _dataSplit.getpaymentTotal,
  };
}

Map<String, dynamic> convertToMapTransaction(ModelTransaction transaction) {
  return {
    'id_branch': transaction.getidBranch,
    'uid_user': UserSession.getUidUser(),
    'bank_name': transaction.getbankName ?? "",
    'bill_paid': transaction.getbillPaid,
    'note': transaction.getnote,
    'total_charge': transaction.gettotalCharge,
    'total_discount': transaction.gettotalDiscount,
    'total_ppn': transaction.gettotalPpn,
    'payment_method': transaction.getpaymentMethod,
    'date': formatDate(date: transaction.getdate),
    'name_partner': transaction.getnamePartner,
    'id_partner': transaction.getidPartner,
    'name_operator': transaction.getnameOperator,
    'id_operator': transaction.getidOperator,
    'discount': transaction.getdiscount,
    'ppn': transaction.getppn,
    'total_item': transaction.gettotalItem,
    'sub_total': transaction.getsubTotal,
    'charge': transaction.getcharge,
    'total': transaction.gettotal,
    'status_transaction': transaction.getstatusTransaction,
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
    'uid_user': UserSession.getUidUser(),
    'name_item': item.getnameItem,
    'price_item': item.getpriceItem,
    'id_category': item.getidCategoryiItem,
    'status_condiment': item.getstatusCondiment,
    'url_image': item.geturlImage,
    'qty_item': item.getqtyItem,
    'id_branch': item.getidBranch,
    'barcode': item.getBarcode,
    'status_item': item.getStatusItem,
    'date': formatDate(date: item.getDateItem),
  };
}

Map<String, dynamic> convertToMapBatch(ModelBatch batch) {
  return {
    'uid_user': UserSession.getUidUser(),
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
    'id_branch': partner.getidBranch,
    'uid_user': UserSession.getUidUser(),
    'name_partner': partner.getname,
    'phone_partner': partner.getphone,
    'email_partner': partner.getemail,
    'balance_partner': partner.getbalance,
    'type': partner.gettype.name,
    'date': formatDate(date: partner.getdate),
  };
}

Map<String, dynamic> convertToMapCategory(ModelCategory category) {
  return {
    'name_category': category.getnameCategory,
    'id_branch': category.getidBranch,
    'uid_user': UserSession.getUidUser(),
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
