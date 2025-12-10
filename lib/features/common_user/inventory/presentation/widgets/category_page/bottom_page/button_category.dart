import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
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
          icon: const Icon(Icons.check_rounded, color: Colors.white),
          label: Text(state ? "Simpan" : "Edit", style: lv1TextStyleWhite),
          backgroundColor: AppColor.primary,
        );
      },
    );
  }
}
