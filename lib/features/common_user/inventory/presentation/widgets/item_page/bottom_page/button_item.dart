import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';

class UIInventoryButtonItem extends StatelessWidget {
  final TextEditingController nameItemController;
  final TextEditingController priceItemController;
  final TextEditingController codeBarcodeController;
  final ValueNotifier<String?> selectedIdCategoryItem;
  final VoidCallback resetItemForm;
  final GlobalKey<FormState> formKey;
  const UIInventoryButtonItem({
    super.key,
    required this.nameItemController,
    required this.priceItemController,
    required this.codeBarcodeController,
    required this.resetItemForm,
    required this.selectedIdCategoryItem,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: customButtonIcon(
            onPressed: () {
              final bloc = context.read<InventoryBloc>();
              String? idItem;
              if (bloc.state is InventoryLoaded) {
                idItem =
                    (bloc.state as InventoryLoaded).dataSelectedItem?.getidItem;
              }
              if (idItem != null) {
                bloc.add(InventoryDeleteItem(id: idItem));
              } else {
                customSnackBar(context, "Pilih item terlebih dahulu!");
              }
            },
            label: Text("Hapus", style: lv0TextStyleRED),
            icon: Icon(Icons.delete, color: AppPropertyColor.deleteOrClose),
            backgroundColor: Colors.white,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: customButtonIcon(
            onPressed: () {
              if (!formKey.currentState!.validate()) {
                customSnackBar(context, "Kode/Barcode sudah digunakan!");
              } else if (nameItemController.text.isEmpty ||
                  priceItemController.text.isEmpty ||
                  codeBarcodeController.text.isEmpty ||
                  selectedIdCategoryItem.value == null) {
                customSnackBar(
                  context,
                  "Data belum lengkap atau tidak sesuai!",
                );
              } else {
                context.read<InventoryBloc>().add(
                  InventoryUploadItem(
                    price: priceItemController.text,
                    codeBarcode: codeBarcodeController.text,
                    name: nameItemController.text,
                    selectedIdCategory: selectedIdCategoryItem.value!,
                  ),
                );
                formKey.currentState!.reset();
              }
            },
            label: BlocSelector<InventoryBloc, InventoryState, String?>(
              selector: (state) {
                if (state is InventoryLoaded) {
                  return state.dataSelectedItem != null ? "Edit" : "Simpan";
                }
                return "Simpan";
              },
              builder: (context, state) {
                return Text(state!, style: lv1TextStyleWhite);
              },
            ),

            icon: Icon(Icons.check_rounded, color: Colors.white),
            backgroundColor: AppPropertyColor.primary,
          ),
        ),
      ],
    );
  }
}
