import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/features/common_user/inventory/presentation/widgets/item_page/bottom_page/condiment_switch.dart';
import 'package:flutter_pos/function/bottom_sheet.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UIInventoryFormFieldItem extends StatelessWidget {
  final TextEditingController nameItemController;
  final TextEditingController codeBarcodeController;
  final TextEditingController priceItemController;
  final GlobalKey<FormState> formKey;
  final List<FocusNode> nodes;
  const UIInventoryFormFieldItem({
    super.key,
    required this.nameItemController,
    required this.codeBarcodeController,
    required this.priceItemController,
    required this.formKey,
    required this.nodes,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryBloc, InventoryState>(
      listenWhen: (previous, current) =>
          previous is InventoryLoaded &&
          current is InventoryLoaded &&
          (previous.dataSelectedItem != current.dataSelectedItem ||
              previous.idBranch != current.idBranch),
      listener: (context, state) {
        if (state is InventoryLoaded) {
          final dataSelectedItem = state.dataSelectedItem;
          nameItemController.text = dataSelectedItem?.getnameItem ?? "";
          codeBarcodeController.text = dataSelectedItem?.getBarcode ?? "";
          priceItemController.text = formatQtyOrPrice(
            dataSelectedItem?.getpriceItem ?? 0,
          );
          context.read<InventoryBloc>().add(
            InventoryCondimentForm(
              condimentForm:
                  dataSelectedItem?.getstatusCondiment == StatusData.Aktif,
            ),
          );
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: customTextField(
                    context: context,
                    index: 0,
                    nodes: nodes,
                    inputType: TextInputType.text,
                    text: "Nama Item",
                    controller: nameItemController,
                    enable: true,
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: customButton(
                    backgroundColor: AppPropertyColor.primary,
                    child: Icon(
                      Icons.image_search_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () => customBottomSheet(
                      context: context,
                      resetItemForm: null,
                      content: (scrollController) =>
                          BlocSelector<InventoryBloc, InventoryState, File?>(
                            selector: (state) {
                              if (state is InventoryLoaded) {
                                return state.image;
                              }
                              return null;
                            },
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () => context.read<InventoryBloc>().add(
                                  InventoryPickImage(),
                                ),
                                child: state == null
                                    ? Text(
                                        "Belum ada gambar!",
                                        style: lv05TextStyle,
                                      )
                                    : Image.file(state),
                              );
                            },
                          ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            customTextField(
              context: context,
              index: 1,
              nodes: nodes,
              inputType: TextInputType.text,
              text: "Kode/Barcode",
              controller: codeBarcodeController,
              enable: true,
              validator: (value) {
                final bloc = context.read<InventoryBloc>().state;
                if (bloc is InventoryLoaded && bloc.dataSelectedItem == null) {
                  bool duplicated = bloc.dataItem.any(
                    (element) => element.getBarcode == value,
                  );
                  if (duplicated) {
                    return 'Kode sudah dipakai';
                  }
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: customTextField(
                    context: context,
                    index: 2,
                    nodes: nodes,
                    inputType: TextInputType.text,
                    text: "Harga",
                    controller: priceItemController,
                    enable: true,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(width: 100, child: CondimentSwitch()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
