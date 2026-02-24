import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_dropdown_filter.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_event.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_state.dart';
import 'package:flutter_pos/service/service_printer.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UIPrint extends StatelessWidget {
  const UIPrint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPropertyColor.white,
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
        SizedBox(
          width: double.infinity,
          child: customTextBorder("Printer", lv2TextStyleWhite),
        ),
        _buildHeader(context),

        SizedBox(
          width: double.infinity,
          child: BlocSelector<PrinterBloc, PrinterState, bool>(
            selector: (state) => state.isScanning,
            builder: (context, state) {
              if (state) {
                return const Center(child: CircularProgressIndicator());
              }
              return customButtonIcon(
                backgroundColor: AppPropertyColor.white,
                icon: const Icon(Icons.search, color: AppPropertyColor.black),
                label: Text("Scan Printer Bluetooth", style: lv1TextStyle),
                onPressed: () => context.read<PrinterBloc>().add(StartScan()),
              );
            },
          ),
        ),

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
                        style: lv05TextStyle,
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: state.$2.length,
                    itemBuilder: (context, index) {
                      final device = state.$2[index];
                      final isConnected =
                          state.$3 == ConnectState.connected &&
                          state.$4?.address == device.address;

                      return Card(
                        color: AppPropertyColor.white,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.print,
                            color: isConnected
                                ? AppPropertyColor.primary
                                : AppPropertyColor.grey,
                          ),
                          title: Text(device.name, style: lv05TextStyle),
                          subtitle: Text(device.address, style: lv05TextStyle),
                          trailing: isConnected
                              ? Chip(
                                  label: Text(
                                    "Terhubung",
                                    style: lv1TextStyleWhite,
                                  ),
                                  backgroundColor: AppPropertyColor.primary,
                                )
                              : ElevatedButton(
                                  child: const Text("Sambung"),
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
      color: AppPropertyColor.white,
      child: Column(
        children: [
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
                    isConnected ? "Status: Terhubung" : "Status: Terputus",
                    style: lv1TextStyleBold,
                  ),
                  const Spacer(),
                  if (isConnected)
                    customButton(
                      backgroundColor: AppPropertyColor.deleteOrClose,
                      child: Text("Putuskan", style: lv1TextStyleWhite),
                      onPressed: () =>
                          context.read<PrinterBloc>().add(DisconnectDevice()),
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: FutureBuilder(
                  future: ServicePrinter().getSavedMac(),
                  builder: (context, snapshot) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Terhubung ke:", style: lv1TextStyleBold),
                      Text(snapshot.data ?? "-", style: lv1TextStyleBold),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: BlocSelector<PrinterBloc, PrinterState, PaperWidth>(
                  selector: (state) => state.paperWidth,
                  builder: (context, state) {
                    return WidgetDropDownFilter(
                      initialValue: state,
                      filters: PaperWidth.values.map((map) => map).toList(),
                      text: "Pilih Kertas",
                      selectedValue: (selectedEnum) => context
                          .read<PrinterBloc>()
                          .add(ChangePaperSize(selectedEnum)),
                    );
                  },
                ),
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
            color: AppPropertyColor.grey.withValues(alpha: 0.2),
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
              label: Text("Cetak", style: lv3TextStyleWhiteBold),
            ),
          );
        },
      ),
    );
  }
}
