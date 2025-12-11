import 'dart:typed_data';
import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';

class PrinterService {
  Future<void> startScan() async {
    await BluetoothPrintPlus.startScan(timeout: const Duration(seconds: 4));
  }

  Stream<List<BluetoothDevice>> get scanResults =>
      BluetoothPrintPlus.scanResults;
  Stream<bool> get isScanning => BluetoothPrintPlus.isScanning;
  Stream<ConnectState> get connectState => BluetoothPrintPlus.connectState;

  Future<void> connect(BluetoothDevice device) async {
    await BluetoothPrintPlus.connect(device);
  }

  Future<void> disconnect() async {
    await BluetoothPrintPlus.disconnect();
  }

  Future<void> printTest() async {
    final profile = await CapabilityProfile.load();
    final gen = Generator(PaperSize.mm58, profile);

    List<int> bytes = [];
    bytes += gen.text(
      'TEST PRINT',
      styles: PosStyles(
        bold: true,
        align: PosAlign.center,
        width: PosTextSize.size2,
        height: PosTextSize.size2,
      ),
    );
    bytes += gen.text('Printer OK!');
    bytes += gen.cut();

    await BluetoothPrintPlus.write(Uint8List.fromList(bytes));
  }
}
