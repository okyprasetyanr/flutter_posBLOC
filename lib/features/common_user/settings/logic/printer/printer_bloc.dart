import 'dart:async';
import 'package:flutter/material.dart';
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
    emit(state.copyWith(isLoading: true));
    try {
      final savedPaper = await _service.getPaperSize();

      await Future.delayed(const Duration(milliseconds: 1500));

      final bool isReady = await BluetoothPrintPlus.isBlueOn;
      debugPrint("Log PrinterBloc: isReady: $isReady");
      if (_stateSubscription != null) {
        await _stateSubscription!.cancel();
      }

      if (isReady) {
        _stateSubscription = _service.connectState.listen((s) {
          if (!isClosed) add(UpdateConnectionState(s));
        });

        await Future.delayed(const Duration(milliseconds: 500));
        await _service.initSavedPrinter();
      }

      emit(state.copyWith(isLoading: false, paperWidth: savedPaper));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onStartScan(StartScan event, Emitter<PrinterState> emit) async {
    emit(state.copyWith(isScanning: true, scanResults: []));

    await _service.startScan();

    _scanSubscription?.cancel();
    _scanSubscription = _service.scanResults.listen((devices) {
      add(UpdateScanResults(devices));
    });

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
    try {
      await _service.stopScan();
    } catch (_) {}

    try {
      await _service.disconnect();
    } catch (_) {}
    await _scanSubscription?.cancel();
    await _stateSubscription?.cancel();

    return super.close();
  }
}
