import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_event.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_state.dart';
import 'package:flutter_pos/function/printer/service_printer.dart';

class UIPrint extends StatelessWidget {
  const UIPrint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrinterBloc(ServicePrinter())..add(InitPrinter()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Pengaturan Printer"),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        body: BlocListener<PrinterBloc, PrinterState>(
          listenWhen: (previous, current) =>
              previous.errorMessage != current.errorMessage &&
              current.errorMessage != null,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Error'),
                backgroundColor: Colors.red,
              ),
            );
          },
          child: const PrinterView(),
        ),
      ),
    );
  }
}

class PrinterView extends StatelessWidget {
  const PrinterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ================= HEADER: STATUS & PAPER SIZE =================
        _buildHeader(context),

        const Divider(thickness: 1),

        // ================= SCAN BUTTON =================
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: BlocBuilder<PrinterBloc, PrinterState>(
            builder: (context, state) {
              if (state.isScanning) {
                return const Center(child: CircularProgressIndicator());
              }
              return ElevatedButton.icon(
                onPressed: () => context.read<PrinterBloc>().add(StartScan()),
                icon: const Icon(Icons.search),
                label: const Text("Scan Printer Bluetooth"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                ),
              );
            },
          ),
        ),

        // ================= LIST DEVICES =================
        Expanded(
          child: BlocBuilder<PrinterBloc, PrinterState>(
            builder: (context, state) {
              if (state.scanResults.isEmpty && !state.isScanning) {
                return Center(
                  child: Text(
                    "Belum ada device ditemukan.\nPastikan Bluetooth menyala.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                );
              }

              return ListView.builder(
                itemCount: state.scanResults.length,
                itemBuilder: (context, index) {
                  final device = state.scanResults[index];
                  // Cek apakah device ini yang sedang terkoneksi (Logic sederhana berdasarkan address/nama)
                  // Note: BluetoothPrintPlus tidak selalu menyimpan full object device di state connected
                  final isConnected =
                      state.connectState == ConnectState.connected &&
                      state.connectedDevice?.address == device.address;

                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.print,
                        color: isConnected ? Colors.green : Colors.grey,
                      ),
                      title: Text(device.name),
                      subtitle: Text(device.address),
                      trailing: isConnected
                          ? const Chip(
                              label: Text(
                                "Terhubung",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.green,
                            )
                          : ElevatedButton(
                              child: const Text("Connect"),
                              onPressed: () {
                                context.read<PrinterBloc>().add(
                                  ConnectDevice(device),
                                );
                              },
                            ),
                      onTap: () {
                        context.read<PrinterBloc>().add(ConnectDevice(device));
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),

        // ================= FOOTER: TEST PRINT =================
        _buildFooter(context),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[100],
      child: Column(
        children: [
          // Status Row
          BlocBuilder<PrinterBloc, PrinterState>(
            builder: (context, state) {
              final isConnected = state.connectState == ConnectState.connected;
              return Row(
                children: [
                  Icon(
                    Icons.bluetooth,
                    color: isConnected ? Colors.blue : Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    isConnected ? "Status: TERKONEKSI" : "Status: TERPUTUS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isConnected ? Colors.blue : Colors.red,
                    ),
                  ),
                  const Spacer(),
                  if (isConnected)
                    TextButton(
                      onPressed: () =>
                          context.read<PrinterBloc>().add(DisconnectDevice()),
                      child: const Text(
                        "Putus",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 10),
          // Paper Size Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Ukuran Kertas:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              BlocBuilder<PrinterBloc, PrinterState>(
                buildWhen: (previous, current) =>
                    previous.paperWidth != current.paperWidth,
                builder: (context, state) {
                  return DropdownButton<PaperWidth>(
                    value: state.paperWidth,
                    items: const [
                      DropdownMenuItem(
                        value: PaperWidth.mm58,
                        child: Text("58mm (Kecil)"),
                      ),
                      DropdownMenuItem(
                        value: PaperWidth.mm80,
                        child: Text("80mm (Besar)"),
                      ),
                    ],
                    onChanged: (val) {
                      if (val != null) {
                        context.read<PrinterBloc>().add(ChangePaperSize(val));
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: BlocBuilder<PrinterBloc, PrinterState>(
        builder: (context, state) {
          final isConnected = state.connectState == ConnectState.connected;
          return SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: isConnected
                  ? () => context.read<PrinterBloc>().add(
                      PrintData(data: null, type: PrintFormatType.test_print),
                    )
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              icon: const Icon(Icons.receipt_long),
              label: const Text("TEST PRINT"),
            ),
          );
        },
      ),
    );
  }
}
