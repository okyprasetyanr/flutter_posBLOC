import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';
import 'package:uuid/uuid.dart';

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
    return BlocSelector<InventoryBloc, InventoryState, ModelCategory?>(
      selector: (state) {
        if (state is InventoryLoaded) {
          return state.dataSelectedCategory;
        }
        return null;
      },
      builder: (context, state) {
        return customButtonIcon(
          onPressed: () async {
            if (nameCategoryController.text.trim().isEmpty) {
              customSnackBar(context, "Nama Kategori Kosong!");
              return;
            }
            String idCategory = state?.getidCategory ?? const Uuid().v4();
            final category = ModelCategory(
              nameCategory: nameCategoryController.text,
              idCategory: idCategory,
              idBranch: (context.read<InventoryBloc>().state as InventoryLoaded)
                  .idBranch!,
            );
            context.read<InventoryBloc>().add(
              InventoryUploadCategory(category: category),
            );

            resetCategoryForm();
          },
          icon: const Icon(Icons.check_rounded, color: Colors.white),
          label: Text(
            state == null ? "Simpan" : "Edit",
            style: lv1TextStyleWhite,
          ),
          backgroundColor: AppColor.primary,
        );
      },
    );
  }
}
