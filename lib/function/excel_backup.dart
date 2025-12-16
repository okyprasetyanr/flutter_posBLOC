import 'dart:io';
import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future<File> backupItemsToExcel({required DataUserRepositoryCache repo}) async {
  final excel = Excel.createExcel();
  final uidOwner = UserSession.getUidOwner();
  final sheetAccount = excel['Akun'];
  final sheetCompany = excel['Usaha'];
  final sheetItem = excel['Item'];
  final sheetCategory = excel['Kategori'];
  final sheetCustomer = excel['Pelanggan'];
  final sheetSupplier = excel['Pemasok'];
  final sheetIncome = excel['Pendapatan'];
  final sheetExpense = excel['Pengeluaran'];
  final sheetUser = excel['Operator'];
  final sheetHistorySell = excel['Riwayat Penjualan'];
  final sheetHistoryBuy = excel['Riwayat Pembelian'];
  final sheetHistoryIncome = excel['Riwayat Pendapatan'];
  final sheetHistoryExpense = excel['Riwayat Pengeluaran'];

  //Account
  sheetAccount.appendRow([
    TextCellValue(FieldDataUser.uid_owner.name),
    TextCellValue(FieldDataUser.id_branch.name),
    TextCellValue(FieldDataUser.id_user.name),
    TextCellValue(FieldDataUser.name_user.name),
    TextCellValue(FieldDataUser.email_user.name),
    TextCellValue(FieldDataUser.phone_user.name),
    TextCellValue(FieldDataUser.note_user.name),
    TextCellValue(FieldDataUser.status_user.name),
    TextCellValue(FieldDataUser.role_user.name),
    TextCellValue(FieldDataUser.permissions_user.name),
    TextCellValue(FieldDataUser.created_user.name),
  ]);

  final account = repo.dataAccount!;
  sheetAccount.appendRow([
    TextCellValue(uidOwner),
    TextCellValue(account.getIdBranchUser ?? uidOwner),
    TextCellValue(account.getIdUser ?? ""),
    TextCellValue(account.getNameUser),
    TextCellValue(account.getEmailUser),
    TextCellValue(account.getPhoneUser),
    TextCellValue(account.getNoteUser ?? ""),
    BoolCellValue(account.getstatusUser),
    IntCellValue(account.getRoleUser),
    TextCellValue(
      account.getPermissionsUser.entries
          .map((e) => '${e.key} = ${e.value}')
          .join('\n'),
    ),

    TextCellValue(account.getCreatedUser!.toIso8601String()),
  ]);

  //Company
  final company = repo.dataCompany!;
  sheetCompany.appendRow([
    TextCellValue(FieldDataCompany.id_company.name),
    TextCellValue(FieldDataCompany.name_company.name),
    TextCellValue(FieldDataCompany.phone_company.name),
    TextCellValue(FieldDataCompany.header.name),
    TextCellValue(FieldDataCompany.footer.name),
    TextCellValue(FieldDataCompany.created_company.name),
  ]);

  sheetCompany.appendRow([
    TextCellValue(uidOwner),
    TextCellValue(company.getnameCompany),
    TextCellValue(company.getphoneCompany),
    TextCellValue(company.getHeader),
    TextCellValue(company.getFooter),
    TextCellValue(company.created.toIso8601String()),
  ]);

  //Item
  sheetItem.appendRow([
    TextCellValue(FieldDataItem.uid_owner.name),
    TextCellValue(FieldDataItem.id_branch.name),
    TextCellValue(FieldDataItem.id_item.name),
    TextCellValue(FieldDataItem.id_category.name),
    TextCellValue(FieldDataItem.barcode.name),
    TextCellValue(FieldDataItem.url_image.name),
    TextCellValue(FieldDataItem.name_item.name),
    TextCellValue(FieldDataItem.price_item.name),
    TextCellValue(FieldDataItem.qty_item.name),
    TextCellValue(FieldDataItem.status_condiment.name),
    TextCellValue(FieldDataItem.status_item.name),
    TextCellValue(FieldDataItem.date.name),
  ]);

  for (final item in repo.dataItem) {
    sheetItem.appendRow([
      TextCellValue(uidOwner),
      TextCellValue(item.getidBranch),
      TextCellValue(item.getidItem),
      TextCellValue(item.getidCategoryiItem),
      TextCellValue(item.getBarcode),
      TextCellValue(item.geturlImage),
      TextCellValue(item.getnameItem),
      DoubleCellValue(item.getpriceItem),
      DoubleCellValue(item.getqtyItem),
      BoolCellValue(item.getstatusCondiment),
      BoolCellValue(item.getStatusItem),
      TextCellValue(item.getDateItem.toIso8601String()),
    ]);
  }

  //Category
  sheetCategory.appendRow([
    TextCellValue(FieldDataCategory.uid_owner.name),
    TextCellValue(FieldDataCategory.id_branch.name),
    TextCellValue(FieldDataCategory.id_category.name),
    TextCellValue(FieldDataCategory.name_category.name),
  ]);

  for (final category in repo.dataCategory) {
    sheetCategory.appendRow([
      TextCellValue(uidOwner),
      TextCellValue(category.getidBranch),
      TextCellValue(category.getidCategory),
      TextCellValue(category.getnameCategory),
    ]);
  }

  //Customer
  sheetCustomer.appendRow([
    TextCellValue(FieldDataPartner.uid_owner.name),
    TextCellValue(FieldDataPartner.id_branch.name),
    TextCellValue(FieldDataPartner.id_partner.name),
    TextCellValue(FieldDataPartner.name_partner.name),
    TextCellValue(FieldDataPartner.email_partner.name),
    TextCellValue(FieldDataPartner.phone_partner.name),
    TextCellValue(FieldDataPartner.balance_partner.name),
    TextCellValue(FieldDataPartner.type.name),
    TextCellValue(FieldDataPartner.date.name),
  ]);

  for (final partner in repo.dataPartner.where(
    (element) => element.gettype == PartnerType.customer,
  )) {
    sheetCustomer.appendRow([
      TextCellValue(uidOwner),
      TextCellValue(partner.getidBranch),
      TextCellValue(partner.getid),
      TextCellValue(partner.getname),
      TextCellValue(partner.getemail),
      TextCellValue(partner.getphone),
      DoubleCellValue(partner.getbalance),
      TextCellValue(partner.gettype.name),
      TextCellValue(partner.getdate.toIso8601String()),
    ]);
  }

  //Supplier
  sheetSupplier.appendRow([
    TextCellValue(FieldDataPartner.uid_owner.name),
    TextCellValue(FieldDataPartner.id_branch.name),
    TextCellValue(FieldDataPartner.id_partner.name),
    TextCellValue(FieldDataPartner.name_partner.name),
    TextCellValue(FieldDataPartner.email_partner.name),
    TextCellValue(FieldDataPartner.phone_partner.name),
    TextCellValue(FieldDataPartner.balance_partner.name),
    TextCellValue(FieldDataPartner.type.name),
    TextCellValue(FieldDataPartner.date.name),
  ]);

  for (final partner in repo.dataPartner.where(
    (element) => element.gettype == PartnerType.supplier,
  )) {
    sheetSupplier.appendRow([
      TextCellValue(uidOwner),
      TextCellValue(partner.getidBranch),
      TextCellValue(partner.getid),
      TextCellValue(partner.getname),
      TextCellValue(partner.getemail),
      TextCellValue(partner.getphone),
      DoubleCellValue(partner.getbalance),
      TextCellValue(partner.gettype.name),
      TextCellValue(partner.getdate.toIso8601String()),
    ]);
  }

  //Income
  sheetIncome.appendRow([
    TextCellValue(FieldDataFinancial.uid_owner.name),
    TextCellValue(FieldDataFinancial.id_branch.name),
    TextCellValue(FieldDataFinancial.id_financial.name),
    TextCellValue(FieldDataFinancial.name_financial.name),
    TextCellValue(FieldDataFinancial.type.name),
  ]);

  for (final financial in repo.dataFinancial.where(
    (element) => element.getfinancialType == FinancialType.Income,
  )) {
    sheetIncome.appendRow([
      TextCellValue(uidOwner),
      TextCellValue(financial.getidBranch),
      TextCellValue(financial.getidFinancial),
      TextCellValue(financial.getnameFinancial),
      TextCellValue(financial.getfinancialType.name),
    ]);
  }

  //Expense
  sheetExpense.appendRow([
    TextCellValue(FieldDataFinancial.uid_owner.name),
    TextCellValue(FieldDataFinancial.id_branch.name),
    TextCellValue(FieldDataFinancial.id_financial.name),
    TextCellValue(FieldDataFinancial.name_financial.name),
    TextCellValue(FieldDataFinancial.type.name),
  ]);

  for (final financial in repo.dataFinancial.where(
    (element) => element.getfinancialType == FinancialType.Expense,
  )) {
    sheetExpense.appendRow([
      TextCellValue(uidOwner),
      TextCellValue(financial.getidBranch),
      TextCellValue(financial.getidFinancial),
      TextCellValue(financial.getnameFinancial),
      TextCellValue(financial.getfinancialType.name),
    ]);
  }

  //User
  sheetUser.appendRow([
    TextCellValue(FieldDataUser.uid_owner.name),
    TextCellValue(FieldDataUser.id_branch.name),
    TextCellValue(FieldDataUser.id_user.name),
    TextCellValue(FieldDataUser.name_user.name),
    TextCellValue(FieldDataUser.email_user.name),
    TextCellValue(FieldDataUser.phone_user.name),
    TextCellValue(FieldDataUser.note_user.name),
    TextCellValue(FieldDataUser.status_user.name),
    TextCellValue(FieldDataUser.role_user.name),
    TextCellValue(FieldDataUser.permissions_user.name),
    TextCellValue(FieldDataUser.created_user.name),
  ]);

  for (final operator in repo.dataUser) {
    sheetUser.appendRow([
      TextCellValue(uidOwner),
      TextCellValue(operator.getIdBranchUser!),
      TextCellValue(operator.getIdUser!),
      TextCellValue(operator.getNameUser),
      TextCellValue(operator.getEmailUser),
      TextCellValue(operator.getPhoneUser),
      TextCellValue(operator.getNoteUser ?? ""),
      BoolCellValue(operator.getstatusUser),
      IntCellValue(operator.getRoleUser),
      TextCellValue(
        operator.getPermissionsUser.entries
            .map((e) => '${e.key} = ${e.value}')
            .join('\n'),
      ),

      TextCellValue(operator.getCreatedUser!.toIso8601String()),
    ]);
  }

  //HistorySell
  sheetHistorySell.appendRow([
    TextCellValue(FieldDataTransaction.uid_owner.name),
    TextCellValue(FieldDataTransaction.invoice.name),
    TextCellValue(FieldDataTransaction.id_branch.name),
    TextCellValue(FieldDataTransaction.note.name),
    TextCellValue(FieldDataTransaction.date.name),
    TextCellValue(FieldDataTransaction.bill_paid.name),
    TextCellValue(FieldDataTransaction.total_item.name),
    TextCellValue(FieldDataTransaction.payment_method.name),
    TextCellValue(FieldDataTransaction.bank_name.name),
    TextCellValue(FieldDataTransaction.sub_total.name),
    TextCellValue(FieldDataTransaction.discount.name),
    TextCellValue(FieldDataTransaction.total_discount.name),
    TextCellValue(FieldDataTransaction.ppn.name),
    TextCellValue(FieldDataTransaction.total_ppn.name),
    TextCellValue(FieldDataTransaction.charge.name),
    TextCellValue(FieldDataTransaction.total_charge.name),
    TextCellValue(FieldDataTransaction.total.name),
    TextCellValue(FieldDataTransaction.status_transaction.name),
    TextCellValue(FieldDataTransaction.name_partner.name),
    TextCellValue(FieldDataTransaction.id_partner.name),
    TextCellValue(FieldDataTransaction.name_operator.name),
    TextCellValue(FieldDataTransaction.id_operator.name),
  ]);

  for (final item in repo.dataTransSell) {
    sheetHistorySell.appendRow([
      TextCellValue(uidOwner),
      TextCellValue(item.getinvoice),
      TextCellValue(item.getidBranch),
      TextCellValue(item.getnote),
      TextCellValue(item.getdate.toIso8601String()),
      DoubleCellValue(item.getbillPaid),
      IntCellValue(item.gettotalItem),
      TextCellValue(item.getpaymentMethod),
      TextCellValue(item.getbankName ?? ""),
      DoubleCellValue(item.getsubTotal),
      IntCellValue(item.getdiscount),
      DoubleCellValue(item.gettotalDiscount),
      IntCellValue(item.getppn),
      DoubleCellValue(item.gettotalPpn),
      IntCellValue(item.getcharge),
      DoubleCellValue(item.gettotalCharge),
      DoubleCellValue(item.gettotal),
      TextCellValue(item.getstatusTransaction!),
      TextCellValue(item.getnamePartner),
      TextCellValue(item.getidPartner),
      TextCellValue(item.getnameOperator),
      TextCellValue(item.getidOperator),
    ]);
  }

  //HistoryBuy
  sheetHistoryBuy.appendRow([
    TextCellValue(FieldDataTransaction.uid_owner.name),
    TextCellValue(FieldDataTransaction.invoice.name),
    TextCellValue(FieldDataTransaction.id_branch.name),
    TextCellValue(FieldDataTransaction.note.name),
    TextCellValue(FieldDataTransaction.date.name),
    TextCellValue(FieldDataTransaction.bill_paid.name),
    TextCellValue(FieldDataTransaction.total_item.name),
    TextCellValue(FieldDataTransaction.payment_method.name),
    TextCellValue(FieldDataTransaction.bank_name.name),
    TextCellValue(FieldDataTransaction.sub_total.name),
    TextCellValue(FieldDataTransaction.discount.name),
    TextCellValue(FieldDataTransaction.total_discount.name),
    TextCellValue(FieldDataTransaction.ppn.name),
    TextCellValue(FieldDataTransaction.total_ppn.name),
    TextCellValue(FieldDataTransaction.charge.name),
    TextCellValue(FieldDataTransaction.total_charge.name),
    TextCellValue(FieldDataTransaction.total.name),
    TextCellValue(FieldDataTransaction.status_transaction.name),
    TextCellValue(FieldDataTransaction.name_partner.name),
    TextCellValue(FieldDataTransaction.id_partner.name),
    TextCellValue(FieldDataTransaction.name_operator.name),
    TextCellValue(FieldDataTransaction.id_operator.name),
  ]);

  for (final item in repo.dataTransBuy) {
    sheetHistoryBuy.appendRow([
      TextCellValue(uidOwner),
      TextCellValue(item.getinvoice),
      TextCellValue(item.getidBranch),
      TextCellValue(item.getnote),
      TextCellValue(item.getdate.toIso8601String()),
      DoubleCellValue(item.getbillPaid),
      IntCellValue(item.gettotalItem),
      TextCellValue(item.getpaymentMethod),
      TextCellValue(item.getbankName ?? ""),
      DoubleCellValue(item.getsubTotal),
      IntCellValue(item.getdiscount),
      DoubleCellValue(item.gettotalDiscount),
      IntCellValue(item.getppn),
      DoubleCellValue(item.gettotalPpn),
      IntCellValue(item.getcharge),
      DoubleCellValue(item.gettotalCharge),
      DoubleCellValue(item.gettotal),
      TextCellValue(item.getstatusTransaction!),
      TextCellValue(item.getnamePartner),
      TextCellValue(item.getidPartner),
      TextCellValue(item.getnameOperator),
      TextCellValue(item.getidOperator),
    ]);
  }

  //HistoryIncome
  sheetHistoryIncome.appendRow([
    TextCellValue(FieldDataTransFinancial.uid_owner.name),
    TextCellValue(FieldDataTransFinancial.id_branch.name),
    TextCellValue(FieldDataTransFinancial.id_financial.name),
    TextCellValue(FieldDataTransFinancial.name_financial.name),
    TextCellValue(FieldDataTransFinancial.note.name),
    TextCellValue(FieldDataTransFinancial.amount.name),
    TextCellValue(FieldDataTransFinancial.status_transaction.name),
    TextCellValue(FieldDataTransFinancial.date.name),
  ]);

  for (final transIncome in repo.dataTransIncome) {
    sheetHistoryIncome.appendRow([
      TextCellValue(uidOwner),
      TextCellValue(transIncome.getidBranch),
      TextCellValue(transIncome.getidFinancial),
      TextCellValue(transIncome.getnameFinancial),
      TextCellValue(transIncome.getnote),
      DoubleCellValue(transIncome.getamount),
      TextCellValue(transIncome.getstatusTransaction!),
      TextCellValue(transIncome.getdate.toIso8601String()),
    ]);
  }

  //HistoryExpense
  sheetHistoryExpense.appendRow([
    TextCellValue(FieldDataTransFinancial.uid_owner.name),
    TextCellValue(FieldDataTransFinancial.id_branch.name),
    TextCellValue(FieldDataTransFinancial.id_financial.name),
    TextCellValue(FieldDataTransFinancial.name_financial.name),
    TextCellValue(FieldDataTransFinancial.note.name),
    TextCellValue(FieldDataTransFinancial.amount.name),
    TextCellValue(FieldDataTransFinancial.status_transaction.name),
    TextCellValue(FieldDataTransFinancial.date.name),
  ]);

  for (final transExpense in repo.dataTransExpense) {
    sheetHistoryExpense.appendRow([
      TextCellValue(uidOwner),
      TextCellValue(transExpense.getidBranch),
      TextCellValue(transExpense.getidFinancial),
      TextCellValue(transExpense.getnameFinancial),
      TextCellValue(transExpense.getnote),
      DoubleCellValue(transExpense.getamount),
      TextCellValue(transExpense.getstatusTransaction!),
      TextCellValue(transExpense.getdate.toIso8601String()),
    ]);
  }

  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/items_backup.xlsx');

  file.writeAsBytesSync(excel.encode()!);

  // Share.shareXFiles([XFile(file.path)], text: 'Backup data item');

  final Uint8List bytes = await file.readAsBytes();

  await FilePicker.platform.saveFile(
    dialogTitle: 'Simpan backup',
    fileName: 'items_backup.xlsx',
    type: FileType.custom,
    allowedExtensions: ['xlsx'],
    bytes: bytes, // ⬅️ ini kuncinya
  );
  return file;
}
