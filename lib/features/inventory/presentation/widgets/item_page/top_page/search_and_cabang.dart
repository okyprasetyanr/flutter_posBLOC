import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/widget_dropdown_branch.dart';

class UIInventorySearchAndBranch extends StatelessWidget {
  const UIInventorySearchAndBranch({super.key});

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
                context.read<InventoryBloc>().add(
                  InventorySearchitem(text: value),
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
                  selectedIdBranch: (SelectedIdBranch) => context
                      .read<InventoryBloc>()
                      .add(InventoryGetData(idBranch: SelectedIdBranch)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
