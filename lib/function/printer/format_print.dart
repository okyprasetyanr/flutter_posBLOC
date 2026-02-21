import 'dart:typed_data';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/function/printer/service_printer.dart';
import 'package:flutter_pos/main.dart' as UserSession;
import 'package:flutter_pos/model_data/model_transaction.dart';

class ReceiptBuilder {
  static Future<void> print<T>({
    required PrintFormatType formatType,
    required T data,
    bool history = false,
  }) async {
    final profile = await CapabilityProfile.load();
    final service = ServicePrinter();
    final width = await service.getPaperSize();
    final paper = width == PaperWidth.mm80 ? PaperSize.mm80 : PaperSize.mm58;

    final gen = Generator(paper, profile);
    final List<int> bytes = [];

    final company = UserSession.repo.getCompany();

    switch (formatType) {
      case PrintFormatType.sell:
        final trans = data as ModelTransaction;

        // 1. HEADER
        bytes.addAll(gen.reset());
        bytes.addAll(
          gen.text(
            company.getnameCompany,
            styles: const PosStyles(
              bold: true,
              align: PosAlign.center,
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ),
          ),
        );

        if (company.getHeader.isNotEmpty) {
          bytes.addAll(
            gen.text(
              company.getHeader,
              styles: const PosStyles(align: PosAlign.center),
            ),
          );
        }

        bytes.addAll(
          gen.text(
            'No: ${trans.getinvoice}',
            styles: const PosStyles(align: PosAlign.center),
          ),
        );
        bytes.addAll(
          gen.text(
            'Tgl: ${trans.getdate}',
            styles: const PosStyles(align: PosAlign.center),
          ),
        );
        bytes.addAll(gen.hr());

        // 2. ITEMS
        for (final item in trans.getitemsOrdered) {
          // Taktik MM58: Nama item di baris sendiri jika panjang, atau pakai kolom dinamis
          if (width == PaperWidth.mm58) {
            // Baris 1: Nama Item
            bytes.addAll(
              gen.text(item.getnameItem, styles: const PosStyles(bold: true)),
            );
            // Baris 2: Qty x Harga ....... Total
            bytes.addAll(
              gen.row([
                PosColumn(
                  text:
                      '${item.getqtyItem.toInt()} x ${_fmt(item.getpriceItemFinal)}',
                  width: 7,
                ),
                PosColumn(
                  text: _fmt(item.getsubTotal),
                  width: 5,
                  styles: const PosStyles(align: PosAlign.right),
                ),
              ]),
            );
          } else {
            // Mode MM80 (Lebar): Bisa 4 kolom sejajar
            bytes.addAll(
              gen.row([
                PosColumn(text: item.getnameItem, width: 5),
                PosColumn(
                  text: item.getqtyItem.toInt().toString(),
                  width: 1,
                  styles: const PosStyles(align: PosAlign.center),
                ),
                PosColumn(
                  text: _fmt(item.getpriceItemFinal),
                  width: 3,
                  styles: const PosStyles(align: PosAlign.right),
                ),
                PosColumn(
                  text: _fmt(item.getsubTotal),
                  width: 3,
                  styles: const PosStyles(align: PosAlign.right),
                ),
              ]),
            );
          }

          // Condiments (Tambahan)
          for (final c in item.getCondiment) {
            bytes.addAll(
              gen.text(
                '  + ${c.getnameItem} (${_fmt(c.getpriceItemFinal)})',
                styles: const PosStyles(fontType: PosFontType.fontB),
              ),
            );
          }
        }

        // 3. SUMMARY
        bytes.addAll(gen.hr());
        bytes.addAll(
          gen.row([
            PosColumn(
              text: 'TOTAL',
              width: 6,
              styles: const PosStyles(bold: true),
            ),
            PosColumn(
              text: 'Rp${_fmt(trans.gettotal)}',
              width: 6,
              styles: const PosStyles(align: PosAlign.right, bold: true),
            ),
          ]),
        );

        // Info Pembayaran (Opsional tapi berguna)
        if (trans.getbillPaid > 0) {
          bytes.addAll(
            gen.row([
              PosColumn(text: 'BAYAR', width: 6),
              PosColumn(
                text: _fmt(trans.getbillPaid),
                width: 6,
                styles: const PosStyles(align: PosAlign.right),
              ),
            ]),
          );
          bytes.addAll(
            gen.row([
              PosColumn(text: 'KEMBALI', width: 6),
              PosColumn(
                text: _fmt(trans.getbillPaid - trans.getsubTotal),
                width: 6,
                styles: const PosStyles(align: PosAlign.right),
              ),
            ]),
          );
        }

        // 4. FOOTER
        bytes.addAll(gen.hr());
        if (company.getFooter.isNotEmpty) {
          bytes.addAll(
            gen.text(
              company.getFooter,
              styles: const PosStyles(
                align: PosAlign.center,
                fontType: PosFontType.fontB,
              ),
            ),
          );
        }
        bytes.addAll(
          gen.text(
            'Terima Kasih',
            styles: const PosStyles(align: PosAlign.center),
          ),
        );

        bytes.addAll(gen.feed(3));
        bytes.addAll(gen.cut());
        break;

      case PrintFormatType.test_print:
        // ... kode test print kamu sudah oke ...
        break;

      default:
        // Untuk format lain (income/expense) bisa menyusul
        break;
    }

    if (bytes.isNotEmpty) {
      await service.enqueuePrint(Uint8List.fromList(bytes));
    }
  }

  static String _fmt(num v) => v
      .toStringAsFixed(0)
      .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.');
}
