import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_company.dart';
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
import 'package:flutter_pos/request/get_data.dart';

ModelTransactionFinancial fromMapTransFinancial(
  Map<String, dynamic> data,
  String id,
) {
  return ModelTransactionFinancial(
    statusTransaction: data['status_transaction'],
    idFinancial: data['id_financial'],
    nameFinancial: data['name_financial'],
    idBranch: data['id_branch'],
    invoice: id,
    date: parseDate(date: data['date']),
    note: data['date'],
    amount: data['amount'].toDouble(),
  );
}

ModelFinancial fromMapFinancial(Map<String, dynamic> data, String id) {
  return ModelFinancial(
    idFinancial: id,
    nameFinancial: data['name_financial'],
    idBranch: data['id_branch'],
    type: FinancialType.values.firstWhere(
      (element) => element.name == data['type'],
    ),
  );
}

ModelCategory fromMapCategory(Map<String, dynamic> data, String id) {
  return ModelCategory(
    nameCategory: data['name_category'],
    idCategory: id,
    idBranch: data['id_branch'],
  );
}

ModelItem fromMapItem(Map<String, dynamic> data, String id) {
  return ModelItem(
    nameItem: data['name_item'],
    idItem: id,
    priceItem: data['price_item'].toDouble(),
    idCategoryItem: data['id_category'],
    statusCondiment: data['status_condiment'],
    urlImage: data['url_image'],
    qtyItem: data['qty_item'].toDouble(),
    idBranch: data['id_branch'],
    barcode: data['barcode'],
    statusItem: data['status_item'],
    date: parseDate(date: data['date']),
  );
}

ModelPartner fromMapPartner(Map<String, dynamic> data, String id) {
  return ModelPartner(
    idBranch: data['id_branch'],
    id: id,
    name: data['name_partner'],
    phone: data['phone_partner'],
    email: data['email_partner'],
    balance: data['balance_partner'],
    type: PartnerType.values.firstWhere(
      (element) => element.name == data['type'],
      orElse: () => PartnerType.customer,
    ),
    date: parseDate(date: data['date']),
  );
}

ModelBranch fromMapBranch(Map<String, dynamic> data, String id) {
  return ModelBranch(
    nameBranch: data['name_branch'],
    numTelpBranch: data['phone_branch'],
    addressBranch: data['address_branch'],
    idBranch: data['id_branch'],
  );
}

ModelUser fromMapUser(Map<String, dynamic> data, String id) {
  return ModelUser(
    idUser: id,
    statusUser: data['status_user'],
    nameUser: data['name_user'],
    emailUser: data['email_user'],
    phoneUser: data['phone_user'],
    roleUser: int.tryParse(data['role_user'].toString())!,
    idBranchUser: data['id_branch'],
    permissionsUser: {
      for (final permission in Permission.values)
        permission: data['status_user'] ?? false
            ? data['permissions_user'][permission.name] ?? false
            : false,
    },
    createdUser: parseDate(date: data['created_user'], minute: false),
    noteUser: data['note_user'],
  );
}

ModelCompany fromMapCompany(
  Map<String, dynamic> data,
  String id, {
  DocumentSnapshot? dataList,
}) {
  return ModelCompany(
    listBranch: dataList != null ? getDataListBranch(dataList) : [],
    nameCompany: data['name_company'],
    phoneCompany: data['phone_company'],
    footer: data['footer'] ?? "",
    header: data['header'] ?? "",
    created: parseDate(date: data['created_company'], minute: false),
  );
}

ModelCounter fromMapCounter(
  Map<String, dynamic> data,
  String id, {
  DocumentSnapshot? dataList,
}) {
  return ModelCounter(
    idBranch: id,
    counterSell: data['counter_sell'],
    counterBuy: data['counter_buy'],
    counterIncome: data['counter_income'],
    counterExpense: data['counter_expense'],
  );
}

ModelBatch fromMapBatch(
  Map<String, dynamic> data,
  String id, {
  List<ModelItemBatch>? dataList,
}) {
  return ModelBatch(
    invoice: id,
    idBranch: data['id_branch'],
    date_buy: parseDate(date: data['date_buy']),
    items_batch: dataList ?? [],
  );
}

ModelItemBatch fromMapItembatch(
  Map<String, dynamic> data,
  String id, {
  DocumentSnapshot? dataList,
}) {
  return ModelItemBatch(
    invoice: data['invoice'],
    nameItem: data['name_item'],
    idBranch: data['id_branch'],
    idItem: data['id_item'],
    idOrdered: id,
    idCategoryItem: data['id_category_item'],
    note: data['note'],
    date_buy: parseDate(date: data['date_buy']),
    expiredDate: data['expired_date'] != null
        ? parseDate(date: data['expired_date'])
        : null,
    discountItem: data['discount_item'],
    qtyItem_in: data['qty_item_in'],
    qtyItem_out: data['qty_item_out'],
    priceItem: data['price_item'],
    subTotal: data['sub_total'],
    priceItemFinal: data['price_item_final'],
  );
}

ModelItemOrdered fromMapItemOrdered(
  Map<String, dynamic> items,
  List<ModelItemOrdered> condiment,
  bool isCondiment,
  String id_ordered,
) {
  return ModelItemOrdered(
    priceItemFinal: double.tryParse(items['price_item_final'].toString())!,
    subTotal: double.tryParse(items['sub_total'].toString())!,
    nameItem: items['name_item'],
    idItem: items['id_item'],
    idBranch: items['id_branch'],
    idOrdered: id_ordered,
    qtyItem: double.tryParse(items['qty_item'].toString())!,
    priceItem: double.tryParse(items['price_item'].toString())!,
    discountItem: int.tryParse(items['discount_item'].toString())!,
    idCategoryItem: items['id_category_item'],
    idCondiment: items['id_condiment'],
    note: items['note'],
    condiment: isCondiment ? [] : condiment,
  );
}

ModelTransaction fromMapTransaction(
  Map<String, dynamic> data,
  List<ModelItemOrdered> itemsOrdered,
  List<ModelSplit> splitData,
  String id,
) {
  return ModelTransaction(
    idBranch: data['id_branch'],
    bankName: data['bank_name'],
    itemsOrdered: itemsOrdered,
    dataSplit: splitData,
    date: parseDate(date: data['date']),
    note: data['note'],
    invoice: id,
    namePartner: data['name_partner'],
    idPartner: data['id_partner'],
    nameOperator: data['name_operator'],
    idOperator: data['id_operator'],
    paymentMethod: data['payment_method'],
    discount: int.tryParse(data['discount'].toString()) ?? 0,
    ppn: int.tryParse(data['ppn'].toString()) ?? 0,
    totalItem: int.tryParse(data['total_item'].toString()) ?? 0,
    charge: int.tryParse(data['charge'].toString()) ?? 0,
    subTotal: double.tryParse(data['sub_total'].toString()) ?? 0.0,
    billPaid: double.tryParse(data['bill_paid'].toString()) ?? 0.0,
    totalCharge: double.tryParse(data['total_charge'].toString()) ?? 0.0,
    totalPpn: double.tryParse(data['total_ppn'].toString()) ?? 0.0,
    totalDiscount: double.tryParse(data['total_discount'].toString()) ?? 0.0,
    total: double.tryParse(data['total'].toString()) ?? 0.0,
    statusTransaction: data['status_transaction'],
  );
}
