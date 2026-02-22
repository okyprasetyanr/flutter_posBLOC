import 'dart:typed_data';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/function/printer/service_printer.dart';
import 'package:flutter_pos/main.dart' as UserSession;
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class ReceiptBuilder {
  static CapabilityProfile? _profile;

  static Future<CapabilityProfile> _getProfile() async {
    _profile ??= await CapabilityProfile.load();
    return _profile!;
  }

  static Future<void> print<T>({
    required PrintFormatType formatType,
    required T data,
    bool history = false,
  }) async {
    final profile = await _getProfile();
    final service = ServicePrinter();
    final width = await service.getPaperSize();
    final paper = width == PaperWidth.mm80 ? PaperSize.mm80 : PaperSize.mm58;

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
      case PrintFormatType.sell:
        final trans = data as ModelTransaction;
        double totalQty = 0;
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
          addText(gen, bytes, "${branch.getaddressBranch}");
          addText(gen, bytes, "${branch.getnumTelpBranch}");
        }

        if (company.getHeader.isNotEmpty) {
          addText(gen, bytes, company.getHeader);
        }

        addText(
          gen,
          bytes,
          trans.getinvoice,
          styles: PosStyles(
            fontType: PosFontType.fontA,
            align: PosAlign.center,
          ),
        );
        addText(gen, bytes, "Tanggal: ${trans.getdate}");
        addLeftRight(
          gen,
          bytes,
          trans.getpaymentMethod.name,
          history ? "Print Ulang Nota" : "Print Nota",
          width,
          fontType: PosFontType.fontA,
        );

        bytes.addAll(gen.hr());
        for (final item in trans.getitemsOrdered) {
          addText(
            gen,
            bytes,
            item.getnameItem,
            styles: const PosStyles(
              align: PosAlign.left,
              fontType: PosFontType.fontA,
              width: PosTextSize.size1,
              height: PosTextSize.size1,
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
            'Catatan: ${item.getNote}',
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
        );
        addLeftRight(
          gen,
          bytes,
          'Dis.',
          '(${trans.getdiscount})% ${formatPriceRp(trans.gettotalDiscount)}',
          width,
        );
        addLeftRight(
          gen,
          bytes,
          'PPN.',
          '(${trans.getppn})% ${formatPriceRp(trans.gettotalPpn)}',
          width,
        );
        addLeftRight(
          gen,
          bytes,
          'Charge.',
          '(${trans.getcharge})% ${formatPriceRp(trans.gettotalCharge)}',
          width,
        );
        addLeftRight(
          gen,
          bytes,
          'Bayar',
          formatPriceRp(trans.getbillPaid),
          width,
        );
        addLeftRight(
          gen,
          bytes,
          'Kembali',
          formatPriceRp(trans.getbillPaid - trans.getsubTotal),
          width,
        );

        // 4. FOOTER
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
          styles: PosStyles(
            align: PosAlign.center,
            fontType: PosFontType.fontA,
          ),
        );

        bytes.addAll(gen.cut());
        break;

      case PrintFormatType.test_print:
        bytes.addAll(gen.reset());
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
        addText(
          gen,
          bytes,
          "Test Print Sukses!",
          styles: PosStyles(
            align: PosAlign.center,
            bold: true,
            fontType: PosFontType.fontA,
          ),
        );
        bytes.addAll(gen.cut());
        break;

      default:
        break;
    }

    if (bytes.isNotEmpty) {
      await service.enqueuePrint(Uint8List.fromList(bytes));
    }
  }

  static void addText(
    Generator gen,
    List<int> bytes,
    String text, {
    PosStyles? styles,
  }) {
    bytes.addAll(
      gen.text(
        text,
        styles:
            styles ??
            const PosStyles(
              fontType: PosFontType.fontB,
              align: PosAlign.center,
            ),
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
    PosFontType fontType = PosFontType.fontB,
  }) {
    final int lineLength = _getLineLength(width, fontType);

    final cleanLeft = left.trim();
    final cleanRight = right.trim();

    final space = lineLength - cleanLeft.length - cleanRight.length;
    final line = cleanLeft + (' ' * (space > 0 ? space : 1)) + cleanRight;

    bytes.addAll(
      gen.text(
        line,
        styles: PosStyles(fontType: fontType, align: PosAlign.left),
      ),
    );
  }
}
