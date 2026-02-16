import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_list_gradient.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UIInventoryListViewCategory extends StatelessWidget {
  const UIInventoryListViewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<InventoryBloc, InventoryState, List<ModelCategory>?>(
      selector: (state) => state is InventoryLoaded ? state.dataCategory : null,
      builder: (context, state) {
        debugPrint("Log UIInventory category: search: ${state}");
        if (state == null) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SpinKitThreeBounce(
              color: AppPropertyColor.primary,
              size: lv1IconSize,
            ),
          );
        }
        return customListGradient(
          data: state,
          deleteData: (deleteData) => context.read<InventoryBloc>().add(
            InventoryDeleteCategory(id: deleteData.getidCategory),
          ),
          getId: (data) => data.getidCategory,
          getName: (data) => data.getnameCategory,
          selectedData: (selectedData) => context.read<InventoryBloc>().add(
            InventorySelectedCategory(selectedCategory: selectedData),
          ),
        );
      },
    );
  }
}
