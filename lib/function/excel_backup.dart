import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/model_data/model_partner.dart';

bool _isPickingFile = false;

class ExcelBackupService {
  final DataUserRepositoryCache repo;

  ExcelBackupService({required this.repo});
  Future<void> backupItemsToExcel() async {
    final excel = Excel.createExcel();
    final uidOwner = UserSession.getUidOwner();
    final sheetAccount = excel[ListDataHeaderExcel.Akun.name];
    final sheetCompany = excel[ListDataHeaderExcel.Usaha.name];
    final sheetItem = excel[ListDataHeaderExcel.Item.name];
    final sheetCategory = excel[ListDataHeaderExcel.Kategori.name];
    final sheetCustomer = excel[ListDataHeaderExcel.Pelanggan.name];
    final sheetSupplier = excel[ListDataHeaderExcel.Pemasok.name];
    final sheetIncome = excel[ListDataHeaderExcel.Pendapatan.name];
    final sheetExpense = excel[ListDataHeaderExcel.Pengeluaran.name];
    final sheetUser = excel[ListDataHeaderExcel.Operator.name];
    final sheetHistorySell =
        excel[ListDataHeaderExcel.Riwayat_Penjualan.name.replaceAll("_", " ")];
    final sheetHistorySplitPayment =
        excel[ListDataHeaderExcel.Riwayat_Pembayaran_Split.name.replaceAll(
          "_",
          " ",
        )];
    final sheetHistorySellItem =
        excel[ListDataHeaderExcel.Riwayat_Penjualan_Item.name.replaceAll(
          "_",
          " ",
        )];
    final sheetHistorySellCondiment =
        excel[ListDataHeaderExcel.Riwayat_Penjualan_Tambahan.name.replaceAll(
          "_",
          " ",
        )];
    final sheetHistoryBuy =
        excel[ListDataHeaderExcel.Riwayat_Pembelian.name.replaceAll("_", " ")];
    final sheetHistoryBuyItem =
        excel[ListDataHeaderExcel.Riwayat_Pembelian_Item.name.replaceAll(
          "_",
          " ",
        )];
    final sheetHistoryIncome =
        excel[ListDataHeaderExcel.Riwayat_Pendapatan.name.replaceAll("_", " ")];
    final sheetHistoryExpense =
        excel[ListDataHeaderExcel.Riwayat_Pengeluaran.name.replaceAll(
          "_",
          " ",
        )];

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
      TextCellValue(account.getRoleUser.toString()),
      TextCellValue(
        account.getPermissionsUser.entries
            .map((e) => '${e.key.name} = ${e.value}')
            .join('\n'),
      ),

      TextCellValue(formatDate(date: account.getCreatedUser!, minute: false)),
    ]);
    sheetWidthStyle(FieldDataUser.values, sheetAccount, wrapColumns: {9});

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
      TextCellValue(formatDate(date: company.created, minute: false)),
    ]);
    sheetWidthStyle(FieldDataCompany.values, sheetCompany);

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
        TextCellValue(formatDate(date: item.getDateItem, minute: false)),
      ]);
    }
    sheetWidthStyle(FieldDataItem.values, sheetItem);

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
    sheetWidthStyle(FieldDataCategory.values, sheetCategory);

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
        TextCellValue(formatDate(date: partner.getdate, minute: false)),
      ]);
    }
    sheetWidthStyle(FieldDataPartner.values, sheetCustomer);

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
        TextCellValue(formatDate(date: partner.getdate, minute: false)),
      ]);
    }
    sheetWidthStyle(FieldDataPartner.values, sheetSupplier);

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
    sheetWidthStyle(FieldDataFinancial.values, sheetIncome);

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
    sheetWidthStyle(FieldDataFinancial.values, sheetExpense);

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

        TextCellValue(
          formatDate(date: operator.getCreatedUser!, minute: false),
        ),
      ]);
    }
    sheetWidthStyle(FieldDataUser.values, sheetUser);

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
        TextCellValue(formatDate(date: item.getdate, minute: false)),
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
    sheetWidthStyle(FieldDataTransaction.values, sheetHistorySell);

    //SplitPayment
    sheetHistorySplitPayment.appendRow([
      TextCellValue(FieldDataSplit.invoice.name),
      TextCellValue(FieldDataSplit.payment_name.name),
      TextCellValue(FieldDataSplit.payment_debit_name.name),
      TextCellValue(FieldDataSplit.payment_total.name),
    ]);

    for (final trans in repo.dataTransSell) {
      for (final split in trans.getdataSplit) {
        sheetHistorySplitPayment.appendRow([
          TextCellValue(split.paymentInvoice!),
          TextCellValue(split.getpaymentName),
          TextCellValue(split.getpaymentDebitName!),
          DoubleCellValue(split.getpaymentTotal),
        ]);
      }
    }
    sheetWidthStyle(FieldDataTransaction.values, sheetHistorySell);

    //HistorySellItem
    sheetHistorySellItem.appendRow([
      TextCellValue(FieldDataItemOrdered.uid_owner.name),
      TextCellValue(FieldDataItemOrdered.id_branch.name),
      TextCellValue(FieldDataItemOrdered.id_condiment.name),
      TextCellValue(FieldDataItemOrdered.id_category_item.name),
      TextCellValue(FieldDataItemOrdered.id_item.name),
      TextCellValue(FieldDataItemOrdered.name_item.name),
      TextCellValue(FieldDataItemOrdered.qty_item.name),
      TextCellValue(FieldDataItemOrdered.price_item.name),
      TextCellValue(FieldDataItemOrdered.discount_item.name),
      TextCellValue(FieldDataItemOrdered.sub_total.name),
      TextCellValue(FieldDataItemOrdered.note.name),
    ]);

    for (final transSellItem in repo.dataTransSell) {
      for (final item in transSellItem.getitemsOrdered) {
        sheetHistorySellItem.appendRow([
          TextCellValue(uidOwner),
          TextCellValue(item.getidBranch),
          TextCellValue(item.getidCategoryItem),
          TextCellValue(item.getidItem),
          TextCellValue(item.getnameItem),
          DoubleCellValue(item.getqtyItem),
          DoubleCellValue(item.getpriceItem),
          IntCellValue(item.getdiscountItem),
          DoubleCellValue(item.getsubTotal),
          TextCellValue(item.getNote),
        ]);
      }
    }
    sheetWidthStyle(FieldDataItemOrdered.values, sheetHistorySellItem);

    //HistorySellCondiment
    sheetHistorySellCondiment.appendRow([
      TextCellValue(FieldDataItemOrdered.uid_owner.name),
      TextCellValue(FieldDataItemOrdered.id_branch.name),
      TextCellValue(FieldDataItemOrdered.id_condiment.name),
      TextCellValue(FieldDataItemOrdered.id_category_item.name),
      TextCellValue(FieldDataItemOrdered.id_item.name),
      TextCellValue(FieldDataItemOrdered.name_item.name),
      TextCellValue(FieldDataItemOrdered.qty_item.name),
      TextCellValue(FieldDataItemOrdered.price_item.name),
      TextCellValue(FieldDataItemOrdered.discount_item.name),
      TextCellValue(FieldDataItemOrdered.sub_total.name),
      TextCellValue(FieldDataItemOrdered.note.name),
    ]);

    repo.dataTransSell
        .expand((element) => element.getitemsOrdered)
        .expand((element) => element.getCondiment)
        .forEach((element) {
          sheetHistorySellCondiment.appendRow([
            TextCellValue(uidOwner),
            TextCellValue(element.getidBranch),
            TextCellValue(element.getidCategoryItem),
            TextCellValue(element.getidItem),
            TextCellValue(element.getnameItem),
            DoubleCellValue(element.getqtyItem),
            DoubleCellValue(element.getpriceItem),
            IntCellValue(element.getdiscountItem),
            DoubleCellValue(element.getsubTotal),
            TextCellValue(element.getNote),
          ]);
        });
    sheetWidthStyle(FieldDataItemOrdered.values, sheetHistorySellCondiment);

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
        TextCellValue(formatDate(date: item.getdate, minute: false)),
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
    sheetWidthStyle(FieldDataTransaction.values, sheetHistoryBuy);

    //HistoryBuyItem
    sheetHistoryBuyItem.appendRow([
      TextCellValue(FieldDataItemOrdered.uid_owner.name),
      TextCellValue(FieldDataItemOrdered.id_branch.name),
      TextCellValue(FieldDataItemOrdered.id_condiment.name),
      TextCellValue(FieldDataItemOrdered.id_category_item.name),
      TextCellValue(FieldDataItemOrdered.id_item.name),
      TextCellValue(FieldDataItemOrdered.name_item.name),
      TextCellValue(FieldDataItemOrdered.qty_item.name),
      TextCellValue(FieldDataItemOrdered.price_item.name),
      TextCellValue(FieldDataItemOrdered.discount_item.name),
      TextCellValue(FieldDataItemOrdered.sub_total.name),
      TextCellValue(FieldDataItemOrdered.note.name),
    ]);

    for (final transBuyItem in repo.dataTransBuy) {
      for (final item in transBuyItem.getitemsOrdered) {
        sheetHistoryBuyItem.appendRow([
          TextCellValue(uidOwner),
          TextCellValue(item.getidBranch),
          TextCellValue(item.getidCategoryItem),
          TextCellValue(item.getidItem),
          TextCellValue(item.getnameItem),
          DoubleCellValue(item.getqtyItem),
          DoubleCellValue(item.getpriceItem),
          IntCellValue(item.getdiscountItem),
          DoubleCellValue(item.getsubTotal),
          TextCellValue(item.getNote),
        ]);
      }
    }
    sheetWidthStyle(FieldDataItemOrdered.values, sheetHistoryBuyItem);

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
        TextCellValue(formatDate(date: transIncome.getdate, minute: false)),
      ]);
    }
    sheetWidthStyle(FieldDataTransFinancial.values, sheetHistoryIncome);

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
        TextCellValue(formatDate(date: transExpense.getdate, minute: false)),
      ]);
    }
    sheetWidthStyle(FieldDataTransFinancial.values, sheetHistoryExpense);

    if (_isPickingFile) return;
    _isPickingFile = true;

    try {
      excel.delete('Sheet1');

      final bytesExcel = excel.encode();
      if (bytesExcel == null) {
        throw Exception('Gagal generate excel');
      }

      await FilePicker.platform.saveFile(
        dialogTitle: 'Simpan backup',
        fileName:
            'backup_RingkasPOS_${formatDate(date: DateTime.now(), minute: false)}.xlsx',
        bytes: Uint8List.fromList(bytesExcel),
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      );
    } finally {
      _isPickingFile = false;
    }
  }

  Sheet sheetWidthStyle<T extends Enum>(
    List<T> fields,
    Sheet sheet, {
    int headerRow = 0,
    Set<int>? wrapColumns,
  }) {
    for (var i = 0; i < fields.length; i++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: headerRow))
          .cellStyle = CellStyle(
        bold: true,
        fontColorHex: ExcelColor.white,
        horizontalAlign: HorizontalAlign.Center,
        verticalAlign: VerticalAlign.Center,
        backgroundColorHex: ExcelColor.red400,
        textWrapping: TextWrapping.WrapText,
      );

      sheet.setColumnWidth(i, 25);
    }

    for (int row = headerRow + 1; row < sheet.maxRows; row++) {
      for (int col = 0; col < fields.length; col++) {
        sheet
            .cell(CellIndex.indexByColumnRow(columnIndex: col, rowIndex: row))
            .cellStyle = CellStyle(
          verticalAlign: VerticalAlign.Center,
          horizontalAlign: wrapColumns != null
              ? wrapColumns.contains(col)
                    ? HorizontalAlign.Left
                    : HorizontalAlign.Center
              : HorizontalAlign.Center,
          textWrapping: (wrapColumns?.contains(col) ?? false)
              ? TextWrapping.WrapText
              : TextWrapping.Clip,
        );
      }
    }

    return sheet;
  }
}
