import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:image/image.dart' as img;

class SimplePrinter {
  final printerManager = PrinterBluetoothManager();

  Future<void> printBasic({required PrinterBluetooth device}) async {
    // pilih printer
    printerManager.selectPrinter(device);

    // capability
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);

    List<int> bytes = [];

    // -------- LOGO (opsional) ----------
    try {
      final ByteData data = await rootBundle.load("assets/logo_gray.png");
      final Uint8List imgBytes = data.buffer.asUint8List();

      final img.Image? logo = img.decodeImage(imgBytes);
      if (logo != null) {
        bytes += generator.imageRaster(
          logo,
          align: PosAlign.center,
          imageFn: PosImageFn.dithering,
        );
      }

      bytes += generator.feed(1);
    } catch (_) {
      // kalau tidak ada logo, aman lanjut
    }

    // -------- TEKS SEDERHANA ----------
    bytes += generator.text(
      "TOKO MANDIRI",
      styles: PosStyles(bold: true, align: PosAlign.center),
    );

    bytes += generator.text(
      "Jl. Kemerdekaan No.123",
      styles: PosStyles(align: PosAlign.center),
    );

    bytes += generator.hr();

    // -------- ITEM SEDERHANA ----------
    bytes += generator.row([
      PosColumn(text: "Nasi Goreng", width: 8),
      PosColumn(
        text: "15000",
        width: 4,
        styles: PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.row([
      PosColumn(text: "Teh Manis x2", width: 8),
      PosColumn(
        text: "10000",
        width: 4,
        styles: PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.hr();

    // -------- TOTAL ----------
    bytes += generator.row([
      PosColumn(text: "TOTAL", width: 6, styles: PosStyles(bold: true)),
      PosColumn(
        text: "25000",
        width: 6,
        styles: PosStyles(align: PosAlign.right, bold: true),
      ),
    ]);

    bytes += generator.hr();

    // -------- FOOTER ----------
    bytes += generator.text(
      "Terima kasih!",
      styles: PosStyles(align: PosAlign.center),
    );

    bytes += generator.feed(2);
    bytes += generator.cut();

    // -------- KIRIM KE PRINTER ----------
    await printerManager.printTicket(bytes);
  }
}
