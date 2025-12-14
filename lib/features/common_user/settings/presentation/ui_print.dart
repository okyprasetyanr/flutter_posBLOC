import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_event.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_state.dart';

class UIPrint extends StatelessWidget {
  const UIPrint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Printer BLoC')),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          final bloc = context.read<SettingsBloc>();

          if (state is SettingsPrinterInitial) {
            return Center(
              child: ElevatedButton(
                onPressed: () => bloc.add(SettingsStartScanEvent()),
                child: const Text('Scan Printer'),
              ),
            );
          }

          if (state is SettingsPrinterScanning) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is SettingsPrinterScanResult) {
            return ListView(
              children: state.devices.map((d) {
                return ListTile(
                  title: Text(d.name),
                  subtitle: Text(d.address),
                  onTap: () => bloc.add(SettingsSelectPrinterEvent(d)),
                );
              }).toList(),
            );
          }

          if (state is SettingsPrinterConnecting) {
            return const Center(child: Text('Connecting...'));
          }

          if (state is SettingsPrinterConnected) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Terhubung ke: ${state.device.name}'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => bloc.add(SettingsPrintTestEvent()),
                  child: const Text('Test Print'),
                ),
                ElevatedButton(
                  onPressed: () => bloc.add(SettingsDisconnectPrinterEvent()),
                  child: const Text('Disconnect'),
                ),
              ],
            );
          }

          if (state is SettingsPrinterPrinting) {
            return const Center(child: Text('Printing...'));
          }

          return const Center(child: Text('State tidak dikenali'));
        },
      ),
    );
  }
}
