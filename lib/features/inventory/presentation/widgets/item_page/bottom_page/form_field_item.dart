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
        customTextField("Nama Item", namaItemController, true),
        const SizedBox(height: 10),
        customTextField("Kode/Barcode", kodeBarcodeController, true),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: customTextField("Harga", hargaItemController, true),
            ),
            const SizedBox(width: 10),
            Flexible(flex: 2, fit: FlexFit.loose, child: CondimentSwitch()),
          ],
        ),
      ],
    );
  }
}
