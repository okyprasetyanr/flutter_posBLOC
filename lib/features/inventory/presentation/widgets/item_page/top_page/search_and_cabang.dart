import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/widget/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UIInventorySearchAndBranch extends StatelessWidget {
  final String? selectedFilterItem;
  final String? selectedStatusItem;
  final String? selectedFilterJenisItem;
  final String? selectedFilterCategoryItem;
  const UIInventorySearchAndBranch({
    super.key,
    required this.selectedFilterItem,
    required this.selectedStatusItem,
    required this.selectedFilterJenisItem,
    required this.selectedFilterCategoryItem,
  });

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
              decoration: InputDecoration(
                isDense: true,
                labelText: "Search...",
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
                context.read<InventoryBloc>().add(InvSearchitem(text: value));
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
                  selectedIdBranch: (SelectedIdBranch) =>
                      context.read<InventoryBloc>().add(
                        InvGetData(
                          idBranch: SelectedIdBranch,
                          filter: selectedFilterItem!,
                          status: selectedStatusItem!,
                          filterjenis: selectedFilterJenisItem!,
                          filterIDCategory: selectedFilterCategoryItem!,
                        ),
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
