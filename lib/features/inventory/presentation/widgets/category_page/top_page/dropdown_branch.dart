import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/widget/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    return BlocSelector<
      InventoryBloc,
      InventoryState,
      (List<ModelBranch>?, String?)
    >(
      selector: (state) {
        if (state is InventoryLoaded) {
          return (state.dataBranch, state.idBranch);
        }
        return (null, null);
      },
      builder: (context, state) {
        if (state.$1 == null) {
          return const SpinKitThreeBounce(color: Colors.blue, size: 15.0);
        }
        return WidgetDropdownBranch(
          listBranch: state.$1!,
          idBranch: state.$2!,
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
