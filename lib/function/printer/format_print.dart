import 'dart:typed_data';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/function/printer/service_printer.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class ReceiptBuilder {
  static Future<Uint8List> print<T>({
    required PrintFormatType formatType,
    required T data,
    bool history = false,
  }) async {
    final profile = await CapabilityProfile.load();
    final width = await ServicePrinter().getPaperSize();
    final paper = width == PaperWidth.mm80 ? PaperSize.mm80 : PaperSize.mm58;

    final gen = Generator(paper, profile);
    final bytes = <int>[];

    final colName = width == PaperWidth.mm80 ? 6 : 8;
    final colQty = 2;
    final colPrice = width == PaperWidth.mm80 ? 2 : 2;
    final colTotal = width == PaperWidth.mm80 ? 2 : 2;

    switch (formatType) {
      case PrintFormatType.sell:
        () {
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
            gen.text(
              data.getinvoice,
              styles: PosStyles(align: PosAlign.center),
            ),
          );
          bytes.addAll(gen.hr());

          for (final item in data.getitemsOrdered) {
            bytes.addAll(
              gen.row([
                PosColumn(text: item.getnameItem, width: colName),
                PosColumn(
                  text: item.getqtyItem.toStringAsFixed(0),
                  width: colQty,
                  styles: PosStyles(align: PosAlign.right),
                ),
                PosColumn(
                  text: _fmt(item.getpriceItemFinal),
                  width: colPrice,
                  styles: PosStyles(align: PosAlign.right),
                ),
                PosColumn(
                  text: _fmt(item.getsubTotal),
                  width: colTotal,
                  styles: PosStyles(align: PosAlign.right),
                ),
              ]),
            );

            for (final c in item.getCondiment) {
              bytes.addAll(
                gen.text(
                  '  + ${c.getnameItem}',
                  styles: PosStyles(fontType: PosFontType.fontB),
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
        };
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
    }
    ;

    return Uint8List.fromList(bytes);
  }

  static String _fmt(num v) => v
      .toStringAsFixed(0)
      .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.');
}
