import 'dart:async';
import 'dart:typed_data';
import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrinterService {
  final Set<String> _seenMac = {};
  final List<BluetoothDevice> _devices = [];

  static const _savedMacKey = 'saved_printer_mac';

  bool _printing = false;
  final List<Uint8List> _printQueue = [];

  /// ================= FILTER PRINTER =================
  bool _isPrinter(BluetoothDevice device) {
    final name = device.name.toLowerCase();
    return name.contains('printer') ||
        name.contains('pos') ||
        name.contains('thermal') ||
        name.contains('xp') ||
        name.contains('epson') ||
        name.contains('zjiang') ||
        name.contains('gp') ||
        name.contains('print');
  }

  /// ================= SCAN RESULT =================
  Stream<List<BluetoothDevice>> get uniqueScanResults =>
      BluetoothPrintPlus.scanResults.map((devices) {
        for (final device in devices) {
          final mac = device.address;
          if (!_isPrinter(device)) continue;

          if (_seenMac.add(mac)) {
            _devices.add(device);
          }
        }
        return List.unmodifiable(_devices);
      });

  /// ================= SCAN =================
  Future<void> startScan() async {
    _seenMac.clear();
    _devices.clear();

    await BluetoothPrintPlus.stopScan();
    await BluetoothPrintPlus.startScan(timeout: const Duration(seconds: 4));
  }

  Future<void> stopScan() async {
    await BluetoothPrintPlus.stopScan();
  }

  Stream<bool> get isScanning => BluetoothPrintPlus.isScanning;
  Stream<ConnectState> get connectState => BluetoothPrintPlus.connectState;

  /// ================= CONNECT =================
  Future<void> connect(BluetoothDevice device) async {
    await BluetoothPrintPlus.connect(device);
    await _saveMac(device.address);
    await _ensureConnected();
  }

  Future<bool> autoConnectSavedPrinter() async {
    final mac = await getSavedMac();
    if (mac == null) return false;

    final device = BluetoothDevice('Saved Printer', mac);

    await BluetoothPrintPlus.connect(device);
    await _ensureConnected();
    return true;
  }

  Future<void> disconnect() async {
    await BluetoothPrintPlus.disconnect();
  }

  /// ================= PRINT PUBLIC =================
  Future<void> printTest() async {
    final profile = await CapabilityProfile.load();
    final gen = Generator(PaperSize.mm58, profile);

    final bytes = <int>[];
    bytes.addAll(
      gen.text(
        'TEST PRINT',
        styles: PosStyles(
          bold: true,
          align: PosAlign.center,
          width: PosTextSize.size2,
          height: PosTextSize.size2,
        ),
      ),
    );
    bytes.addAll(gen.text('Printer OK!'));
    bytes.addAll(gen.cut());

    await _enqueuePrint(Uint8List.fromList(bytes));
  }

  /// ================= PRINT CORE =================
  Future<void> _enqueuePrint(Uint8List bytes) async {
    _printQueue.add(bytes);
    if (_printing) return;

    _printing = true;

    while (_printQueue.isNotEmpty) {
      final job = _printQueue.removeAt(0);
      await _safeWrite(job);
    }

    _printing = false;
  }

  Future<void> _safeWrite(Uint8List bytes) async {
    try {
      await _ensureConnected();
      await BluetoothPrintPlus.write(bytes);
    } catch (_) {
      await Future.delayed(const Duration(milliseconds: 500));
      await _ensureConnected();
      await BluetoothPrintPlus.write(bytes);
    }
  }

  /// ================= CONNECTION GUARD =================
  Future<void> _ensureConnected() async {
    final current = await BluetoothPrintPlus.connectState.first;

    if (current == ConnectState.connected) return;

    // auto reconnect kalau putus
    if (current == ConnectState.disconnected) {
      final mac = await getSavedMac();

      final device = BluetoothDevice('Saved Printer', mac!);

      await BluetoothPrintPlus.connect(device);
    }

    await BluetoothPrintPlus.connectState
        .firstWhere((s) => s == ConnectState.connected)
        .timeout(const Duration(seconds: 5));
  }

  /// ================= STORAGE =================
  Future<void> _saveMac(String mac) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_savedMacKey, mac);
  }

  Future<String?> getSavedMac() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_savedMacKey);
  }

  Future<void> clearSavedPrinter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_savedMacKey);
  }
}
