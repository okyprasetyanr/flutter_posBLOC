import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:image_picker/image_picker.dart';
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
  final sheetReport = excel['Laporan'];
  final sheetHistorySell = excel['Riwayat Penjualan'];
  final sheetHistoryBuy = excel['Riwayat Pembelian'];
  final sheetHistoryIncome = excel['Riwayat Pendapatan'];
  final sheetHistoryExpense = excel['Riwayat Pengeluaran'];

  //Account
  sheetItem.appendRow([
    TextCellValue(FieldDataUser.uid_owner.name),
    TextCellValue(FieldDataUser.id_user.name),
    TextCellValue(FieldDataUser.id_branch.name),
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
  sheetItem.appendRow([
    TextCellValue(uidOwner),
    TextCellValue(account.getIdUser!),
    TextCellValue(account.getIdBranchUser!),
    TextCellValue(account.getNameUser),
    TextCellValue(account.getEmailUser),
    TextCellValue(account.getPhoneUser),
    TextCellValue(account.getNoteUser!),
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
  sheetItem.appendRow([
    TextCellValue(FieldDataCompany.id_company.name),
    TextCellValue(FieldDataCompany.name_company.name),
    TextCellValue(FieldDataCompany.phone_company.name),
    TextCellValue(FieldDataCompany.header.name),
    TextCellValue(FieldDataCompany.footer.name),
    TextCellValue(FieldDataCompany.created_company.name),
  ]);

  sheetItem.appendRow([
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
    TextCellValue(FieldDataCategory.id_category.name),
    TextCellValue(FieldDataCategory.id_branch.name),
    TextCellValue(FieldDataCategory.uid_owner.name),
    TextCellValue(FieldDataCategory.name_category.name),
  ]);

  for (final item in repo.dataCategory) {
    sheetItem.appendRow([
      TextCellValue(item.getidCategory),
      TextCellValue(item.getidBranch),
      TextCellValue(uidOwner),
      TextCellValue(item.getnameCategory),
    ]);
  }

  //Customer
  for (final item in repo.dataItem) {
    sheetItem.appendRow([
      TextCellValue(item.getidItem),
      TextCellValue(item.getnameItem),
      TextCellValue(item.getidCategoryiItem),
      DoubleCellValue(item.getpriceItem),
      DoubleCellValue(item.getqtyItem),
      TextCellValue(item.getBarcode),
      BoolCellValue(item.getStatusItem),
      BoolCellValue(item.getstatusCondiment),
      TextCellValue(item.geturlImage),
      TextCellValue(item.getidBranch),
      TextCellValue(item.getDateItem.toIso8601String()),
    ]);
  }

  //Supplier
  for (final item in repo.dataItem) {
    sheetItem.appendRow([
      TextCellValue(item.getidItem),
      TextCellValue(item.getnameItem),
      TextCellValue(item.getidCategoryiItem),
      DoubleCellValue(item.getpriceItem),
      DoubleCellValue(item.getqtyItem),
      TextCellValue(item.getBarcode),
      BoolCellValue(item.getStatusItem),
      BoolCellValue(item.getstatusCondiment),
      TextCellValue(item.geturlImage),
      TextCellValue(item.getidBranch),
      TextCellValue(item.getDateItem.toIso8601String()),
    ]);
  }

  //Income
  for (final item in repo.dataItem) {
    sheetItem.appendRow([
      TextCellValue(item.getidItem),
      TextCellValue(item.getnameItem),
      TextCellValue(item.getidCategoryiItem),
      DoubleCellValue(item.getpriceItem),
      DoubleCellValue(item.getqtyItem),
      TextCellValue(item.getBarcode),
      BoolCellValue(item.getStatusItem),
      BoolCellValue(item.getstatusCondiment),
      TextCellValue(item.geturlImage),
      TextCellValue(item.getidBranch),
      TextCellValue(item.getDateItem.toIso8601String()),
    ]);
  }

  //Expense
  for (final item in repo.dataItem) {
    sheetItem.appendRow([
      TextCellValue(item.getidItem),
      TextCellValue(item.getnameItem),
      TextCellValue(item.getidCategoryiItem),
      DoubleCellValue(item.getpriceItem),
      DoubleCellValue(item.getqtyItem),
      TextCellValue(item.getBarcode),
      BoolCellValue(item.getStatusItem),
      BoolCellValue(item.getstatusCondiment),
      TextCellValue(item.geturlImage),
      TextCellValue(item.getidBranch),
      TextCellValue(item.getDateItem.toIso8601String()),
    ]);
  }

  //User
  for (final item in repo.dataItem) {
    sheetItem.appendRow([
      TextCellValue(item.getidItem),
      TextCellValue(item.getnameItem),
      TextCellValue(item.getidCategoryiItem),
      DoubleCellValue(item.getpriceItem),
      DoubleCellValue(item.getqtyItem),
      TextCellValue(item.getBarcode),
      BoolCellValue(item.getStatusItem),
      BoolCellValue(item.getstatusCondiment),
      TextCellValue(item.geturlImage),
      TextCellValue(item.getidBranch),
      TextCellValue(item.getDateItem.toIso8601String()),
    ]);
  }

  //Report
  for (final item in repo.dataItem) {
    sheetReport.appendRow([
      TextCellValue(item.getidItem),
      TextCellValue(item.getnameItem),
      TextCellValue(item.getidCategoryiItem),
      DoubleCellValue(item.getpriceItem),
      DoubleCellValue(item.getqtyItem),
      TextCellValue(item.getBarcode),
      BoolCellValue(item.getStatusItem),
      BoolCellValue(item.getstatusCondiment),
      TextCellValue(item.geturlImage),
      TextCellValue(item.getidBranch),
      TextCellValue(item.getDateItem.toIso8601String()),
    ]);
  }

  //HistorySell
  for (final item in repo.dataItem) {
    sheetHistorySell.appendRow([
      TextCellValue(item.getidItem),
      TextCellValue(item.getnameItem),
      TextCellValue(item.getidCategoryiItem),
      DoubleCellValue(item.getpriceItem),
      DoubleCellValue(item.getqtyItem),
      TextCellValue(item.getBarcode),
      BoolCellValue(item.getStatusItem),
      BoolCellValue(item.getstatusCondiment),
      TextCellValue(item.geturlImage),
      TextCellValue(item.getidBranch),
      TextCellValue(item.getDateItem.toIso8601String()),
    ]);
  }

  //HistoryBuy
  for (final item in repo.dataItem) {
    sheetHistoryBuy.appendRow([
      TextCellValue(item.getidItem),
      TextCellValue(item.getnameItem),
      TextCellValue(item.getidCategoryiItem),
      DoubleCellValue(item.getpriceItem),
      DoubleCellValue(item.getqtyItem),
      TextCellValue(item.getBarcode),
      BoolCellValue(item.getStatusItem),
      BoolCellValue(item.getstatusCondiment),
      TextCellValue(item.geturlImage),
      TextCellValue(item.getidBranch),
      TextCellValue(item.getDateItem.toIso8601String()),
    ]);
  }

  //HistoryIncome
  for (final item in repo.dataItem) {
    sheetHistoryIncome.appendRow([
      TextCellValue(item.getidItem),
      TextCellValue(item.getnameItem),
      TextCellValue(item.getidCategoryiItem),
      DoubleCellValue(item.getpriceItem),
      DoubleCellValue(item.getqtyItem),
      TextCellValue(item.getBarcode),
      BoolCellValue(item.getStatusItem),
      BoolCellValue(item.getstatusCondiment),
      TextCellValue(item.geturlImage),
      TextCellValue(item.getidBranch),
      TextCellValue(item.getDateItem.toIso8601String()),
    ]);
  }

  //HistoryExpense
  for (final item in repo.dataItem) {
    sheetHistoryExpense.appendRow([
      TextCellValue(item.getidItem),
      TextCellValue(item.getnameItem),
      TextCellValue(item.getidCategoryiItem),
      DoubleCellValue(item.getpriceItem),
      DoubleCellValue(item.getqtyItem),
      TextCellValue(item.getBarcode),
      BoolCellValue(item.getStatusItem),
      BoolCellValue(item.getstatusCondiment),
      TextCellValue(item.geturlImage),
      TextCellValue(item.getidBranch),
      TextCellValue(item.getDateItem.toIso8601String()),
    ]);
  }

  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/items_backup.xlsx');

  file.writeAsBytesSync(excel.encode()!);

  Share.shareXFiles([XFile(file.path)], text: 'Backup data item');

  return file;
}
