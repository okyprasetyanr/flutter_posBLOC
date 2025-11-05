import 'package:flutter/material.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_split.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

List<Map<String, dynamic>> convertToMapSplit(List<ModelSplit> _dataSplit) {
  return _dataSplit.map((dataSplit) {
    return {
      'payment_debit_name': dataSplit.getpaymentDebitName,
      'payment_name': dataSplit.getpaymentName,
      'payment_total': dataSplit.getpaymentTotal,
    };
  }).toList();
}

Map<String, dynamic> convertToMapTransaction(ModelTransaction transaction) {
  return {
    'id_branch': transaction.getidBranch,
    'uid_user': UserSession.ambilUidUser(),
    'items_ordered': convertToMapItemOrdered(transaction.getitemsOrdered),
    'bank_name': transaction.getbankName ?? "",
    'data_split': convertToMapSplit(transaction.getdataSplit),
    'bill_paid': transaction.getbillPaid,
    'note': transaction.getnote,
    'total_charge': transaction.gettotalCharge,
    'total_discount': transaction.gettotalDiscount,
    'total_ppn': transaction.gettotalPpn,
    'payment_method': transaction.getpaymentMethod,
    'date': transaction.getdate,
    'invoice': transaction.getinvoice,
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

List<Map<String, dynamic>> convertToMapItemOrdered(
  List<ModelItemOrdered> _itemsOrdered,
) {
  return _itemsOrdered.map((item) {
    return {
      'sub_total': item.getsubTotal,
      'name_item': item.getnameItem,
      'id_item': item.getidItem,
      'id_branch': item.getidBranch,
      'id_ordered': item.getidOrdered,
      'qty_item': item.getqtyItem,
      'price_item': item.getpriceItem,
      'price_item_final': item.getpriceItemFinal,
      'discount_item': item.getdiscountItem,
      'id_category_item': item.getidCategoryItem,
      'id_condiment': item.getidCondiment,
      'note': item.getNote,
      'condiment': convertToMapCondimentOrdered(item.getCondiment),
    };
  }).toList();
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
      'id_ordered': condiment.getidOrdered,
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
    'uid_user': UserSession.ambilUidUser(),
    'nama_item': item.getnameItem,
    'harga_item': item.getpriceItem,
    'id_item': item.getidItem,
    'id_kategori': item.getidCategoryiItem,
    'status_condiment': item.getstatusCondiment,
    'url_gambar': item.geturlImage,
    'qty_item': item.getqtyItem,
    'id_cabang': item.getidBranch,
    'barcode': item.getBarcode,
    'status_item': item.getStatusItem,
    'tanggal_item': item.getDateItem,
  };
}

Map<String, dynamic> convertToMapBatch(ModelBatch batch) {
  return {
    'invoice': batch.getinvoice,
    'id_branch': batch.getidBranch,
    'date_buy': batch.getdate_buy,
    'items_batch': convertToMapItemBatch(
      batch.getitems_batch,
      batch.getinvoice,
    ),
  };
}

List<Map<String, dynamic>> convertToMapItemBatch(
  List<ModelItemBatch> itemBatch,
  String invoice,
) {
  return itemBatch
      .map(
        (item) => {
          'invoice': invoice,
          'name_item': item.getnameItem,
          'id_branch': item.getidBranch,
          'id_item': item.getidItem,
          'id_ordered': item.getidOrdered,
          'id_category_item': item.getidCategoryItem,
          'note': item.getnote,
          'date_buy': item.getdateBuy,
          'expired_date': item.getexpiredDate,
          'discount_item': item.getdiscountItem,
          'qty_item': item.getqtyItem,
          'price_item': item.getpriceItem,
          'sub_total': item.getsubTotal,
          'price_item_final': item.getpriceItemFinal,
        },
      )
      .toList();
}

Map<String, dynamic> convertToMapPartner(ModelPartner partner) {
  return {
    'id_branch': partner.getidBranch,
    'uid_user': UserSession.ambilUidUser(),
    'id': partner.getid,
    'name': partner.getname,
    'phone': partner.getphone,
    'email': partner.getemail,
    'address': partner.getaddress,
    'notes': partner.getnotes,
    'balance': partner.getbalance,
    'type': partner.gettype.name,
    'createdAt': partner.getcreatedAt,
  };
}

Map<String, dynamic> convertToMapCategory(ModelCategory category) {
  return {
    'nama_kategori': category.getnameCategory,
    'id_kategori': category.getidCategory,
    'id_cabang': category.getidBranch,
    'uid_user': UserSession.ambilUidUser(),
  };
}

Map<String, dynamic> convertToMap(Widget toContext, String text) {
  return {'toContext': toContext, 'text_menu': text};
}
