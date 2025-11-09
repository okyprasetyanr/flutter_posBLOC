import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
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
        return ElevatedButton.icon(
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
                  .selectedIdBranch!,
            );
            context.read<InventoryBloc>().add(
              InvUploadCategory(category: category),
            );

            resetCategoryForm();
          },
          style: ElevatedButton.styleFrom(
            iconColor: Colors.white,
            backgroundColor: AppColor.primary,
          ),
          icon: const Icon(Icons.check),
          label: Text(
            state == null ? "Simpan" : "Edit",
            style: lv1TextStyleWhite,
          ),
        );
      },
    );
  }
}
