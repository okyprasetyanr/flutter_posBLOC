import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';

abstract class PrinterState {}

class PrinterInitial extends PrinterState {}

class PrinterScanning extends PrinterState {}

class PrinterScanResult extends PrinterState {
  final List<BluetoothDevice> devices;
  PrinterScanResult(this.devices);
}

class PrinterConnecting extends PrinterState {}

class PrinterConnected extends PrinterState {
  final BluetoothDevice device;
  PrinterConnected(this.device);
}

class PrinterDisconnected extends PrinterState {}

class PrinterPrinting extends PrinterState {}

class PrinterError extends PrinterState {
  final String message;
  PrinterError(this.message);
}
