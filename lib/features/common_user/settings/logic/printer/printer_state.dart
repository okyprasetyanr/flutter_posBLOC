import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/enum/enum.dart';

class PrinterState extends Equatable {
  final List<BluetoothDevice> scanResults;
  final bool isScanning;
  final ConnectState connectState;
  final PaperWidth paperWidth;
  final String? errorMessage;
  final BluetoothDevice? connectedDevice; // Menyimpan info device yg connect

  const PrinterState({
    this.scanResults = const [],
    this.isScanning = false,
    this.connectState = ConnectState.disconnected,
    this.paperWidth = PaperWidth.mm58,
    this.errorMessage,
    this.connectedDevice,
  });

  PrinterState copyWith({
    List<BluetoothDevice>? scanResults,
    bool? isScanning,
    ConnectState? connectState,
    PaperWidth? paperWidth,
    String? errorMessage,
    BluetoothDevice? connectedDevice,
  }) {
    return PrinterState(
      scanResults: scanResults ?? this.scanResults,
      isScanning: isScanning ?? this.isScanning,
      connectState: connectState ?? this.connectState,
      paperWidth: paperWidth ?? this.paperWidth,
      errorMessage:
          errorMessage, // Reset error jika null passed (opsional logic)
      connectedDevice: connectedDevice ?? this.connectedDevice,
    );
  }

  @override
  List<Object?> get props => [
    scanResults,
    isScanning,
    connectState,
    paperWidth,
    errorMessage,
    connectedDevice,
  ];
}
