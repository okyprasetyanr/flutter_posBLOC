import 'package:flutter/material.dart';
import 'package:bluetooth_print_plus/bluetooth_print.dart';
import 'package:bluetooth_print_plus/bluetooth_print_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BluetoothPrint bluetooth = BluetoothPrint.instance;
  List<BluetoothDevice> devices = [];

  @override
  void initState() {
    super.initState();
    bluetooth.scanResults.listen((scanList) {
      setState(() => devices = scanList);
    });
  }

  void startScan() {
    bluetooth.startScan(timeout: const Duration(seconds: 4));
  }

  Future<void> connectAndPrint(BluetoothDevice d) async {
    await bluetooth.connect(d);
    List<LineText> items = [
      LineText(
        type: LineText.TYPE_TEXT,
        content: 'Hello from Flutter!',
        linefeed: 1,
      ),
      LineText(
        type: LineText.TYPE_TEXT,
        content: 'Thank you 😊',
        align: LineText.ALIGN_CENTER,
      ),
      // more lines...
    ];
    await bluetooth.printReceipt({}, items);
    await bluetooth.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bluetooth Thermal Print')),
      floatingActionButton: FloatingActionButton(
        onPressed: startScan,
        child: const Icon(Icons.search),
      ),
      body: ListView(
        children: devices.map((d) {
          return ListTile(
            title: Text(d.name ?? ''),
            subtitle: Text(d.address),
            onTap: () => connectAndPrint(d),
          );
        }).toList(),
      ),
    );
  }
}
