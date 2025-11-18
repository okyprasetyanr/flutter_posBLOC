import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_text_field.dart';

class UICategoryTextFieldAndBranch extends StatelessWidget {
  final TextEditingController nameCategoryController;
  final VoidCallback resetCategoryForm;
  const UICategoryTextFieldAndBranch({
    super.key,
    required this.nameCategoryController,
    required this.resetCategoryForm,
  });

  @override
  Widget build(BuildContext context) {
    List<FocusNode> nodes = List.generate(2, (_) => FocusNode());
    return Row(
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
          child: customTextField(
            context: context,
            index: 1,
            nodes: nodes,
            inputType: TextInputType.text,
            text: "Cabang",
            controller: TextEditingController(
              text: context.select<InventoryBloc, String?>(
                (data) => data.state is InventoryLoaded
                    ? (data.state as InventoryLoaded).areaBranch
                    : "",
              ),
            ),
            enable: false,
          ),
        ),
      ],
    );
  }
}
