import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';

class UICategoryButtonCategory extends StatelessWidget {
  final TextEditingController nameCategoryController;
  final VoidCallback resetCategoryForm;
  const UICategoryButtonCategory({
    super.key,
    required this.nameCategoryController,
    required this.resetCategoryForm,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<InventoryBloc, InventoryState, bool>(
      selector: (state) {
        if (state is InventoryLoaded) {
          return state.dataSelectedCategory != null;
        }
        return true;
      },
      builder: (context, state) {
        return customButtonIcon(
          onPressed: () async {
            if (nameCategoryController.text.trim().isEmpty) {
              customSnackBar(context, "Nama Kategori Kosong!");
              return;
            }
            context.read<InventoryBloc>().add(
              InventoryUploadCategory(name: nameCategoryController.text),
            );
            resetCategoryForm();
          },
          icon: const Icon(Icons.check_rounded, color: AppPropertyColor.white),
          label: Text(state ? "Edit" : "Simpan", style: lv1TextStyleWhite),
          backgroundColor: AppPropertyColor.primary,
        );
      },
    );
  }
}
