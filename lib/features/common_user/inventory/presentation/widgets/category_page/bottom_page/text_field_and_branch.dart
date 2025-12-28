import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_branch.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';

class UICategoryTextFieldAndBranch extends StatelessWidget {
  final TextEditingController nameCategoryController;
  final TextEditingController branchController;
  final VoidCallback resetCategoryForm;
  const UICategoryTextFieldAndBranch({
    super.key,
    required this.nameCategoryController,
    required this.resetCategoryForm,
    required this.branchController,
  });

  @override
  Widget build(BuildContext context) {
    List<FocusNode> nodes = List.generate(2, (_) => FocusNode());
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 2,
          child: BlocListener<InventoryBloc, InventoryState>(
            listenWhen: (previous, current) =>
                previous is InventoryLoaded &&
                current is InventoryLoaded &&
                previous.dataSelectedCategory != current.dataSelectedCategory,
            listener: (context, state) {
              if (state is InventoryLoaded &&
                  state.dataSelectedCategory != null) {
                nameCategoryController.text =
                    state.dataSelectedCategory!.getnameCategory;
              }
            },
            child: customTextField(
              context: context,
              index: 0,
              nodes: nodes,
              inputType: TextInputType.text,
              text: "Nama Kategori",
              controller: nameCategoryController,
              enable: true,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: customTextBranch<InventoryBloc, InventoryState>(
            context,
            result: (state) {
              if (state is InventoryLoaded) {
                return state.dataBranch!
                    .firstWhere(
                      (element) => element.getidBranch == state.idBranch,
                    )
                    .getareaBranch;
              }
              return "";
            },
          ),
        ),
      ],
    );
  }
}
