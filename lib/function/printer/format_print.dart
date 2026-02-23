import 'dart:typed_data';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/function/printer/service_printer.dart';
import 'package:flutter_pos/main.dart' as UserSession;
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_company.dart';
import 'package:flutter_pos/model_data/model_report.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/model_data/model_user.dart';

class ReceiptBuilder {
  static CapabilityProfile? _profile;

  static Future<CapabilityProfile> _getProfile() async {
    _profile ??= await CapabilityProfile.load();
    return _profile!;
  }

  static Future<void> print<T>({
    required PrintFormatType formatType,
    required T data,
    bool? history,
    bool? income,
  }) async {
    final finalHistory = history ?? false;
    final finalIncome = income ?? true;
    final profile = await _getProfile();
    final service = ServicePrinter();
    final width = await service.getPaperSize();
    final paper = width == PaperWidth.mm80 ? PaperSize.mm80 : PaperSize.mm58;
    final fontType = width == PaperWidth.mm80
        ? PosFontType.fontA
        : PosFontType.fontB;
    final gen = Generator(paper, profile);
    final List<int> bytes = [];
    final user = UserSession.repo.getAccount();
    final company = UserSession.repo.getCompany();
    ModelBranch branch = ModelBranch.empty();
    if (user.getIdBranchUser != null) {
      branch = company.getListBranch.firstWhere(
        (element) => element.getidBranch == user.getIdBranchUser,
      );
    }

    switch (formatType) {
      case PrintFormatType.transaction_sell:
        final trans = data as ModelTransaction;
        double totalQty = 0;
        addTextHeader(
          gen,
          bytes,
          branch: branch,
          company: company,
          user: user,
          invoice: trans.getinvoice,
          date: trans.getdate,
        );

        addLeftRight(
          gen,
          bytes,
          "${trans.getpaymentMethod.name}-${trans.getstatusTransaction!.name}",
          finalHistory ? "Print Ulang Nota" : "Print Nota",
          width,
          fontType: fontType,
        );

        bytes.addAll(gen.hr());
        for (final item in trans.getitemsOrdered) {
          addText(
            gen,
            bytes,
            item.getnameItem,
            styles: PosStyles(
              align: PosAlign.left,
              fontType: PosFontType.fontA,
            ),
          );
          addLeftRight(
            gen,
            bytes,
            '${formatQtyOrPrice(item.getqtyItem)} x ${formatPriceRp(item.getpriceItemFinal)} ${item.getdiscountItem != 0 ? '(${item.getdiscountItem}%)' : ''} ',
            formatPriceRp(item.getsubTotal),
            width,
            fontType: PosFontType.fontB,
          );
          totalQty += item.getqtyItem;

          for (final c in item.getCondiment) {
            addLeftRight(
              gen,
              bytes,
              '++ ${c.getnameItem} (${c.getqtyItem.toInt()})',
              "${formatPriceRp(c.getsubTotal)}",
              width,
              fontType: PosFontType.fontB,
            );
            totalQty += c.getqtyItem;
          }
          addText(
            gen,
            bytes,
            'Catatan: ${item.getNote.isEmpty ? "-" : item.getNote}',
            styles: const PosStyles(
              align: PosAlign.left,
              fontType: PosFontType.fontB,
            ),
          );
          bytes.addAll(gen.feed(1));
        }

        bytes.addAll(gen.hr());

        // 3. SUMMARY
        addText(
          gen,
          bytes,
          'Catatan: ${trans.getnote.isEmpty ? '-' : trans.getnote}',
          styles: const PosStyles(
            align: PosAlign.left,
            fontType: PosFontType.fontB,
          ),
        );
        addLeftRight(
          gen,
          bytes,
          'Total',
          '(${totalQty}) ${formatPriceRp(trans.gettotal)}',
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          'Dis.',
          '(${trans.getdiscount})% ${formatPriceRp(trans.gettotalDiscount)}',
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          'PPN.',
          '(${trans.getppn})% ${formatPriceRp(trans.gettotalPpn)}',
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          'Charge.',
          '(${trans.getcharge})% ${formatPriceRp(trans.gettotalCharge)}',
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          'Bayar',
          formatPriceRp(trans.getbillPaid),
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          'Kembali',
          formatPriceRp(trans.getbillPaid - trans.getsubTotal),
          width,
          fontType: fontType,
        );

        // 4. FOOTER
        addTextFooter(gen, bytes, company: company);

        break;

      case PrintFormatType.test_print:
        addTextHeader(
          gen,
          bytes,
          branch: branch,
          company: company,
          user: user,
          invoice: "",
          date: dateNowYMDBLOC(),
        );
        addText(
          gen,
          bytes,
          "Ringkas POS",
          styles: const PosStyles(
            bold: true,
            align: PosAlign.center,
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          ),
        );
        bytes.addAll(gen.feed(1));
        addText(gen, bytes, "Test Print Sukses!");
        addTextFooter(gen, bytes, company: company);
        break;

      case PrintFormatType.transaction_financial:
        final expense = data as ModelTransactionFinancial;
        addTextHeader(
          gen,
          bytes,
          branch: branch,
          company: company,
          user: user,
          invoice: expense.getinvoice,
          date: expense.getdate,
        );
        addLeftRight(
          gen,
          bytes,
          expense.getstatusTransaction!.name,
          finalIncome ? "Pendapatan" : "Pengeluaran",
          width,
          fontType: fontType,
        );
        bytes.addAll(gen.hr());
        addLeftRight(
          gen,
          bytes,
          expense.getnameFinancial,
          formatPriceRp(expense.getamount),
          width,
          fontType: fontType,
        );
        bytes.addAll(gen.hr());
        addTextFooter(gen, bytes, company: company);
        break;

      case PrintFormatType.transaction_buy:
        final trans = data as ModelTransaction;
        double totalQty = 0;
        addTextHeader(
          gen,
          bytes,
          branch: branch,
          company: company,
          user: user,
          invoice: trans.getinvoice,
          date: trans.getdate,
        );
        addLeftRight(
          gen,
          bytes,
          "${trans.getpaymentMethod.name}-${trans.getstatusTransaction!.name}",
          finalHistory ? "Print Ulang Nota" : "Print Nota",
          width,
          fontType: fontType,
        );
        bytes.addAll(gen.hr());
        for (final item in trans.getitemsOrdered) {
          totalQty += item.getqtyItem;
          addText(
            gen,
            bytes,
            item.getnameItem,
            styles: PosStyles(
              align: PosAlign.left,
              fontType: PosFontType.fontA,
            ),
          );
          addLeftRight(
            gen,
            bytes,
            "Harga Jual",
            formatPriceRp(item.getpriceItemFinal),
            width,
            fontType: fontType,
          );
          addLeftRight(
            gen,
            bytes,
            "Harga Beli",
            formatPriceRp(item.getpriceItemBuy),
            width,
            fontType: fontType,
          );
          addLeftRight(
            gen,
            bytes,
            "Kadaluarsa",
            formatDate(date: item.getexpiredDate!, minute: false),
            width,
            fontType: fontType,
          );
        }
        bytes.addAll(gen.hr());
        addText(
          gen,
          bytes,
          'Catatan: ${trans.getnote.isEmpty ? '-' : trans.getnote}',
          styles: const PosStyles(
            align: PosAlign.left,
            fontType: PosFontType.fontB,
          ),
        );
        addLeftRight(
          gen,
          bytes,
          'Total',
          '(${totalQty}) ${formatPriceRp(trans.gettotal)}',
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          'Dis.',
          '(${trans.getdiscount})% ${formatPriceRp(trans.gettotalDiscount)}',
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          'PPN.',
          '(${trans.getppn})% ${formatPriceRp(trans.gettotalPpn)}',
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          'Charge.',
          '(${trans.getcharge})% ${formatPriceRp(trans.gettotalCharge)}',
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          'Bayar',
          formatPriceRp(trans.getbillPaid),
          width,
          fontType: fontType,
        );
        bytes.addAll(gen.hr());
        addTextFooter(gen, bytes, company: company);
        break;

      case PrintFormatType.report:
        final report = data as ModelReport;
        addTextHeader(
          gen,
          bytes,
          branch: branch,
          company: company,
          user: user,
          invoice: "Laporan Kasir",
          date: dateNowYMDBLOC(),
        );

        bytes.addAll(gen.hr());
        addLeftRight(
          gen,
          bytes,
          "Modal Awal",
          report.getopeningBalance,
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          "Penjualan Kotor",
          report.getgrossSales,
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          "Diskon",
          report.getdiscountAmount,
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          "PPN",
          report.getppnAmount,
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          "Charge",
          report.getchargeAmount,
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          "Penjualan Bersih",
          report.getnetSales,
          width,
          fontType: fontType,
        );

        addLeftRight(
          gen,
          bytes,
          "QRIS",
          report.getsummary.getqris,
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          "Debit",
          report.getsummary.getdebit,
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          "Tunai",
          report.getsummary.getcash,
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          "Pemasukan",
          report.getincome,
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          "Pengeluaran",
          report.getexpense,
          width,
          fontType: fontType,
        );
        addLeftRight(
          gen,
          bytes,
          "Total Kas",
          report.getcashInDrawer,
          width,
          fontType: fontType,
        );

        bytes.addAll(gen.hr());
        addTextFooter(gen, bytes, company: company);
        break;

      default:
        break;
    }

    if (bytes.isNotEmpty) {
      await service.enqueuePrint(Uint8List.fromList(bytes));
    }
  }

  static void addTextFooter(
    Generator gen,
    List<int> bytes, {
    PosStyles? styles,
    PosFontType? fontType,
    required ModelCompany company,
  }) {
    bytes.addAll(gen.hr());
    if (company.getFooter.isNotEmpty) {
      bytes.addAll(
        gen.text(
          company.getFooter,
          styles: const PosStyles(align: PosAlign.center),
        ),
      );
    }
    addText(
      gen,
      bytes,
      "Terimakasih",
      styles: PosStyles(align: PosAlign.center, fontType: PosFontType.fontA),
    );
    bytes.addAll(gen.cut());
  }

  static void addTextHeader(
    Generator gen,
    List<int> bytes, {
    PosStyles? styles,
    PosFontType? fontType,
    required ModelBranch branch,
    required ModelCompany company,
    required ModelUser user,
    required String invoice,
    required DateTime date,
  }) {
    bytes.addAll(gen.reset());
    addText(
      gen,
      bytes,
      "${company.getnameCompany} ${branch.getareaBranch}",
      styles: const PosStyles(
        bold: true,
        align: PosAlign.center,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    );

    if (branch.getidBranch.isNotEmpty) {
      addText(gen, bytes, "${branch.getaddressBranch}", fontType: fontType);
      addText(gen, bytes, "${branch.getnumTelpBranch}", fontType: fontType);
    }

    if (company.getHeader.isNotEmpty) {
      addText(gen, bytes, company.getHeader, fontType: fontType);
    }

    addText(gen, bytes, invoice, fontType: fontType);
    addText(gen, bytes, "Tanggal: $date", fontType: fontType);
  }

  static void addText(
    Generator gen,
    List<int> bytes,
    String text, {
    PosStyles? styles,
    PosFontType? fontType,
  }) {
    bytes.addAll(
      gen.text(
        text,
        styles: styles ?? PosStyles(fontType: fontType, align: PosAlign.center),
      ),
    );
  }

  static int _getLineLength(PaperWidth width, PosFontType fontType) {
    if (width == PaperWidth.mm80) {
      return fontType == PosFontType.fontB ? 64 : 48;
    } else {
      return fontType == PosFontType.fontB ? 42 : 32;
    }
  }

  static void addLeftRight(
    Generator gen,
    List<int> bytes,
    String left,
    String right,
    PaperWidth width, {
    required PosFontType fontType,
  }) {
    final int lineLength = _getLineLength(width, fontType);

    final cleanLeft = left.trim();
    final cleanRight = right.trim();

    final space = lineLength - cleanLeft.length - cleanRight.length;
    final line = cleanLeft + (' ' * (space > 0 ? space : 1)) + cleanRight;

    bytes.addAll(
      gen.text(
        line,
        styles: PosStyles(fontType: fontType, align: PosAlign.center),
      ),
    );
  }
}
