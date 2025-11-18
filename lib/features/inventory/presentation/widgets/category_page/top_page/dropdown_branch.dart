import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/widget/common_widget/widget_dropdown_branch.dart';

class UIInventoryDropdownBranch extends StatelessWidget {
  final String selectedFilterItem;
  final String selectedStatusItem;
  final String selectedFilterJenisItem;
  final String selectedFilterCategoryItem;
  const UIInventoryDropdownBranch({
    super.key,
    required this.selectedFilterItem,
    required this.selectedStatusItem,
    required this.selectedFilterJenisItem,
    required this.selectedFilterCategoryItem,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<InventoryBloc, InventoryState, String>(
      selector: (state) => state is InventoryLoaded ? state.idBranch ?? "" : "",
      builder: (context, state) {
        return WidgetDropdownBranch(
          idBranch: state,
          selectedIdBranch: (selectedIdBranch) =>
              context.read<InventoryBloc>().add(
                InvGetData(
                  filter: selectedFilterItem,
                  status: selectedStatusItem,
                  idBranch: selectedIdBranch,
                  filterjenis: selectedFilterJenisItem,
                  filterIDCategory: selectedFilterCategoryItem,
                ),
              ),
        );
      },
    );
  }
}
