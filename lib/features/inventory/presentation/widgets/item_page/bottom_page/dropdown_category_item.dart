import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DropdownCategoryItem extends StatelessWidget {
  final ValueNotifier<String?> idCategory;
  const DropdownCategoryItem({super.key, required this.idCategory});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      InventoryBloc,
      InventoryState,
      (List<ModelCategory>, String?)
    >(
      selector: (state) {
        if (state is InventoryLoaded) {
          return (
            state.dataCategory,
            state.dataSelectedItem?.getidCategoryiItem,
          );
        }
        return ([], null);
      },
      builder: (context, state) {
        if (state.$1.isEmpty) {
          return const SpinKitThreeBounce(color: Colors.blue, size: 15.0);
        }
        if (state.$2 != null) {
          idCategory.value = state.$2!;
        }
        return DropdownButtonFormField<ModelCategory?>(
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 5,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
            label: Text("Pilih Status", style: lv1TextStyle),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          initialValue: state.$2 != null
              ? state.$1.firstWhere(
                  (element) => element.getidCategory == state.$2,
                )
              : null,
          hint: Text("Kategori...", style: lv05TextStyle),
          items: state.$1
              .map(
                (map) => DropdownMenuItem<ModelCategory>(
                  value: map,
                  child: Text(map.getnameCategory, style: lv05TextStyle),
                ),
              )
              .toList(),
          onChanged: (value) {
            idCategory.value = value!.getidCategory;
          },
        );
      },
    );
  }
}
