import 'package:flutter/material.dart';
import 'package:flutter_pos/features/inventory/presentation/widgets/item_page/bottom_page/condiment_switch.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_text_field.dart';

class UIInventoryFormFieldItem extends StatelessWidget {
  final TextEditingController namaItemController;
  final TextEditingController kodeBarcodeController;
  final TextEditingController hargaItemController;
  const UIInventoryFormFieldItem({
    super.key,
    required this.namaItemController,
    required this.kodeBarcodeController,
    required this.hargaItemController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customTextField("Nama Item", namaItemController),
        const SizedBox(height: 10),
        customTextField("Kode/Barcode", kodeBarcodeController),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: customTextField("Harga", hargaItemController),
            ),
            const SizedBox(width: 20),
            Flexible(flex: 1, fit: FlexFit.loose, child: CondimentSwitch()),
          ],
        ),
      ],
    );
  }
}
