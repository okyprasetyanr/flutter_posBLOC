import 'dart:async';
import 'dart:typed_data';
import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

class ServicePrinter {
  static final ServicePrinter _instance = ServicePrinter._internal();
  factory ServicePrinter() => _instance;

  ConnectState _currentStatus = ConnectState.disconnected;
  static const _savedMacKey = 'saved_printer_mac';
  static const _paperWidthKey = 'paper_width';

  bool _isPrinting = false;
  final List<Uint8List> _printQueue = [];

  ServicePrinter._internal() {
    BluetoothPrintPlus.connectState.listen((state) => _currentStatus = state);
  }

  // Regex untuk filter printer agar lebih clean
  bool _isPrinter(BluetoothDevice device) {
    final name = device.name.toLowerCase();
    if (name.isEmpty) return false;
    return RegExp(
      r'printer|pos|thermal|xp|rpp|epson|zjiang|gp|print|mpt',
    ).hasMatch(name);
  }

  // Streams
  Stream<ConnectState> get connectState => BluetoothPrintPlus.connectState;
  Stream<bool> get isScanning => BluetoothPrintPlus.isScanning;

  Stream<List<BluetoothDevice>> get scanResults =>
      BluetoothPrintPlus.scanResults.map(
        (devices) => devices
            .where((d) => _isPrinter(d))
            .toSet() // Menghilangkan duplikasi berdasarkan objek
            .toList(),
      );

  // Actions
  Future<void> startScan() async {
    await BluetoothPrintPlus.stopScan();
    await BluetoothPrintPlus.startScan(timeout: const Duration(seconds: 10));
  }

  Future<void> stopScan() => BluetoothPrintPlus.stopScan();

  Future<void> connect(BluetoothDevice device) async {
    try {
      await BluetoothPrintPlus.disconnect();
      await Future.delayed(const Duration(milliseconds: 500));
      await BluetoothPrintPlus.connect(device);
      await _saveMac(device.address);
    } catch (e) {
      debugPrint("Log ServicePrinter: Connect Error $e");
    }
  }

  Future<void> disconnect() => BluetoothPrintPlus.disconnect();

  Future<bool> initSavedPrinter() async {
    final savedMac = await getSavedMac();
    if (savedMac == null) return false;

    await stopScan();
    await disconnect();

    final completer = Completer<bool>();
    StreamSubscription? scanSub;

    await BluetoothPrintPlus.startScan(timeout: const Duration(seconds: 7));

    scanSub = BluetoothPrintPlus.scanResults.listen((results) async {
      final printer = results.firstWhereOrNull(
        (d) => d.address.toUpperCase() == savedMac.toUpperCase(),
      );

      if (printer != null && !completer.isCompleted) {
        await stopScan();
        await scanSub?.cancel();
        await BluetoothPrintPlus.connect(printer);

        await Future.delayed(const Duration(seconds: 2));
        completer.complete(_currentStatus == ConnectState.connected);
      }
    });

    // Timeout safety
    Future.delayed(const Duration(seconds: 8), () {
      if (!completer.isCompleted) {
        scanSub?.cancel();
        completer.complete(false);
      }
    });

    return completer.future;
  }

  // Printing Logic
  Future<void> enqueuePrint(Uint8List bytes) async {
    _printQueue.add(bytes);
    if (_isPrinting) return;

    _isPrinting = true;
    while (_printQueue.isNotEmpty) {
      await _safeWrite(_printQueue.removeAt(0));
    }
    _isPrinting = false;
  }

  Future<void> _safeWrite(Uint8List bytes) async {
    if (_currentStatus != ConnectState.connected) {
      if (!await initSavedPrinter()) return;
    }

    try {
      // 1. Reset/Wake up printer
      await BluetoothPrintPlus.write(Uint8List.fromList([0x1B, 0x40]));
      await Future.delayed(const Duration(milliseconds: 200));

      // 2. Kirim data
      await BluetoothPrintPlus.write(bytes);
    } catch (e) {
      debugPrint("Log ServicePrinter: Write Gagal $e");
      await disconnect();
    }
  }

  // Storage
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
