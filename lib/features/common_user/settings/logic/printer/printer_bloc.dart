import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter_pos/function/printer/format_print.dart';
import 'package:flutter_pos/function/printer/service_printer.dart';
import 'printer_event.dart';
import 'printer_state.dart';

class PrinterBloc extends Bloc<PrinterEvent, PrinterState> {
  final ServicePrinter _service;
  StreamSubscription? _scanSubscription;
  StreamSubscription? _stateSubscription;

  PrinterBloc(this._service) : super(const PrinterState()) {
    on<InitPrinter>(_onInit);
    on<StartScan>(_onStartScan);
    on<StopScan>(_onStopScan);
    on<ConnectDevice>(_onConnect);
    on<DisconnectDevice>(_onDisconnect);
    on<ChangePaperSize>(_onChangePaperSize);
    on<PrintData>(_onPrintData);
    on<UpdateScanResults>(
      (event, emit) => emit(state.copyWith(scanResults: event.devices)),
    );
    on<UpdateConnectionState>(_onConnectionStateChanged);
  }

  Future<void> _onInit(InitPrinter event, Emitter<PrinterState> emit) async {
    // 1. Load Paper Size
    final savedPaper = await _service.getPaperSize();

    // 2. Listen ke perubahan status koneksi global
    _stateSubscription = _service.connectState.listen((s) {
      add(UpdateConnectionState(s));
    });

    // 3. Coba auto connect
    await _service.initSavedPrinter();

    emit(state.copyWith(paperWidth: savedPaper));
  }

  Future<void> _onStartScan(StartScan event, Emitter<PrinterState> emit) async {
    emit(state.copyWith(isScanning: true, scanResults: []));

    // Mulai scan di service
    await _service.startScan();

    // Listen hasil scan
    _scanSubscription?.cancel();
    _scanSubscription = _service.scanResults.listen((devices) {
      add(UpdateScanResults(devices));
    });

    // Auto stop loading UI setelah timeout (sinkron dengan timeout service)
    // Atau listen ke stream isScanning dari service juga bisa
    Future.delayed(const Duration(seconds: 10), () {
      if (!isClosed) {
        add(StopScan());
      }
    });
  }

  Future<void> _onStopScan(StopScan event, Emitter<PrinterState> emit) async {
    await _service.stopScan();
    emit(state.copyWith(isScanning: false));
  }

  Future<void> _onConnect(
    ConnectDevice event,
    Emitter<PrinterState> emit,
  ) async {
    // Set UI loading connected dulu (optimistic) atau tunggu stream
    emit(state.copyWith(connectedDevice: event.device));
    try {
      await _service.connect(event.device);
    } catch (e) {
      emit(state.copyWith(errorMessage: "Gagal connect: $e"));
    }
  }

  Future<void> _onDisconnect(
    DisconnectDevice event,
    Emitter<PrinterState> emit,
  ) async {
    await _service.disconnect();
  }

  Future<void> _onConnectionStateChanged(
    UpdateConnectionState event,
    Emitter<PrinterState> emit,
  ) async {
    emit(state.copyWith(connectState: event.state));
  }

  Future<void> _onChangePaperSize(
    ChangePaperSize event,
    Emitter<PrinterState> emit,
  ) async {
    await _service.savePaperSize(event.size);
    emit(state.copyWith(paperWidth: event.size));
  }

  Future<void> _onPrintData(PrintData event, Emitter<PrinterState> emit) async {
    if (state.connectState != ConnectState.connected) {
      emit(state.copyWith(errorMessage: "Printer belum terkoneksi!"));
      return;
    }
    try {
      await ReceiptBuilder.print(formatType: event.type, data: event.data);
    } catch (e) {
      emit(state.copyWith(errorMessage: "Gagal print: $e"));
    }
  }

  @override
  Future<void> close() async {
    await _service.stopScan();
    _scanSubscription?.cancel();
    _stateSubscription?.cancel();
    return super.close();
  }
}
