import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_pos/features/common_user/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
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
            child: TextField(
              style: lv1TextStyle,
              controller: searchControllerItem,
              decoration: InputDecoration(
                isDense: true,
                labelText: "Cari...",
                hintText: "...",
                labelStyle: lv1TextStyle,
                hintStyle: lv1TextStyle,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
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
