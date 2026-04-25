import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/isar/ModelBase/model_financial_base_isar.dart';
import 'package:flutter_pos/features/data_user/isar/ModelBase/model_partner_base_isar.dart';
import 'package:flutter_pos/features/data_user/isar/ModelBase/model_transaction_base_isar.dart';
import 'package:flutter_pos/features/data_user/isar/ModelBase/model_transaction_financial_base_isar.dart';
import 'package:flutter_pos/features/data_user/isar/ModelBase/model_user_base_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_adjustment_in_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_adjustment_out_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_category_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_counter_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_item_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_item_ordered_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_item_ordered_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_split_isar.dart';
import 'package:flutter_pos/model_data/model_transaction_adjustment_in.dart';
import 'package:flutter_pos/model_data/model_transaction_adjustment_out.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_counter.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/model_data/model_user.dart';

ModelBatchIsar convertBatch(ModelBatch data) {
  return ModelBatchIsar()
    ..invoice = data.getinvoice
    ..idBranch = data.getidBranch
    ..dateBuy = data.getdate_buy
    ..itemsBatch = data.getitems_batch.map((e) => convertItemBatch(e)).toList();
}

ModelItemBatchIsar convertItemBatch(ModelItemBatch data) {
  return ModelItemBatchIsar()
    ..invoice = data.getinvoice
    ..idOrdered = data.getidOrdered
    ..priceitemBuy = data.getpriceItemBuy
    ..nameItem = data.getnameItem
    ..idBranch = data.getidBranch
    ..idItem = data.getidItem
    ..idCategoryItem = data.getidCategoryItem
    ..note = data.getnote
    ..date_buy = data.getdateBuy
    ..expiredDate = data.getexpiredDate
    ..discountItem = data.getdiscountItem
    ..qtyItem_in = data.getqtyItem_in
    ..qtyItem_out = data.getqtyItem_out
    ..priceItem = data.getpriceItem
    ..subTotal = data.getsubTotal
    ..priceItemFinal = data.getpriceItemFinal;
}

ModelCategoryIsar convertCategory(ModelCategory data) {
  return ModelCategoryIsar()
    ..idCategory = data.getidCategory
    ..idBranch = data.getidBranch
    ..nameCategory = data.getnameCategory;
}

ModelCounterIsar convertCounter(ModelCounter data) {
  return ModelCounterIsar()
    ..idBranch = data.getidBranch
    ..counterSell = data.getcounterSell
    ..counterSellSaved = data.getcounterSellSaved
    ..counterBuy = data.getcounterBuy
    ..counterIncome = data.getcounterIncome
    ..counterExpense = data.getcounterExpense
    ..counterAdjustmentIn = data.getcounterAdjustmentIn
    ..counterAdjustmentOut = data.getcounterAdjustmentOut;
}

T convertFinancial<T extends ModelFinancialBaseIsar>(
  ModelFinancial financial,
  T Function() creator,
) {
  final object = creator();
  return object
    ..idFinancial = financial.getidFinancial
    ..idBranch = financial.getidBranch
    ..type = financial.getfinancialType.name
    ..nameFinancial = financial.getnameFinancial;
}

ModelItemIsar convertItem(ModelItem data) {
  return ModelItemIsar()
    ..idItem = data.getidItem
    ..nameItem = data.getnameItem
    ..idCategoryItem = data.getidCategoryiItem
    ..urlImage = data.geturlImage
    ..idBranch = data.getidBranch
    ..barcode = data.getBarcode
    ..date = data.getDateItem
    ..priceItem = data.getpriceItem
    ..qtyItem = data.getqtyItem
    ..priceItemBuybyBatch = data.getpriceItemBuybyBatch
    ..priceItemByBatch = data.getpriceItembyBatch
    ..statusCondiment = data.getstatusCondiment.name
    ..statusItem = data.getStatusItem.name;
}

ModelTransactionAdjustmentInIsar convertTransactionAdjustmentIn(
  ModelTransactionAdjustmentIn data,
) {
  return ModelTransactionAdjustmentInIsar()
    ..idBranch = data.getidBranch
    ..invoice = data.getinvoice
    ..itemInvoice = data.getitemInvoice
    ..itemName = data.getitemName
    ..buyPriceAfter = data.getbuyPriceAfter
    ..buyPriceBefore = data.getbuyPriceBefore
    ..sellPriceAfter = data.getsellPriceAfter
    ..sellPriceBefore = data.getsellPriceBefore
    ..date = data.getdate
    ..expiredDateAfter = data.getexpiredDateAfter
    ..expiredDateBefore = data.getexpiredDateBefore
    ..qty_in_after = data.getqty_in_after
    ..qty_in_before = data.getqty_in_before
    ..note = data.getnote;
}

ModelTransactionAdjustmentOutIsar convertTransactionAdjustmentOut(
  ModelTransactionAdjustmentOut data,
) {
  return ModelTransactionAdjustmentOutIsar()
    ..idBranch = data.getidBranch
    ..invoice = data.getinvoice
    ..itemInvoice = data.getitemInvoice
    ..itemName = data.getitemName
    ..date = data.getdate
    ..note = data.getnote
    ..qty_out_after = data.qty_out_after
    ..qty_out_before = data.qty_out_before;
}

T convertPartner<T extends ModelPartnerBaseIsar>(
  ModelPartner partner,
  T Function() creator,
) {
  final object = creator();
  return object
    ..idPartner = partner.getidPartner
    ..idBranch = partner.getidBranchPartner
    ..typePartner = partner.gettypePartner.name
    ..namePartner = partner.getnamePartner
    ..phonePartner = partner.getphonePartner
    ..emailPartner = partner.getemailPartner
    ..balancePartner = partner.getbalancePartner
    ..date = partner.getdate;
}

T convertTransaction<T extends ModelTransactionBaseIsar>(
  ModelTransaction trx,
  T Function() creator,
) {
  final object = creator();

  return object
    ..invoice = trx.getinvoice
    ..idBranch = trx.getidBranch
    ..statusTransaction = trx.getstatusTransaction!.name
    ..paymentMethod = trx.getpaymentMethod.name
    ..date = trx.getdate
    ..bankName = trx.getbankName
    ..note = trx.getnote
    ..namePartner = trx.getnamePartner
    ..idPartner = trx.getidPartner
    ..nameOperator = trx.getnameOperator
    ..idOperator = trx.getidOperator
    ..discount = trx.getdiscount
    ..ppn = trx.getppn
    ..totalItem = trx.gettotalItem
    ..charge = trx.getcharge
    ..subTotal = trx.getsubTotal
    ..billPaid = trx.getbillPaid
    ..totalCharge = trx.gettotalCharge
    ..totalPpn = trx.gettotalPpn
    ..totalDiscount = trx.gettotalDiscount
    ..total = trx.gettotal
    ..itemsOrdered = trx.getitemsOrdered
        .map(
          (item) => ModelItemOrderedIsar()
            ..idOrdered = item.getidOrdered
            ..invoice = item.getinvoice
            ..dateBuy = item.getdateBuy
            ..expiredDate = item.getexpiredDate
            ..priceItemFinal = item.getpriceItemFinal
            ..subTotal = item.getsubTotal
            ..nameItem = item.getnameItem
            ..idItem = item.getidItem
            ..idBranch = item.getidBranch
            ..qtyItem = item.getqtyItem
            ..priceItem = item.getpriceItem
            ..priceItemBuy = item.getpriceItemBuy
            ..discountItem = item.getdiscountItem
            ..idCategoryItem = item.getidCategoryItem
            ..note = item.getNote
            ..itemOrderedBatch = item.getitemOrderedBatch
                .map(
                  (b) => ModelItemOrderedBatchIsar()
                    ..id_ordered = b.getid_Ordered
                    ..invoice = b.getinvoice
                    ..id_item = b.getid_Item
                    ..qty_item = b.getqty_item
                    ..price_item = b.getprice_item
                    ..price_itemBuy = b.getprice_itemBuy
                    ..isNegative = b.getisNegative,
                )
                .toList()
            ..condiment = item.getCondiment
                .map(
                  (c) => ModelItemOrderedIsar()
                    ..invoice = null
                    ..idOrdered = c.getidOrdered
                    ..dateBuy = c.getdateBuy
                    ..expiredDate = c.getexpiredDate
                    ..priceItemFinal = c.getpriceItemFinal
                    ..subTotal = c.getsubTotal
                    ..nameItem = c.getnameItem
                    ..idItem = c.getidItem
                    ..idBranch = c.getidBranch
                    ..qtyItem = c.getqtyItem
                    ..priceItem = c.getpriceItem
                    ..priceItemBuy = c.getpriceItemBuy
                    ..discountItem = c.getdiscountItem
                    ..idCategoryItem = c.getidCategoryItem
                    ..note = c.getNote,
                )
                .toList(),
        )
        .toList()
    ..dataSplit = trx.getdataSplit
        .map(
          (s) => ModelSplitIsar()
            ..paymentInvoice = s.getpaymentInvoice!
            ..paymentName = s.getpaymentName.name
            ..paymentDebitName = s.getpaymentDebitName
            ..paymentTotal = s.getpaymentTotal,
        )
        .toList();
}

T convertTransactionFinancial<T extends ModelTransactionFinancialBaseIsar>(
  ModelTransactionFinancial trx,
  T Function() creator,
) {
  final object = creator();

  return object
    ..invoice = trx.getinvoice
    ..idBranch = trx.getidBranch
    ..statusTransaction = trx.getstatusTransaction!.name
    ..idFinancial = trx.getidFinancial
    ..nameFinancial = trx.getnameFinancial
    ..note = trx.getnote
    ..date = trx.getdate
    ..amount = trx.getamount;
}

Future<T> convertUser<T extends ModelUserBaseIsar>(
  ModelUser user,
  T Function() creator,
) async {
  final object = creator();
  final permissions = user.getPermissionsUser;
  return object
    ..idUser = user.getIdUser!
    ..idBranchUser = user.getRoleUser == RoleType.Pemilik
        ? null
        : user.getIdBranchUser
    ..statusUser = user.getstatusUser.name
    ..roleUser = user.getRoleUser.name
    ..nameUser = user.getNameUser
    ..emailUser = user.getEmailUser
    ..phoneUser = user.getPhoneUser
    ..createdUser = user.getCreatedUser
    ..noteUser = user.getNoteUser
    ..Stok = permissions[Permission.Stok] ?? false
    ..Penyesuaian = permissions[Permission.Penyesuaian] ?? false
    ..Inventory = permissions[Permission.Inventory] ?? false
    ..Penjualan = permissions[Permission.Penjualan] ?? false
    ..Pembelian = permissions[Permission.Pembelian] ?? false
    ..Pendapatan = permissions[Permission.Pendapatan] ?? false
    ..Pengeluaran = permissions[Permission.Pengeluaran] ?? false
    ..Data_Pelanggan = permissions[Permission.Data_Pelanggan] ?? false
    ..Data_Pemasok = permissions[Permission.Data_Pemasok] ?? false
    ..Data_Pemasukan = permissions[Permission.Data_Pemasukan] ?? false
    ..Data_Pengeluaran = permissions[Permission.Data_Pengeluaran] ?? false
    ..Data_Operator = permissions[Permission.Data_Operator] ?? false
    ..Riwayat_Penjualan = permissions[Permission.Riwayat_Penjualan] ?? false
    ..Riwayat_Pembelian = permissions[Permission.Riwayat_Pembelian] ?? false
    ..Riwayat_Pendapatan = permissions[Permission.Riwayat_Pendapatan] ?? false
    ..Riwayat_Pengeluaran = permissions[Permission.Riwayat_Pengeluaran] ?? false
    ..Riwayat_Penyesuaian = permissions[Permission.Riwayat_Penyesuaian] ?? false
    ..Laporan = permissions[Permission.Laporan] ?? false;
}
