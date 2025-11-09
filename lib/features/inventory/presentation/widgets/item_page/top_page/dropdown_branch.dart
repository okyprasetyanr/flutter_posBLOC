import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
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
    return BlocSelector<InventoryBloc, InventoryState, List<ModelBranch>?>(
      selector: (state) {
        if (state is InventoryLoaded) {
          return state.dataBranch;
        }
        return null;
      },
      builder: (context, state) {
        if (state == null) {
          return const SpinKitThreeBounce(color: Colors.blue, size: 15.0);
        }
        return DropdownButtonFormField<ModelBranch>(
          style: lv1TextStyle,
          initialValue: state.first,
          items: state
              .map(
                (map) => DropdownMenuItem(
                  value: map,
                  child: Text(map.getareaBranch),
                ),
              )
              .toList(),
          onChanged: (value) {
            context.read<InventoryBloc>().add(
              InvGetData(
                filter: selectedFilterItem,
                status: selectedStatusItem,
                idBranch: value!.getidBranch,
                filterjenis: selectedFilterJenisItem,
                filterIDCategory: selectedFilterCategoryItem,
              ),
            );
          },
        );
      },
    );
  }
}
