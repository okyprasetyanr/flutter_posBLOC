import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/function/print/logic/print_event.dart';
import 'package:flutter_pos/function/print/logic/print_state.dart';
import 'package:flutter_pos/function/print/print_service.dart';

class PrinterBloc extends Bloc<PrinterEvent, PrinterState> {
  final PrinterService service;

  PrinterBloc(this.service) : super(PrinterInitial()) {
    on<StartScanEvent>(_onScan);
    on<SelectPrinterEvent>(_onSelectPrinter);
    on<PrintTestEvent>(_onPrintTest);
    on<DisconnectPrinterEvent>(_onDisconnect);
  }

  Future<void> _onScan(StartScanEvent event, Emitter emit) async {
    emit(PrinterScanning());
    await service.startScan();

    await emit.forEach<List<BluetoothDevice>>(
      service.scanResults,
      onData: (devices) => PrinterScanResult(devices),
      onError: (_, __) => PrinterError("Gagal scan"),
    );
  }

  Future<void> _onSelectPrinter(SelectPrinterEvent event, Emitter emit) async {
    emit(PrinterConnecting());
    await service.connect(event.device);
    emit(PrinterConnected(event.device));
  }

  Future<void> _onPrintTest(PrintTestEvent event, Emitter emit) async {
    emit(PrinterPrinting());
    await service.printTest();

    // balik ke state connected
    final connected = state is PrinterConnected
        ? (state as PrinterConnected).device
        : null;

    if (connected != null) {
      emit(PrinterConnected(connected));
    }
  }

  Future<void> _onDisconnect(DisconnectPrinterEvent event, Emitter emit) async {
    await service.disconnect();
    emit(PrinterDisconnected());
  }
}
