import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';

class UIInventorySearchAndBranchCategory extends StatelessWidget {
  final TextEditingController searchControllerItem;
  final TextEditingController searchControllerCategory;
  const UIInventorySearchAndBranchCategory({
    Key? key,
    required this.searchControllerItem,
    required this.searchControllerCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: customTextField(
            controller: searchControllerCategory,
            enable: true,
            inputType: TextInputType.text,
            text: "Cari",
            onChanged: (value) => context.read<InventoryBloc>().add(
              InventorySearchCategory(search: value),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: BlocSelector<InventoryBloc, InventoryState, String>(
            selector: (state) =>
                state is InventoryLoaded ? state.idBranch ?? "" : "",
            builder: (context, state) {
              return WidgetDropdownBranch(
                idBranch: state,
                selectedIdBranch: (selectedIdBranch) {
                  searchControllerItem.clear();
                  searchControllerCategory.clear();
                  context.read<InventoryBloc>().add(
                    InventoryGetData(idBranch: selectedIdBranch),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
