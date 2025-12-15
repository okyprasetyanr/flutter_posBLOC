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

List<ModelTransactionFinancial> getDataListTransFinancial(QuerySnapshot data) {
  return data.docs.map((map) {
    final dataFinancial = map.data() as Map<String, dynamic>;
    return ModelTransactionFinancial(
      statusTransaction: dataFinancial['status_transaction'],
      idFinancial: dataFinancial['id_financial'],
      nameFinancial: dataFinancial['name_financial'],
      idBranch: dataFinancial['id_branch'],
      invoice: map.id,
      date: parseDate(date: dataFinancial['date']),
      note: dataFinancial['date'],
      amount: dataFinancial['amount'].toDouble(),
    );
  }).toList();
}

List<ModelFinancial> getDataListFinancial(QuerySnapshot data) {
  return data.docs.map((map) {
    final dataFinancial = map.data() as Map<String, dynamic>;
    return ModelFinancial(
      idFinancial: map.id,
      nameFinancial: dataFinancial['name_financial'],
      idBranch: dataFinancial['id_branch'],
      type: FinancialType.values.firstWhere(
        (element) => element.name == dataFinancial['type'],
      ),
    );
  }).toList();
}

List<ModelBranch> getDataListBranch(DocumentSnapshot data) {
  List listbranch = data['list_branch'] ?? const [];
  return listbranch
      .map(
        (map) => ModelBranch(
          nameBranch: map['name_branch'],
          numTelpBranch: map['phone_branch'],
          addressBranch: map['address_branch'],
          idBranch: map['id_branch'],
        ),
      )
      .toList();
}

ModelCompany getDataCompany(DocumentSnapshot data) {
  Map dataUser = data.data() as Map<String, dynamic>;
  return ModelCompany(
    listBranch: getDataListBranch(data),
    nameCompany: dataUser['name_company'],
    phoneCompany: dataUser['phone_company'],
    footer: dataUser['footer'] ?? "",
    header: dataUser['header'] ?? "",
    created: parseDate(date: dataUser['created_company'], minute: false),
  );
}

List<ModelCounter> getDataCounter(
  QuerySnapshot<Map<String, dynamic>> dataCounter,
) {
  return dataCounter.docs
      .map(
        (counter) => ModelCounter(
          idBranch: counter.id,
          counterSell: counter['counter_sell'],
          counterBuy: counter['counter_buy'],
          counterIncome: counter['counter_income'],
          counterExpense: counter['counter_expense'],
        ),
      )
      .toList();
}

Future<List<ModelBatch>> getDataListBatch(QuerySnapshot data) async {
  final firestore = FirebaseFirestore.instance;
  return await Future.wait(
    data.docs.map((map) async {
      final dataBatch = map.data() as Map<String, dynamic>;

      final itemsSnapshot = await firestore
          .collection('batch')
          .doc(map.id)
          .collection('items_batch')
          .get();

      final itemsBatch = itemsSnapshot.docs.map((itemDoc) {
        final data = itemDoc.data();

        return ModelItemBatch(
          invoice: data['invoice'],
          nameItem: data['name_item'],
          idBranch: data['id_branch'],
          idItem: data['id_item'],
          idOrdered: itemDoc.id,
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
      }).toList();

      return ModelBatch(
        invoice: map.id,
        idBranch: dataBatch['id_branch'],
        date_buy: parseDate(date: dataBatch['date_buy']),
        items_batch: itemsBatch,
      );
    }).toList(),
  );
}

Future<List<ModelTransaction>> getDataListTransaction(
  QuerySnapshot data, {
  required bool isSell,
}) async {
  final firestore = FirebaseFirestore.instance;
  final String collection = isSell ? 'transaction_sell' : 'transaction_buy';

  return await Future.wait(
    data.docs.map((map) async {
      final dataTransaction = map.data() as Map<String, dynamic>;

      final itemsSnapshot = await firestore
          .collection(collection)
          .doc(map.id)
          .collection('items_ordered')
          .get();

      final itemsOrdered = await Future.wait(
        itemsSnapshot.docs.map((itemDoc) async {
          final condimentSnapshot = await firestore
              .collection(collection)
              .doc(map.id)
              .collection('items_ordered')
              .doc(itemDoc.id)
              .collection('condiment')
              .get();

          final condiments = condimentSnapshot.docs
              .map(
                (condimentDoc) => ModelItemOrdered.fromMap(
                  condimentDoc.data(),
                  [],
                  true,
                  condimentDoc.id,
                ),
              )
              .toList();

          return ModelItemOrdered.fromMap(
            itemDoc.data(),
            condiments,
            false,
            itemDoc.id,
          );
        }),
      );
      final splitSnapshot = await firestore
          .collection(collection)
          .doc(map.id)
          .collection('data_split')
          .get();

      final splitData = splitSnapshot.docs
          .map((splitDoc) => ModelSplit.fromMap(splitDoc.data()))
          .toList();

      return ModelTransaction(
        idBranch: dataTransaction['id_branch'],
        bankName: dataTransaction['bank_name'],
        itemsOrdered: itemsOrdered,
        dataSplit: splitData,
        date: parseDate(date: dataTransaction['date']),
        note: dataTransaction['note'],
        invoice: map.id,
        namePartner: dataTransaction['name_partner'],
        idPartner: dataTransaction['id_partner'],
        nameOperator: dataTransaction['name_operator'],
        idOperator: dataTransaction['id_operator'],
        paymentMethod: dataTransaction['payment_method'],
        discount: int.tryParse(dataTransaction['discount'].toString()) ?? 0,
        ppn: int.tryParse(dataTransaction['ppn'].toString()) ?? 0,
        totalItem: int.tryParse(dataTransaction['total_item'].toString()) ?? 0,
        charge: int.tryParse(dataTransaction['charge'].toString()) ?? 0,
        subTotal:
            double.tryParse(dataTransaction['sub_total'].toString()) ?? 0.0,
        billPaid:
            double.tryParse(dataTransaction['bill_paid'].toString()) ?? 0.0,
        totalCharge:
            double.tryParse(dataTransaction['total_charge'].toString()) ?? 0.0,
        totalPpn:
            double.tryParse(dataTransaction['total_ppn'].toString()) ?? 0.0,
        totalDiscount:
            double.tryParse(dataTransaction['total_discount'].toString()) ??
            0.0,
        total: double.tryParse(dataTransaction['total'].toString()) ?? 0.0,
        statusTransaction: dataTransaction['status_transaction'],
      );
    }),
  );
}

List<ModelPartner> getDataListPartner(QuerySnapshot data) {
  return data.docs.map((map) {
    final dataPartner = map.data() as Map<String, dynamic>;
    return ModelPartner(
      idBranch: dataPartner['id_branch'],
      id: map.id,
      name: dataPartner['name_partner'],
      phone: dataPartner['phone_partner'],
      email: dataPartner['email_partner'],
      balance: dataPartner['balance_partner'],
      type: PartnerType.values.firstWhere(
        (element) => element.name == dataPartner['type'],
        orElse: () => PartnerType.customer,
      ),
      date: parseDate(date: dataPartner['date']),
    );
  }).toList();
}

List<ModelUser> getDataListUser(QuerySnapshot<Map<String, dynamic>> data) {
  return data.docs
      .map(
        (map) => ModelUser(
          idUser: map.id,
          statusUser: map['status_user'],
          nameUser: map['name_user'],
          emailUser: map['email_user'],
          phoneUser: map['phone_user'],
          roleUser: int.tryParse(map['role_user'].toString())!,
          idBranchUser: map['id_branch'],
          permissionsUser: {
            for (final permission in Permission.values)
              permission: map['status_user'] ?? false
                  ? map['permissions_user'][permission.name] ?? false
                  : false,
          },
          createdUser: parseDate(date: map['created_user'], minute: false),
          noteUser: map['note_user'],
        ),
      )
      .toList();
}

List<ModelItem> getDataListItem(QuerySnapshot data) {
  return data.docs.map((map) {
    final dataItem = map.data() as Map<String, dynamic>;
    return ModelItem(
      nameItem: dataItem['name_item'],
      idItem: map.id,
      priceItem: dataItem['price_item'].toDouble(),
      idCategoryItem: dataItem['id_category'],
      statusCondiment: dataItem['status_condiment'],
      urlImage: dataItem['url_image'],
      qtyItem: dataItem['qty_item'].toDouble(),
      idBranch: dataItem['id_branch'],
      barcode: dataItem['barcode'],
      statusItem: dataItem['status_item'],
      date: parseDate(date: dataItem['date']),
    );
  }).toList();
}

List<ModelCategory> getDataListCategory(QuerySnapshot data) {
  return data.docs.map((map) {
    final dataKetegori = map.data() as Map<String, dynamic>;
    return ModelCategory(
      nameCategory: dataKetegori['name_category'],
      idCategory: map.id,
      idBranch: dataKetegori['id_branch'],
    );
  }).toList();
}
