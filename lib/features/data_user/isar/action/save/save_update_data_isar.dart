import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_account_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_batch_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_category_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_company_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_counter_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_expense_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_income_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_item_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_customer_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_supplier_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_buy_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_expense_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_financial_income_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_transaction_sell_isar.dart';
import 'package:flutter_pos/features/data_user/isar/collection/model_user_isar.dart';
import 'package:flutter_pos/features/data_user/isar/embedded/model_branch_isar.dart';
import 'package:flutter_pos/from_and_to_map/convert_to_isar.dart';
import 'package:flutter_pos/model_data/model_batch.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/model_data/model_company.dart';
import 'package:flutter_pos/model_data/model_counter.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/service/isar_service.dart';
import 'package:isar/isar.dart';

Future<void> saveBatch_Isar(ModelBatch batch) async {
  await isar.writeTxn(() async {
    await isar.modelBatchIsars.put(convertBatch(batch));
  });
}

Future<void> updateItemBatch_Isar(ModelItemBatch itemBatch) async {
  final data = await isar.modelBatchIsars
      .where()
      .invoiceEqualTo(itemBatch.getinvoice)
      .findFirst();

  await isar.writeTxn(() async {
    final indexData = data!.itemsBatch.indexWhere(
      (element) => element.idOrdered == itemBatch.getidOrdered,
    );
    final updatedItem = data.itemsBatch[indexData]
      ..qtyItem_in = itemBatch.getqtyItem_in
      ..priceItemFinal = itemBatch.getpriceItemFinal
      ..priceitemBuy = itemBatch.getpriceItemBuy
      ..expiredDate = itemBatch.getexpiredDate;

    data.itemsBatch[indexData] = updatedItem;
    await isar.modelBatchIsars.put(data);
  });
}

Future<void> saveItem_Isar(ModelItem item) async {
  final data = await isar.modelItemIsars
      .where()
      .idItemEqualTo(item.getidItem)
      .findFirst();
  await isar.writeTxn(() async {
    if (data != null) {
      data
        ..nameItem = item.getnameItem
        ..idCategoryItem = item.getidCategoryiItem
        ..statusCondiment = item.getstatusCondiment.name
        ..statusItem = item.getStatusItem.name
        ..priceItem = item.getpriceItem
        ..barcode = item.getBarcode;
      await isar.modelItemIsars.put(data);
    } else {
      await isar.modelItemIsars.put(convertItem(item));
    }
  });
}

Future<void> saveCategory_Isar(ModelCategory category) async {
  final data = await isar.modelCategoryIsars
      .where()
      .idCategoryEqualTo(category.getidCategory)
      .findFirst();
  await isar.writeTxn(() async {
    if (data != null) {
      data..nameCategory = category.getnameCategory;
      await isar.modelCategoryIsars.put(data);
    } else {
      await isar.modelCategoryIsars.put(convertCategory(category));
    }
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
  final data = await isar.modelCounterIsars
      .where()
      .idBranchEqualTo(counter.getidBranch)
      .findFirst();

  await isar.writeTxn(() async {
    if (data != null) {
      data
        ..counterSell = counter.getcounterSell
        ..counterSellSaved = counter.getcounterSellSaved
        ..counterBuy = counter.getcounterBuy
        ..counterIncome = counter.getcounterIncome
        ..counterExpense = counter.getcounterExpense;
      await isar.modelCounterIsars.put(data);
    } else {
      await isar.modelCounterIsars.put(convertCounter(counter));
    }
  });
}

Future<void> saveIncome_Isar(ModelFinancial income) async {
  final data = await isar.modelIncomeIsars
      .where()
      .idFinancialEqualTo(income.getidFinancial)
      .findFirst();
  return await isar.writeTxn(() async {
    if (data != null) {
      data..nameFinancial = income.getnameFinancial;
      await isar.modelIncomeIsars.put(data);
    } else {
      await isar.modelIncomeIsars.put(
        await convertFinancial(income, ModelIncomeIsar.new),
      );
    }
  });
}

Future<void> saveExpense_Isar(ModelFinancial expense) async {
  final data = await isar.modelExpenseIsars
      .where()
      .idFinancialEqualTo(expense.getidFinancial)
      .findFirst();
  return await isar.writeTxn(() async {
    if (data != null) {
      data..nameFinancial = expense.getnameFinancial;
      await isar.modelExpenseIsars.put(data);
    } else {
      await isar.modelExpenseIsars.put(
        await convertFinancial(expense, ModelExpenseIsar.new),
      );
    }
  });
}

Future<void> saveSupplier_Isar(ModelPartner partner) async {
  final data = await isar.modelSupplierIsars
      .where()
      .idPartnerEqualTo(partner.getidPartner)
      .findFirst();
  await isar.writeTxn(() async {
    if (data != null) {
      data
        ..emailPartner = partner.getemailPartner
        ..namePartner = partner.getnamePartner
        ..phonePartner = partner.getphonePartner;
      await isar.modelSupplierIsars.put(data);
    } else {
      await isar.modelSupplierIsars.put(
        await convertPartner(partner, ModelSupplierIsar.new),
      );
    }
  });
}

Future<void> saveCustomer_Isar(ModelPartner partner) async {
  final data = await isar.modelCustomerIsars
      .where()
      .idPartnerEqualTo(partner.getidPartner)
      .findFirst();
  await isar.writeTxn(() async {
    if (data != null) {
      data
        ..emailPartner = partner.getemailPartner
        ..namePartner = partner.getnamePartner
        ..phonePartner = partner.getphonePartner;
      await isar.modelCustomerIsars.put(data);
    } else {
      await isar.modelCustomerIsars.put(
        await convertPartner(partner, ModelCustomerIsar.new),
      );
    }
  });
}

Future<void> saveTransactionBuy_Isar(ModelTransaction trx) async {
  final data = await isar.modelTransactionBuyIsars
      .where()
      .invoiceEqualTo(trx.getinvoice)
      .findFirst();

  await isar.writeTxn(() async {
    if (data != null) {
      data..statusTransaction = trx.getstatusTransaction!.name;
      await isar.modelTransactionBuyIsars.put(data);
    } else {
      await isar.modelTransactionBuyIsars.put(
        await convertTransaction(trx, ModelTransactionBuyIsar.new),
      );
    }
  });
}

Future<void> saveTransactionSell_Isar(ModelTransaction trx) async {
  final data = await isar.modelTransactionSellIsars
      .where()
      .invoiceEqualTo(trx.getinvoice)
      .findFirst();

  await isar.writeTxn(() async {
    if (data != null) {
      data..statusTransaction = trx.getstatusTransaction!.name;
      await isar.modelTransactionSellIsars.put(data);
    } else {
      await isar.modelTransactionSellIsars.put(
        await convertTransaction(trx, ModelTransactionSellIsar.new),
      );
    }
  });
}

Future<void> saveTransactionFinancialExpense_Isar(
  ModelTransactionFinancial trx,
) async {
  final data = await isar.modelTransactionFinancialExpenseIsars
      .where()
      .invoiceEqualTo(trx.getinvoice)
      .findFirst();
  await isar.writeTxn(() async {
    if (data != null) {
      data..statusTransaction = trx.getstatusTransaction!.name;
      await isar.modelTransactionFinancialExpenseIsars.put(data);
    } else {
      await isar.modelTransactionFinancialExpenseIsars.put(
        convertTransactionFinancial(
          trx,
          ModelTransactionFinancialExpenseIsar.new,
        ),
      );
    }
  });
}

Future<void> saveTransactionFinancialncome_Isar(
  ModelTransactionFinancial trx,
) async {
  final data = await isar.modelTransactionFinancialIncomeIsars
      .where()
      .invoiceEqualTo(trx.getinvoice)
      .findFirst();
  await isar.writeTxn(() async {
    if (data != null) {
      data..statusTransaction = trx.getstatusTransaction!.name;
      await isar.modelTransactionFinancialIncomeIsars.put(data);
    } else {
      await isar.modelTransactionFinancialIncomeIsars.put(
        convertTransactionFinancial(
          trx,
          ModelTransactionFinancialIncomeIsar.new,
        ),
      );
    }
  });
}

Future<void> saveUser_Isar(ModelUser user) async {
  ModelUserIsar? data = await isar.modelUserIsars.getByIdUser(user.getIdUser!);
  if (data != null) {
    data
      ..idUser = user.getIdUser!
      ..idBranchUser = user.getIdBranchUser
      ..statusUser = user.getstatusUser.name
      ..roleUser = user.getRoleUser.name
      ..nameUser = user.getNameUser
      ..emailUser = user.getEmailUser
      ..phoneUser = user.getPhoneUser
      ..createdUser = user.getCreatedUser
      ..noteUser = user.getNoteUser
      ..Stok = user.getPermissionsUser[Permission.Stok] ?? false
      ..Penyesuaian = user.getPermissionsUser[Permission.Penyesuaian] ?? false
      ..Inventory = user.getPermissionsUser[Permission.Inventory] ?? false
      ..Penjualan = user.getPermissionsUser[Permission.Penjualan] ?? false
      ..Pembelian = user.getPermissionsUser[Permission.Pembelian] ?? false
      ..Pendapatan = user.getPermissionsUser[Permission.Pendapatan] ?? false
      ..Pengeluaran = user.getPermissionsUser[Permission.Pengeluaran] ?? false
      ..Data_Pelanggan =
          user.getPermissionsUser[Permission.Data_Pelanggan] ?? false
      ..Data_Pemasok = user.getPermissionsUser[Permission.Data_Pemasok] ?? false
      ..Data_Pemasukan =
          user.getPermissionsUser[Permission.Data_Pemasukan] ?? false
      ..Data_Pengeluaran =
          user.getPermissionsUser[Permission.Data_Pengeluaran] ?? false
      ..Data_Operator =
          user.getPermissionsUser[Permission.Data_Operator] ?? false
      ..Riwayat_Penjualan =
          user.getPermissionsUser[Permission.Riwayat_Penjualan] ?? false
      ..Riwayat_Pembelian =
          user.getPermissionsUser[Permission.Riwayat_Pembelian] ?? false
      ..Riwayat_Pendapatan =
          user.getPermissionsUser[Permission.Riwayat_Pendapatan] ?? false
      ..Riwayat_Pengeluaran =
          user.getPermissionsUser[Permission.Riwayat_Pengeluaran] ?? false
      ..Laporan = user.getPermissionsUser[Permission.Laporan] ?? false;
  } else {
    data = await convertUser(user, ModelUserIsar.new);
  }

  await isar.writeTxn(() async {
    await isar.modelUserIsars.put(data!);
  });
}

Future<void> saveAccount_Isar(ModelUser user) async {
  final data = await isar.modelAccountIsars.where().findFirst();

  await isar.writeTxn(() async {
    if (data != null) {
      data
        ..nameUser = user.getNameUser
        ..phoneUser = user.getPhoneUser
        ..noteUser = user.getNoteUser;
      await isar.modelAccountIsars.put(data);
    } else {
      await isar.modelAccountIsars.put(
        await convertUser(user, ModelAccountIsar.new),
      );
    }
  });
}
