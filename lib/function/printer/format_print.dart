import 'dart:typed_data';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/function/printer/service_printer.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class ReceiptBuilder {
  static Future<void> print<T>({
    required PrintFormatType formatType,
    required T data,
    bool history = false,
  }) async {
    final profile = await CapabilityProfile.load();
    final width = await ServicePrinter().getPaperSize();
    final paper = width == PaperWidth.mm80 ? PaperSize.mm80 : PaperSize.mm58;

    final gen = Generator(paper, profile);
    final bytes = <int>[];

    final is80 = width == PaperWidth.mm80;
    final columnCount = is80 ? 4 : 3;
    final cols = buildColumns(columnCount);

    final colName = cols[0];
    final colQty = cols[1];
    final colPrice = is80 ? cols[2] : 0;
    final colTotal = is80 ? cols[3] : cols[2];

    switch (formatType) {
      case PrintFormatType.sell:
        data as ModelTransaction;
        bytes.addAll(
          gen.text(
            'TOKO MAKMUR',
            styles: PosStyles(
              bold: true,
              width: PosTextSize.size2,
              align: PosAlign.center,
            ),
          ),
        );

        bytes.addAll(
          gen.text(data.getinvoice, styles: PosStyles(align: PosAlign.center)),
        );
        bytes.addAll(gen.hr());

        for (final item in data.getitemsOrdered) {
          final List<PosColumn> rowColumns = [];

          // Nama
          rowColumns.add(PosColumn(text: item.getnameItem, width: colName));

          // Qty
          rowColumns.add(
            PosColumn(
              text: item.getqtyItem.toStringAsFixed(0),
              width: colQty,
              styles: const PosStyles(align: PosAlign.right),
            ),
          );

          // Harga satuan (hanya jika 4 kolom / mm80)
          if (colPrice > 0) {
            rowColumns.add(
              PosColumn(
                text: _fmt(item.getpriceItemFinal),
                width: colPrice,
                styles: const PosStyles(align: PosAlign.right),
              ),
            );
          }

          // Total
          rowColumns.add(
            PosColumn(
              text: _fmt(item.getsubTotal),
              width: colTotal,
              styles: const PosStyles(align: PosAlign.right),
            ),
          );

          bytes.addAll(gen.row(rowColumns));

          // Condiment
          for (final c in item.getCondiment) {
            bytes.addAll(
              gen.text(
                '  + ${c.getnameItem}',
                styles: const PosStyles(fontType: PosFontType.fontB),
              ),
            );
          }
        }

        bytes.addAll(gen.hr());

        bytes.addAll(
          gen.row([
            PosColumn(text: 'TOTAL', width: colName + colQty),
            PosColumn(
              text: _fmt(data.gettotal),
              width: colPrice + colTotal,
              styles: PosStyles(
                bold: true,
                align: PosAlign.right,
                width: PosTextSize.size2,
              ),
            ),
          ]),
        );

        bytes.addAll(gen.feed(2));
        bytes.addAll(gen.cut());

      case PrintFormatType.buy:
        () {};
      case PrintFormatType.income:
        () {};
      case PrintFormatType.expense:
        () {};
      case PrintFormatType.adjustment_in:
        () {};
      case PrintFormatType.adjustment_out:
        () {};
      case PrintFormatType.test_print:
        bytes.addAll(gen.reset());
        bytes.addAll(
          gen.text(
            'TEST PRINT SUKSES',
            styles: const PosStyles(
              bold: true,
              align: PosAlign.center,
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ),
          ),
        );
        bytes.addAll(
          gen.text(
            'Ukuran: ${width.name}',
            styles: const PosStyles(align: PosAlign.center),
          ),
        );
        bytes.addAll(gen.hr());
        bytes.addAll(
          gen.text(
            'Printer Connected!',
            styles: const PosStyles(align: PosAlign.center),
          ),
        );
        bytes.addAll(gen.feed(2));
        bytes.addAll(gen.cut());
    }
    ;

    await ServicePrinter().enqueuePrint(Uint8List.fromList(bytes));
  }

  static String _fmt(num v) => v
      .toStringAsFixed(0)
      .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.');

  static List<int> buildColumns(int columnCount) {
    final base = 12 ~/ columnCount;
    final remainder = 12 % columnCount;

    return List.generate(columnCount, (i) => i == 0 ? base + remainder : base);
  }
}
