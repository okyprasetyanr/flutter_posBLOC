import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/widget/common_widget/widget_dropdown_branch.dart';

class UIInventoryDropdownBranch extends StatelessWidget {
  const UIInventoryDropdownBranch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<InventoryBloc, InventoryState, String>(
      selector: (state) => state is InventoryLoaded ? state.idBranch ?? "" : "",
      builder: (context, state) {
        return WidgetDropdownBranch(
          idBranch: state,
          selectedIdBranch: (selectedIdBranch) => context
              .read<InventoryBloc>()
              .add(InventoryGetData(idBranch: selectedIdBranch)),
        );
      },
    );
  }
}
