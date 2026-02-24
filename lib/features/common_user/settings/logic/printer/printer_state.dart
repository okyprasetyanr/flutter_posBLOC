import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_pos/enum/enum.dart';

class PrinterState extends Equatable {
  final List<BluetoothDevice> scanResults;
  final bool isScanning;
  final ConnectState connectState;
  final PaperWidth paperWidth;
  final String? errorMessage;
  final bool? isLoading;
  final BluetoothDevice? connectedDevice;

  const PrinterState({
    this.isLoading,
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
    bool? isLoading,
    ConnectState? connectState,
    PaperWidth? paperWidth,
    String? errorMessage,
    BluetoothDevice? connectedDevice,
  }) {
    return PrinterState(
      isLoading: isLoading ?? this.isLoading,
      scanResults: scanResults ?? this.scanResults,
      isScanning: isScanning ?? this.isScanning,
      connectState: connectState ?? this.connectState,
      paperWidth: paperWidth ?? this.paperWidth,
      errorMessage: errorMessage,
      connectedDevice: connectedDevice ?? this.connectedDevice,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    scanResults,
    isScanning,
    connectState,
    paperWidth,
    errorMessage,
    connectedDevice,
  ];
}
