import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/isar/ModelBase/model_financial_base_isar.dart';
import 'package:flutter_pos/features/data_user/isar/ModelBase/model_partner_base_isar.dart';
import 'package:flutter_pos/features/data_user/isar/ModelBase/model_transaction_base_isar.dart';
import 'package:flutter_pos/features/data_user/isar/ModelBase/model_transaction_financial_base_isar.dart';
import 'package:flutter_pos/features/data_user/isar/ModelBase/model_user_base_isar.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_by.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_category_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_company_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_item_batch_isar.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_company.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_item_ordered_batch.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_split.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/model_data/model_user.dart';

Future<List<ModelItem>> fromIsarItem(
  List<ModelItemIsar> dataItem,
  String? idBranch, {
  bool getAll = false,
}) async {
  final finalDataItem = await dataItem
      .map(
        (element) => ModelItem(
          qtyItem: element.qtyItem,
          nameItem: element.nameItem,
          idItem: element.idItem,
          priceItem: element.priceItem,
          priceItemByBatch: element.priceItemByBatch,
          priceItemBuybyBatch: element.priceItemBuybyBatch,
          idCategoryItem: element.idCategoryItem,
          statusCondiment: StatusDataX.fromString(element.statusCondiment),
          urlImage: element.urlImage,
          idBranch: element.idBranch,
          barcode: element.barcode,
          statusItem: StatusDataX.fromString(element.statusItem),
          date: element.date,
        ),
      )
      .toList();
  for (int i = 0; i < finalDataItem.length; i++) {
    final item = finalDataItem[i];
    double qty = item.getqtyItem;
    final batch = getAll
        ? await getAllBatchIsar()
        : await getBatchIsar(idBranch!);
    final allBatchItems = batch
        .expand((batch) => batch.getitems_batch)
        .where((element) => element.getidItem == item.getidItem);

    for (final itemBatch in allBatchItems) {
      qty += itemBatch.getqtyItem_in - itemBatch.getqtyItem_out;
    }
    finalDataItem[i] = item.copyWith(qtyItem: qty);
  }
  return finalDataItem;
}

ModelItemBatch fromIsarItemBatch(ModelItemBatchIsar batchItem) {
  return ModelItemBatch(
    priceitemBuy: batchItem.priceitemBuy,
    invoice: batchItem.invoice,
    nameItem: batchItem.nameItem,
    idBranch: batchItem.idBranch,
    idItem: batchItem.idItem,
    idOrdered: batchItem.idOrdered,
    idCategoryItem: batchItem.idCategoryItem,
    note: batchItem.note,
    date_buy: batchItem.date_buy,
    expiredDate: batchItem.expiredDate,
    discountItem: batchItem.discountItem,
    qtyItem_in: batchItem.qtyItem_in,
    qtyItem_out: batchItem.qtyItem_out,
    priceItem: batchItem.priceItem,
    subTotal: batchItem.subTotal,
    priceItemFinal: batchItem.priceItemFinal,
  );
}

Future<List<ModelBatch>> fromIsarBatchToList(List<ModelBatchIsar> batch) async {
  return await batch
      .map(
        (e) => ModelBatch(
          invoice: e.invoice,
          idBranch: e.idBranch,
          date_buy: e.dateBuy,
          items_batch: e.itemsBatch
              .map(
                (item) => ModelItemBatch(
                  priceitemBuy: item.priceitemBuy,
                  invoice: item.invoice,
                  nameItem: item.nameItem,
                  idBranch: item.idBranch,
                  idItem: item.idItem,
                  idOrdered: item.idOrdered,
                  idCategoryItem: item.idCategoryItem,
                  note: item.note,
                  date_buy: item.date_buy,
                  expiredDate: item.expiredDate,
                  discountItem: item.discountItem,
                  qtyItem_in: item.qtyItem_in,
                  qtyItem_out: item.qtyItem_out,
                  priceItem: item.priceItem,
                  subTotal: item.subTotal,
                  priceItemFinal: item.priceItemFinal,
                ),
              )
              .toList(),
        ),
      )
      .toList();
}

ModelBatch fromIsarBatch(ModelBatchIsar batch) {
  return ModelBatch(
    invoice: batch.invoice,
    idBranch: batch.idBranch,
    date_buy: batch.dateBuy,
    items_batch: batch.itemsBatch
        .map(
          (item) => ModelItemBatch(
            priceitemBuy: item.priceitemBuy,
            invoice: item.invoice,
            nameItem: item.nameItem,
            idBranch: item.idBranch,
            idItem: item.idItem,
            idOrdered: item.idOrdered,
            idCategoryItem: item.idCategoryItem,
            note: item.note,
            date_buy: item.date_buy,
            expiredDate: item.expiredDate,
            discountItem: item.discountItem,
            qtyItem_in: item.qtyItem_in,
            qtyItem_out: item.qtyItem_out,
            priceItem: item.priceItem,
            subTotal: item.subTotal,
            priceItemFinal: item.priceItemFinal,
          ),
        )
        .toList(),
  );
}

ModelCategory fromIsarCategory(ModelCategoryIsar data) {
  return ModelCategory(
    nameCategory: data.nameCategory,
    idCategory: data.idCategory,
    idBranch: data.idBranch,
  );
}

ModelPartner fromIsarPartner<T extends ModelPartnerBaseIsar>({
  required T object,
}) {
  return ModelPartner(
    idBranchPartner: object.idBranch,
    idPartner: object.idPartner,
    namePartner: object.namePartner,
    phonePartner: object.phonePartner,
    emailPartner: object.emailPartner,
    balancePartner: object.balancePartner,
    typePartner: PartnerType.values.firstWhere(
      (element) => element.name == object.typePartner,
    ),
    date: object.date,
  );
}

ModelTransactionFinancial fromIsarTransactionFinancial<
  T extends ModelTransactionFinancialBaseIsar
>({required T object}) {
  return ModelTransactionFinancial(
    idFinancial: object.idFinancial,
    nameFinancial: object.nameFinancial,
    idBranch: object.idBranch,
    invoice: object.invoice,
    date: object.date,
    note: object.note,
    amount: object.amount,
    statusTransaction: ListStatusTransactionX.fromString(
      object.statusTransaction,
    ),
  );
}

ModelTransaction fromIsarTransaction<T extends ModelTransactionBaseIsar>({
  required T object,
}) {
  return ModelTransaction(
    idBranch: object.idBranch,
    itemsOrdered: object.itemsOrdered
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
    dataSplit: object.dataSplit
        .map(
          (split) => ModelSplit(
            paymentName: LabelPaymentMethodX.fromString(split.paymentName)!,
            paymentTotal: split.paymentTotal,
            paymentDebitName: split.paymentDebitName,
            paymentInvoice: split.paymentInvoice,
          ),
        )
        .toList(),
    date: object.date,
    note: object.note,
    invoice: object.invoice,
    paymentMethod: LabelPaymentMethodX.fromString(object.paymentMethod)!,
    discount: object.discount,
    ppn: object.ppn,
    totalItem: object.totalItem,
    charge: object.charge,
    subTotal: object.subTotal,
    billPaid: object.billPaid,
    totalCharge: object.totalCharge,
    totalPpn: object.totalPpn,
    totalDiscount: object.totalDiscount,
    total: object.total,
    statusTransaction: ListStatusTransactionX.fromString(
      object.statusTransaction,
    ),
    bankName: object.bankName,
    idOperator: object.idOperator,
    nameOperator: object.nameOperator,
    idPartner: object.idPartner,
    namePartner: object.namePartner,
  );
}

ModelFinancial fromIsarFinancial<T extends ModelFinancialBaseIsar>({
  required T object,
}) {
  return ModelFinancial(
    type: FinancialType.values.firstWhere(
      (element) => element.name == object.type,
    ),
    idFinancial: object.idFinancial,
    nameFinancial: object.nameFinancial,
    idBranch: object.idBranch,
  );
}

ModelUser fromIsarUser<T extends ModelUserBaseIsar>(T object) {
  return ModelUser(
    idUser: object.idUser,
    createdUser: object.createdUser,
    idBranchUser: object.idBranchUser,
    noteUser: object.noteUser,
    statusUser: StatusDataX.fromString(object.statusUser),
    nameUser: object.nameUser,
    emailUser: object.emailUser,
    phoneUser: object.phoneUser,
    roleUser: RoleTypeX.fromString(object.roleUser)!,
    permissionsUser: {
      Permission.Stok: object.Stok,
      Permission.Inventory: object.Inventory,
      Permission.Penjualan: object.Penjualan,
      Permission.Pembelian: object.Pembelian,
      Permission.Pendapatan: object.Pendapatan,
      Permission.Pengeluaran: object.Pengeluaran,
      Permission.Data_Pelanggan: object.Data_Pelanggan,
      Permission.Data_Pemasok: object.Data_Pemasok,
      Permission.Data_Pemasukan: object.Data_Pemasukan,
      Permission.Data_Pengeluaran: object.Data_Pengeluaran,
      Permission.Data_Operator: object.Data_Operator,
      Permission.Riwayat_Penjualan: object.Riwayat_Penjualan,
      Permission.Riwayat_Pembelian: object.Riwayat_Pembelian,
      Permission.Riwayat_Pendapatan: object.Riwayat_Pendapatan,
      Permission.Riwayat_Pengeluaran: object.Riwayat_Pengeluaran,
      Permission.Laporan: object.Laporan,
    },
  );
}

ModelCompany fromIsarCompany(ModelCompanyIsar object) {
  return ModelCompany(
    listBranch: object.listBranch
        .map(
          (e) => ModelBranch(
            nameBranch: e.nameBranch,
            numTelpBranch: e.numTelpBranch,
            addressBranch: e.addressBranch,
            idBranch: e.idBranch,
          ),
        )
        .toList(),
    footer: object.footer,
    header: object.header,
    nameCompany: object.nameCompany,
    phoneCompany: object.phoneCompany,
    created: object.created,
  );
}
