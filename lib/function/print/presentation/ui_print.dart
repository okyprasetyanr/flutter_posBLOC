import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/function/print/logic/print_event.dart';
import 'package:flutter_pos/function/print/logic/print_state.dart';
import 'package:flutter_pos/function/print/print_service.dart';
import 'package:flutter_pos/function/print/logic/print_bloc.dart';

class UIPrint extends StatelessWidget {
  const UIPrint({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PrinterBloc(PrinterService()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Printer BLoC')),
        body: BlocBuilder<PrinterBloc, PrinterState>(
          builder: (context, state) {
            final bloc = context.read<PrinterBloc>();

            if (state is PrinterInitial) {
              return Center(
                child: ElevatedButton(
                  onPressed: () => bloc.add(StartScanEvent()),
                  child: const Text('Scan Printer'),
                ),
              );
            }

            if (state is PrinterScanning) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PrinterScanResult) {
              return ListView(
                children: state.devices.map((d) {
                  return ListTile(
                    title: Text(d.name),
                    subtitle: Text(d.address),
                    onTap: () => bloc.add(SelectPrinterEvent(d)),
                  );
                }).toList(),
              );
            }

            if (state is PrinterConnecting) {
              return const Center(child: Text('Connecting...'));
            }

            if (state is PrinterConnected) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Connected to: ${state.device.name}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => bloc.add(PrintTestEvent()),
                    child: const Text('Test Print'),
                  ),
                  ElevatedButton(
                    onPressed: () => bloc.add(DisconnectPrinterEvent()),
                    child: const Text('Disconnect'),
                  ),
                ],
              );
            }

            if (state is PrinterPrinting) {
              return const Center(child: Text('Printing...'));
            }

            return const Center(child: Text('Unknown state'));
          },
        ),
      ),
    );
  }
}
