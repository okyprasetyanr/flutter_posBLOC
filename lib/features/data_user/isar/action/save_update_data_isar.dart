import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/isar/ModelBase/model_transaction_base_isar.dart';
import 'package:flutter_pos/features/data_user/isar/ModelBase/model_transaction_financial_base_isar.dart';
import 'package:flutter_pos/features/data_user/isar/ModelBase/model_user_base_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_account_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_category_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_company_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_counter_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_financial_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_customer_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_supplier_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_buy_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_expense_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_income_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_sell_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_user_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_branch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_item_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_item_ordered_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_item_ordered_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_split_isar.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_company.dart';
import 'package:flutter_pos/model_data/model_counter.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/service/isar_service.dart';

Future<void> saveBatch_Isar(ModelBatch batch) async {
  final data = ModelBatchIsar()
    ..invoice = batch.getinvoice
    ..idBranch = batch.getidBranch
    ..dateBuy = batch.getdate_buy
    ..itemsBatch = batch.getitems_batch
        .map(
          (item) => ModelItemBatchIsar()
            ..invoice = item.getinvoice
            ..idOrdered = item.getidOrdered
            ..priceitemBuy = item.getpriceItemBuy
            ..nameItem = item.getnameItem
            ..idBranch = item.getidBranch
            ..idItem = item.getidItem
            ..idCategoryItem = item.getidCategoryItem
            ..note = item.getnote
            ..date_buy = item.getdateBuy
            ..expiredDate = item.getexpiredDate
            ..discountItem = item.getdiscountItem
            ..qtyItem_in = item.getqtyItem_in
            ..qtyItem_out = item.getqtyItem_out
            ..priceItem = item.getpriceItem
            ..subTotal = item.getsubTotal
            ..priceItemFinal = item.getpriceItemFinal,
        )
        .toList();

  await isar.writeTxn(() async {
    await isar.modelBatchIsars.put(data);
  });
}

Future<void> saveCategory_Isar(ModelCategory category) async {
  final data = ModelCategoryIsar()
    ..idCategory = category.getidCategory
    ..idBranch = category.getidBranch
    ..nameCategory = category.getnameCategory;

  await isar.writeTxn(() async {
    await isar.modelCategoryIsars.put(data);
  });
}

Future<void> saveCompany_Isar(ModelCompany company) async {
  final data = ModelCompanyIsar()
    ..nameCompany = company.getnameCompany
    ..phoneCompany = company.getphoneCompany
    ..created = company.getcreated
    ..header = company.getHeader
    ..footer = company.getFooter
    ..listBranch = company.getListBranch
        .map(
          (branch) => ModelBranchIsar()
            ..idBranch = branch.getidBranch
            ..nameBranch = branch.getareaBranch
            ..numTelpBranch = branch.getnumTelpBranch
            ..addressBranch = branch.getaddressBranch,
        )
        .toList();

  await isar.writeTxn(() async {
    await isar.modelCompanyIsars.put(data);
  });
}

Future<void> saveCounter_Isar(ModelCounter counter) async {
  final data = ModelCounterIsar()
    ..idBranch = counter.getidBranch
    ..counterSell = counter.getcounterSell
    ..counterSellSaved = counter.getcounterSellSaved
    ..counterBuy = counter.getcounterBuy
    ..counterIncome = counter.getcounterIncome
    ..counterExpense = counter.getcounterExpense;

  await isar.writeTxn(() async {
    await isar.modelCounterIsars.put(data);
  });
}

Future<void> saveFinancial_Isar(ModelFinancial financial) async {
  final data = ModelFinancialIsar()
    ..idFinancial = financial.getidFinancial
    ..idBranch = financial.getidBranch
    ..type = financial.getfinancialType.name
    ..nameFinancial = financial.getnameFinancial;

  await isar.writeTxn(() async {
    await isar.modelFinancialIsars.put(data);
  });
}

Future<void> saveItem_Isar(ModelItem item) async {
  final user = ModelItemIsar()
    ..idItem = item.getidItem
    ..nameItem = item.getnameItem
    ..idCategoryItem = item.getidCategoryiItem
    ..urlImage = item.geturlImage
    ..idBranch = item.getidBranch
    ..barcode = item.getBarcode
    ..date = item.getDateItem
    ..priceItem = item.getpriceItem
    ..qtyItem = item.getqtyItem
    ..priceItemBuybyBatch = item.getpriceItemBuybyBatch
    ..priceItemByBatch = item.getpriceItembyBatch
    ..statusCondiment = item.getstatusCondiment.name
    ..statusItem = item.getStatusItem.name;

  await isar.writeTxn(() async {
    await isar.modelItemIsars.put(user); // put = insert/update
  });
}

Future<void> saveSupplier_Isar(ModelPartner partner) async {
  final data = ModelSupplierIsar()
    ..idPartner = partner.getidPartner
    ..idBranch = partner.getidBranchPartner
    ..typePartner = partner.gettypePartner.name
    ..namePartner = partner.getnamePartner
    ..phonePartner = partner.getphonePartner
    ..emailPartner = partner.getemailPartner
    ..balancePartner = partner.getbalancePartner
    ..date = partner.getdate;

  await isar.writeTxn(() async {
    await isar.modelSupplierIsars.put(data);
  });
}

Future<void> saveTransactionBuy_Isar(ModelTransaction trx) async {
  final data = convertTransaction(trx, ModelTransactionBuyIsar.new);

  await isar.writeTxn(() async {
    await isar.modelTransactionBuyIsars.put(data);
  });
}

Future<void> saveTransactionSell_Isar(ModelTransaction trx) async {
  final data = convertTransaction(trx, ModelTransactionSellIsar.new);

  await isar.writeTxn(() async {
    await isar.modelTransactionSellIsars.put(data);
  });
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
                    ..idOrdered = c.getidOrdered
                    ..invoice = c.getinvoice
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

Future<void> saveTransactionFinancialExpense_Isar(
  ModelTransactionFinancial trx,
) async {
  final data = convertTransactionFinancial(
    trx,
    ModelTransactionFinancialExpenseIsar.new,
  );

  await isar.writeTxn(() async {
    await isar.modelTransactionFinancialExpenseIsars.put(data);
  });
}

Future<void> saveTransactionFinancialncome_Isar(
  ModelTransactionFinancial trx,
) async {
  final data = convertTransactionFinancial(
    trx,
    ModelTransactionFinancialIncomeIsar.new,
  );

  await isar.writeTxn(() async {
    await isar.modelTransactionFinancialIncomeIsars.put(data);
  });
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

Future<void> saveUser_Isar(ModelUser user) async {
  await isar.writeTxn(() async {
    await isar.modelUserIsars.put(await convertUser(user, ModelUserIsar.new));
  });
}

Future<void> saveAccount_Isar(ModelUser user) async {
  await isar.writeTxn(
    () async => await isar.modelAccountIsars.put(
      await convertUser(user, ModelAccountIsar.new),
    ),
  );
}

Future<T> convertUser<T extends ModelUserBaseIsar>(
  ModelUser user,
  T Function() creator,
) async {
  final object = creator();
  final permissions = user.getPermissionsUser;
  return object
    ..idUser = user.getIdUser!
    ..idBranchUser = user.getIdBranchUser
    ..statusUser = user.getstatusUser.name
    ..roleUser = user.getRoleUser.name
    ..nameUser = user.getNameUser
    ..emailUser = user.getEmailUser
    ..phoneUser = user.getPhoneUser
    ..createdUser = user.getCreatedUser
    ..noteUser = user.getNoteUser
    ..Stok = permissions[Permission.Stok] ?? false
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
    ..Laporan = permissions[Permission.Laporan] ?? false;
}
