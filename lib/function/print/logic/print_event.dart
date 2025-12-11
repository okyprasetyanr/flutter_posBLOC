import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';

abstract class PrinterEvent {}

class StartScanEvent extends PrinterEvent {}

class SelectPrinterEvent extends PrinterEvent {
  final BluetoothDevice device;
  SelectPrinterEvent(this.device);
}

class PrintTestEvent extends PrinterEvent {}

class DisconnectPrinterEvent extends PrinterEvent {}
