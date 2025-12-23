import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_pos/enum/enum.dart';
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
    statusTransaction: data[FieldDataTransFinancial.status_transaction.name],
    idFinancial: data[FieldDataTransFinancial.id_financial.name],
    nameFinancial: data[FieldDataTransFinancial.name_financial.name],
    idBranch: data[FieldDataTransFinancial.id_branch.name],
    invoice: id,
    date: parseDate(date: data[FieldDataTransFinancial.date.name]),
    note: data[FieldDataTransFinancial.date.name],
    amount: data[FieldDataTransFinancial.amount.name].toDouble(),
  );
}

ModelFinancial fromMapFinancial(Map<String, dynamic> data, String id) {
  return ModelFinancial(
    idFinancial: id,
    nameFinancial: data[FieldDataFinancial.name_financial.name],
    idBranch: data[FieldDataFinancial.id_branch.name],
    type: FinancialType.values.firstWhere(
      (element) => element.name == data[FieldDataFinancial.type.name],
    ),
  );
}

ModelCategory fromMapCategory(Map<String, dynamic> data, String id) {
  return ModelCategory(
    nameCategory: data[FieldDataCategory.name_category.name],
    idCategory: id,
    idBranch: data[FieldDataCategory.id_branch.name],
  );
}

ModelItem fromMapItem(Map<String, dynamic> data, String id) {
  return ModelItem(
    nameItem: data[FieldDataItem.name_item.name],
    idItem: id,
    priceItem: data[FieldDataItem.price_item.name].toDouble(),
    idCategoryItem: data[FieldDataItem.id_category.name],
    statusCondiment: data[FieldDataItem.status_condiment.name],
    urlImage: data[FieldDataItem.url_image.name],
    qtyItem: data[FieldDataItem.qty_item.name].toDouble(),
    idBranch: data[FieldDataItem.id_branch.name],
    barcode: data[FieldDataItem.barcode.name],
    statusItem: data[FieldDataItem.status_item.name],
    date: parseDate(date: data[FieldDataItem.date.name]),
  );
}

ModelPartner fromMapPartner(Map<String, dynamic> data, String id) {
  debugPrint("Log fromMap: $data");
  return ModelPartner(
    idBranch: data[FieldDataPartner.id_branch.name],
    id: id,
    name: data[FieldDataPartner.name_partner.name],
    phone: data[FieldDataPartner.phone_partner.name],
    email: data[FieldDataPartner.email_partner.name],
    balance: data[FieldDataPartner.balance_partner.name],
    type: PartnerType.values.firstWhere(
      (element) => element.name == data[FieldDataPartner.type.name],
      orElse: () => PartnerType.customer,
    ),
    date: parseDate(date: data[FieldDataPartner.date.name]),
  );
}

ModelBranch fromMapListBranch(Map<String, dynamic> data, String id) {
  return ModelBranch(
    nameBranch: data[FieldDataListBranch.name_branch.name],
    numTelpBranch: data[FieldDataListBranch.phone_branch.name],
    addressBranch: data[FieldDataListBranch.address_branch.name],
    idBranch: data[FieldDataListBranch.id_branch.name],
  );
}

ModelSplit fromMapSplit(Map<String, dynamic> split) {
  return ModelSplit(
    paymentName: split[FieldDataSplit.payment_name],
    paymentTotal: double.tryParse(
      split[FieldDataSplit.payment_total].toString(),
    )!,
  );
}

ModelUser fromMapUser(Map<String, dynamic> data, String id) {
  return ModelUser(
    idUser: id,
    statusUser: data[FieldDataUser.status_user.name],
    nameUser: data[FieldDataUser.name_user.name],
    emailUser: data[FieldDataUser.email_user.name],
    phoneUser: data[FieldDataUser.phone_user.name],
    roleUser: int.tryParse(data[FieldDataUser.role_user.name].toString())!,
    idBranchUser: data[FieldDataUser.id_branch.name],
    permissionsUser: {
      for (final permission in Permission.values)
        permission: data[FieldDataUser.status_user.name] ?? false
            ? data[FieldDataUser.permissions_user.name][permission.name] ??
                  false
            : false,
    },
    createdUser: parseDate(
      date: data[FieldDataUser.created_user.name],
      minute: false,
    ),
    noteUser: data[FieldDataUser.note_user.name],
  );
}

ModelCompany fromMapCompany(
  Map<String, dynamic> data,
  String id, {
  DocumentSnapshot? dataList,
}) {
  return ModelCompany(
    listBranch: dataList != null ? getDataListBranch(dataList) : [],
    nameCompany: data[FieldDataCompany.name_company.name],
    phoneCompany: data[FieldDataCompany.phone_company.name],
    footer: data[FieldDataCompany.footer.name] ?? "",
    header: data[FieldDataCompany.header.name] ?? "",
    created: parseDate(
      date: data[FieldDataCompany.created_company.name],
      minute: false,
    ),
  );
}

ModelCounter fromMapCounter(
  Map<String, dynamic> data,
  String id, {
  DocumentSnapshot? dataList,
}) {
  return ModelCounter(
    idBranch: id,
    counterSell: data[FieldDataCounter.counter_sell.name],
    counterBuy: data[FieldDataCounter.counter_buy.name],
    counterIncome: data[FieldDataCounter.counter_income.name],
    counterExpense: data[FieldDataCounter.counter_expense.name],
  );
}

ModelBatch fromMapBatch(
  Map<String, dynamic> data,
  String id, {
  List<ModelItemBatch>? dataList,
}) {
  return ModelBatch(
    invoice: id,
    idBranch: data[FieldDataBatch.id_branch.name],
    date_buy: parseDate(date: data[FieldDataBatch.date_buy.name]),
    items_batch: dataList ?? [],
  );
}

ModelItemBatch fromMapItembatch(
  Map<String, dynamic> data,
  String id, {
  DocumentSnapshot? dataList,
}) {
  return ModelItemBatch(
    invoice: data[FieldDataItemBatch.invoice.name],
    nameItem: data[FieldDataItemBatch.name_item.name],
    idBranch: data[FieldDataItemBatch.id_branch.name],
    idItem: data[FieldDataItemBatch.id_item.name],
    idOrdered: id,
    idCategoryItem: data[FieldDataItemBatch.id_category_item.name],
    note: data[FieldDataItemBatch.note.name],
    date_buy: parseDate(date: data[FieldDataItemBatch.date_buy.name]),
    expiredDate: data[FieldDataItemBatch.expired_date.name] != null
        ? parseDate(date: data[FieldDataItemBatch.expired_date.name])
        : null,
    discountItem: data[FieldDataItemBatch.discount_item.name],
    qtyItem_in: data[FieldDataItemBatch.qty_item_in.name],
    qtyItem_out: data[FieldDataItemBatch.qty_item_out.name],
    priceItem: data[FieldDataItemBatch.price_item.name],
    subTotal: data[FieldDataItemBatch.sub_total.name],
    priceItemFinal: data[FieldDataItemBatch.price_item_final.name],
  );
}

ModelItemOrdered fromMapItemOrdered(
  Map<String, dynamic> items,
  List<ModelItemOrdered> condiment,
  bool isCondiment,
  String id_ordered,
) {
  return ModelItemOrdered(
    priceItemFinal: double.tryParse(
      items[FieldDataItemOrdered.price_item_final.name].toString(),
    )!,
    subTotal: double.tryParse(
      items[FieldDataItemOrdered.sub_total.name].toString(),
    )!,
    nameItem: items[FieldDataItemOrdered.name_item.name],
    idItem: items[FieldDataItemOrdered.id_item.name],
    idBranch: items[FieldDataItemOrdered.id_branch.name],
    idOrdered: id_ordered,
    qtyItem: double.tryParse(
      items[FieldDataItemOrdered.qty_item.name].toString(),
    )!,
    priceItem: double.tryParse(
      items[FieldDataItemOrdered.price_item.name].toString(),
    )!,
    discountItem: int.tryParse(
      items[FieldDataItemOrdered.discount_item.name].toString(),
    )!,
    idCategoryItem: items[FieldDataItemOrdered.id_category_item.name],
    note: items[FieldDataItemOrdered.note.name],
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
    idBranch: data[FieldDataTransaction.id_branch.name],
    bankName: data[FieldDataTransaction.bank_name.name],
    itemsOrdered: itemsOrdered,
    dataSplit: splitData,
    date: parseDate(date: data[FieldDataTransaction.date.name]),
    note: data[FieldDataTransaction.note.name],
    invoice: id,
    namePartner: data[FieldDataTransaction.name_partner.name],
    idPartner: data[FieldDataTransaction.id_partner.name],
    nameOperator: data[FieldDataTransaction.name_operator.name],
    idOperator: data[FieldDataTransaction.id_operator.name],
    paymentMethod: data[FieldDataTransaction.payment_method.name],
    discount:
        int.tryParse(data[FieldDataTransaction.discount.name].toString()) ?? 0,
    ppn: int.tryParse(data[FieldDataTransaction.ppn.name].toString()) ?? 0,
    totalItem:
        int.tryParse(data[FieldDataTransaction.total_item.name].toString()) ??
        0,
    charge:
        int.tryParse(data[FieldDataTransaction.charge.name].toString()) ?? 0,
    subTotal:
        double.tryParse(data[FieldDataTransaction.sub_total.name].toString()) ??
        0.0,
    billPaid:
        double.tryParse(data[FieldDataTransaction.bill_paid.name].toString()) ??
        0.0,
    totalCharge:
        double.tryParse(
          data[FieldDataTransaction.total_charge.name].toString(),
        ) ??
        0.0,
    totalPpn:
        double.tryParse(data[FieldDataTransaction.total_ppn.name].toString()) ??
        0.0,
    totalDiscount:
        double.tryParse(
          data[FieldDataTransaction.total_discount.name].toString(),
        ) ??
        0.0,
    total:
        double.tryParse(data[FieldDataTransaction.total.name].toString()) ??
        0.0,
    statusTransaction: data[FieldDataTransaction.status_transaction.name],
  );
}
