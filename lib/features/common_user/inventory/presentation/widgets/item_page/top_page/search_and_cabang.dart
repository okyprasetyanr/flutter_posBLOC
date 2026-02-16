import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';

import 'package:flutter_pos/features/common_user/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';

class UIInventorySearchAndBranchItem extends StatelessWidget {
  final TextEditingController searchControllerItem;
  final TextEditingController searchControllerCategory;
  const UIInventorySearchAndBranchItem({
    Key? key,
    required this.searchControllerItem,
    required this.searchControllerCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, top: 5),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: customTextField(
              text: "Cari...",
              controller: searchControllerItem,
              moreRadius: true,
              onChanged: (value) {
                context.read<InventoryBloc>().add(
                  InventorySearchItem(search: value),
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: BlocSelector<InventoryBloc, InventoryState, String>(
              selector: (state) =>
                  state is InventoryLoaded ? state.idBranch ?? "" : "",
              builder: (context, state) {
                return WidgetDropdownBranch(
                  idBranch: state,
                  selectedIdBranch: (SelectedIdBranch) {
                    searchControllerItem.clear();
                    searchControllerCategory.clear();
                    context.read<InventoryBloc>().add(
                      InventoryGetData(idBranch: SelectedIdBranch),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
