// service_printer.dart
import 'dart:async';
import 'dart:typed_data';
import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicePrinter {
  static final ServicePrinter _instance = ServicePrinter._internal();
  factory ServicePrinter() => _instance;
  // Di dalam class ServicePrinter
  ConnectState _currentStatus = ConnectState.disconnected;

  ServicePrinter._internal() {
    // Pantau terus status koneksi agar kita selalu tahu kondisinya
    BluetoothPrintPlus.connectState.listen((state) {
      _currentStatus = state;
    });
  }

  final Set<String> _seenMac = {};
  final List<BluetoothDevice> _devices = [];

  static const _savedMacKey = 'saved_printer_mac';
  static const _paperWidthKey = 'paper_width';

  bool _printing = false;
  final List<Uint8List> _printQueue = [];

  // Stream Controllers untuk broadcast state ke BLoC jika perlu
  // (Tapi kita akan pakai langsung stream dari plugin untuk efisiensi)

  /// ================= FILTER =================
  bool _isPrinter(BluetoothDevice device) {
    final name = (device.name).toLowerCase();
    if (name.isEmpty) return false;
    return name.contains('printer') ||
        name.contains('pos') ||
        name.contains('thermal') ||
        name.contains('xp') ||
        name.contains('rpp') ||
        name.contains('epson') ||
        name.contains('zjiang') ||
        name.contains('gp') ||
        name.contains('print') ||
        name.contains('mpt'); // Tambahan umum
  }

  /// ================= STREAMS =================
  // Stream status koneksi
  Stream<ConnectState> get connectState => BluetoothPrintPlus.connectState;

  // Stream status scanning
  Stream<bool> get isScanning => BluetoothPrintPlus.isScanning;

  // Stream hasil scan yang sudah difilter
  Stream<List<BluetoothDevice>> get scanResults =>
      BluetoothPrintPlus.scanResults.map((devices) {
        _devices.clear(); // Reset list setiap kali ada update dari plugin
        _seenMac.clear();

        for (final device in devices) {
          // Filter nama dan duplikasi
          if (_isPrinter(device) && _seenMac.add(device.address)) {
            _devices.add(device);
          }
        }
        return List.unmodifiable(_devices);
      });

  /// ================= ACTIONS =================
  Future<void> startScan() async {
    _devices.clear();
    _seenMac.clear();
    await BluetoothPrintPlus.stopScan();
    await BluetoothPrintPlus.startScan(timeout: const Duration(seconds: 10));
  }

  Future<void> stopScan() async {
    await BluetoothPrintPlus.stopScan();
  }

  Future<void> connect(BluetoothDevice device) async {
    await BluetoothPrintPlus.connect(device);
    // Simpan MAC address untuk auto-connect nanti
    await _saveMac(device.address);
  }

  Future<void> disconnect() async {
    await BluetoothPrintPlus.disconnect();
  }

  /// Cek apakah ada printer tersimpan dan coba konek
  Future<bool> initSavedPrinter() async {
    final mac = await getSavedMac();
    if (mac != null) {
      // Mencoba koneksi dummy object
      final device = BluetoothDevice('Saved Printer', mac);
      await BluetoothPrintPlus.connect(device);
      return true;
    }
    return false;
  }

  /// ================= PRINTING =================
  Future<void> printTest(PaperWidth paperSize) async {
    final profile = await CapabilityProfile.load();
    // Sesuaikan profile kertas
    final gen = Generator(
      paperSize == PaperWidth.mm80 ? PaperSize.mm80 : PaperSize.mm58,
      profile,
    );

    final bytes = <int>[];
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
        'Ukuran: ${paperSize.name}',
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

    await enqueuePrint(Uint8List.fromList(bytes));
  }

  Future<void> enqueuePrint(Uint8List bytes) async {
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
      // Gunakan variabel lokal status yang kita pantau tadi
      if (_currentStatus != ConnectState.connected) {
        final mac = await getSavedMac();
        if (mac != null) {
          await BluetoothPrintPlus.connect(BluetoothDevice('Reconnect', mac));
          // Beri jeda 1-2 detik agar socket benar-benar "siap" di sisi Android
          await Future.delayed(const Duration(seconds: 2));
        } else {
          return; // Tidak ada printer, batalkan print
        }
      }

      // Cek lagi status setelah reconnect
      if (_currentStatus == ConnectState.connected) {
        await BluetoothPrintPlus.write(bytes);
      }
    } catch (e) {
      print("Error printing: $e");
    }
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

  Future<void> savePaperSize(PaperWidth width) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_paperWidthKey, width.name);
  }

  Future<PaperWidth> getPaperSize() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_paperWidthKey);
    return PaperWidth.values.firstWhere(
      (e) => e.name == saved,
      orElse: () => PaperWidth.mm58,
    );
  }
}
