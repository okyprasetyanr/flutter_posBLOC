import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_event.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_state.dart';

class UIPrint extends StatelessWidget {
  const UIPrint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengaturan Printer"),
        backgroundColor: AppPropertyColor.primary,
        foregroundColor: AppPropertyColor.white,
      ),
      body: BlocListener<PrinterBloc, PrinterState>(
        listenWhen: (previous, current) =>
            previous.errorMessage != current.errorMessage &&
            current.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? 'Error'),
              backgroundColor: AppPropertyColor.deleteOrClose,
            ),
          );
        },
        child: const PrinterView(),
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

        BlocSelector<PrinterBloc, PrinterState, bool>(
          selector: (state) => state.isScanning,
          builder: (context, state) {
            if (state) {
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

        // ================= LIST DEVICES =================
        Expanded(
          child:
              BlocSelector<
                PrinterBloc,
                PrinterState,
                (bool, List<BluetoothDevice>, ConnectState, BluetoothDevice?)
              >(
                selector: (state) => (
                  state.isScanning,
                  state.scanResults,
                  state.connectState,
                  state.connectedDevice,
                ),
                builder: (context, state) {
                  if (state.$2.isEmpty && !state.$1) {
                    return Center(
                      child: Text(
                        "Belum ada device ditemukan.\nPastikan Bluetooth menyala.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppPropertyColor.grey),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: state.$2.length,
                    itemBuilder: (context, index) {
                      final device = state.$2[index];
                      // Cek apakah device ini yang sedang terkoneksi (Logic sederhana berdasarkan address/nama)
                      // Note: BluetoothPrintPlus tidak selalu menyimpan full object device di state connected
                      final isConnected =
                          state.$3 == ConnectState.connected &&
                          state.$4?.address == device.address;

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.print,
                            color: isConnected
                                ? AppPropertyColor.green
                                : AppPropertyColor.grey,
                          ),
                          title: Text(device.name),
                          subtitle: Text(device.address),
                          trailing: isConnected
                              ? const Chip(
                                  label: Text(
                                    "Terhubung",
                                    style: TextStyle(
                                      color: AppPropertyColor.white,
                                    ),
                                  ),
                                  backgroundColor: AppPropertyColor.green,
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
                            context.read<PrinterBloc>().add(
                              ConnectDevice(device),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
        ),
        _buildFooter(context),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppPropertyColor.greyLight,
      child: Column(
        children: [
          // Status Row
          BlocSelector<PrinterBloc, PrinterState, ConnectState>(
            selector: (state) => state.connectState,
            builder: (context, state) {
              final isConnected = state == ConnectState.connected;
              return Row(
                children: [
                  Icon(
                    Icons.bluetooth,
                    color: isConnected
                        ? AppPropertyColor.primary
                        : AppPropertyColor.grey,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    isConnected ? "Status: TERKONEKSI" : "Status: TERPUTUS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isConnected
                          ? AppPropertyColor.primary
                          : AppPropertyColor.deleteOrClose,
                    ),
                  ),
                  const Spacer(),
                  if (isConnected)
                    TextButton(
                      onPressed: () =>
                          context.read<PrinterBloc>().add(DisconnectDevice()),
                      child: const Text(
                        "Putus",
                        style: TextStyle(color: AppPropertyColor.deleteOrClose),
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
              BlocSelector<PrinterBloc, PrinterState, PaperWidth>(
                selector: (state) => state.paperWidth,
                builder: (context, state) {
                  return DropdownButton<PaperWidth>(
                    value: state,
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
        color: AppPropertyColor.white,
        boxShadow: [
          BoxShadow(
            color: AppPropertyColor.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: BlocSelector<PrinterBloc, PrinterState, ConnectState>(
        selector: (state) => state.connectState,
        builder: (context, state) {
          final isConnected = state == ConnectState.connected;
          return SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: isConnected
                  ? () => context.read<PrinterBloc>().add(
                      PrintData(data: null, type: PrintFormatType.test_print),
                    )
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPropertyColor.primary,
                foregroundColor: AppPropertyColor.white,
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
