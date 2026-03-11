import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/model_data/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_category_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_company_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_counter_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_financial_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_partner_isar.dart';
import 'package:flutter_pos/model_data/isar/collection/model_user_isar.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_company.dart';
import 'package:flutter_pos/model_data/model_counter.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/service/isar_service.dart';
import 'package:isar/isar.dart';

Future<List<ModelBatch>> getBatchIsar(String idBranch) async {
  final allBatch = await isar.modelBatchIsars
      .where()
      .idBranchNotEqualTo(idBranch)
      .findAll();
  return allBatch
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

Future<List<ModelCategory>> getCategoryIsar(String idBranch) async {
  final allCategory = await isar.modelCategoryIsars.where().findAll();
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

Future<ModelCompany> getCompanyIsar(String idBranch) async {
  final company = await isar.modelCompanyIsars.where().findFirst();
  return ModelCompany(
    listBranch: company!.listBranch
        .map(
          (e) => ModelBranch(
            nameBranch: e.nameBranch,
            numTelpBranch: e.numTelpBranch,
            addressBranch: e.addressBranch,
            idBranch: e.idBranch,
          ),
        )
        .toList(),
    nameCompany: company.nameCompany,
    phoneCompany: company.phoneCompany,
    created: company.created,
  );
}

Future<ModelCounter> getCounterIsar(String idBranch) async {
  final allCounter = await isar.modelCounterIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findFirst();
  return ModelCounter(
    counterSell: allCounter!.counterSell,
    counterBuy: allCounter.counterBuy,
    counterIncome: allCounter.counterIncome,
    counterExpense: allCounter.counterExpense,
    idBranch: allCounter.idBranch,
  );
}

Future<List<ModelFinancial>> getFinancialIsar(String idBranch) async {
  final allFianncial = await isar.modelFinancialIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return allFianncial
      .map(
        (financial) => ModelFinancial(
          type: FinancialType.values.firstWhere(
            (element) => element.name == financial.type,
          ),
          idFinancial: financial.idFinancial,
          nameFinancial: financial.nameFinancial,
          idBranch: financial.idBranch,
        ),
      )
      .toList();
}

Future<List<ModelItem>> getItemIsar(String idBranch) async {
  final allItem = await isar.modelItemIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return allItem
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
}

Future<List<ModelPartner>> getPartnerIsar(String idBranch) async {
  final allPartner = await isar.modelPartnerIsars
      .where()
      .idBranchEqualTo(idBranch)
      .findAll();
  return allPartner
      .map(
        (e) => ModelPartner(
          idBranch: e.idBranch,
          id: e.id,
          name: e.name,
          phone: e.phone,
          email: e.email,
          balance: e.balance,
          type: PartnerType.values.firstWhere(
            (element) => element.name == e.type,
          ),
          date: e.date,
        ),
      )
      .toList();
}

Future<List<ModelUser>> getUserIsar() async {
  final allUser = await isar.modelUserIsars.where().findAll();

  return allUser.map((e) {
    return ModelUser(
      nameUser: e.nameUser,
      emailUser: e.emailUser,
      phoneUser: e.phoneUser,
      roleUser: RoleTypeX.fromString(e.roleUser)!,
      idBranchUser: e.idBranchUser,
      createdUser: e.createdUser,
      noteUser: e.noteUser,
      statusUser: StatusDataX.fromString(e.statusUser),
      permissionsUser: {
        Permission.Stok: e.Stok,
        Permission.Inventory: e.Inventory,
        Permission.Penjualan: e.Penjualan,
        Permission.Pembelian: e.Pembelian,
        Permission.Pendapatan: e.Pendapatan,
        Permission.Pengeluaran: e.Pengeluaran,
        Permission.Data_Pelanggan: e.Data_Pelanggan,
        Permission.Data_Pemasok: e.Data_Pemasok,
        Permission.Data_Pemasukan: e.Data_Pemasukan,
        Permission.Data_Pengeluaran: e.Data_Pengeluaran,
        Permission.Data_Operator: e.Data_Operator,
        Permission.Riwayat_Penjualan: e.Riwayat_Penjualan,
        Permission.Riwayat_Pembelian: e.Riwayat_Pembelian,
        Permission.Riwayat_Pendapatan: e.Riwayat_Pendapatan,
        Permission.Riwayat_Pengeluaran: e.Riwayat_Pengeluaran,
        Permission.Laporan: e.Laporan,
      },
    );
  }).toList();
}
