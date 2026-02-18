import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter_pos/enum/enum.dart';

abstract class PrinterEvent extends Equatable {
  PrinterEvent();
  @override
  List<Object?> get props => [];
}

class Equatable {}

class InitPrinter extends PrinterEvent {}

class StartScan extends PrinterEvent {}

class StopScan extends PrinterEvent {}

class ConnectDevice extends PrinterEvent {
  final BluetoothDevice device;
  ConnectDevice(this.device);
}

class DisconnectDevice extends PrinterEvent {}

class ChangePaperSize extends PrinterEvent {
  final PaperWidth size;
  ChangePaperSize(this.size);
}

class TestPrint extends PrinterEvent {}

// Event internal untuk update state dari Stream listener
class UpdateScanResults extends PrinterEvent {
  final List<BluetoothDevice> devices;
  UpdateScanResults(this.devices);
}

class UpdateConnectionState extends PrinterEvent {
  final ConnectState state;
  UpdateConnectionState(this.state);
}
