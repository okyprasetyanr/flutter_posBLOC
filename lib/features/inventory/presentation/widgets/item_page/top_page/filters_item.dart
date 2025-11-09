import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';

class UIFiltersItem extends StatelessWidget {
  final List<String> filters;
  final List<String> statusItem;
  final List<String> filterjenis;
  final List<ModelCategory> filterCategory;

  final String? selectedFilterItem;
  final String? selectedStatusItem;
  final String? selectedFilterJenisItem;
  final String? selectedFilterCategoryItem;

  final Function({
    required String filter,
    required String status,
    required String filterjenis,
    required String filterIDCategory,
  })
  onFilterChangedCallBack;

  const UIFiltersItem({
    super.key,
    required this.filters,
    required this.statusItem,
    required this.filterjenis,
    required this.filterCategory,
    required this.selectedFilterItem,
    required this.selectedStatusItem,
    required this.selectedFilterJenisItem,
    required this.selectedFilterCategoryItem,
    required this.onFilterChangedCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          // ===== FILTER ITEM =====
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: DropdownButtonFormField<String>(
              style: lv05TextStyle,
              decoration: InputDecoration(
                label: Text("Pilih Filter", style: lv1TextStyle),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              initialValue: selectedFilterItem,
              items: filters
                  .map(
                    (map) => DropdownMenuItem(
                      value: map,
                      child: Text(
                        map,
                        style: lv05TextStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                onFilterChangedCallBack(
                  filter: value,
                  status: selectedStatusItem ?? "",
                  filterjenis: selectedFilterJenisItem ?? "",
                  filterIDCategory: selectedFilterCategoryItem ?? "",
                );
              },
            ),
          ),

          const SizedBox(width: 10),

          // ===== KATEGORI =====
          SizedBox(
            width: 120,
            child: DropdownButtonFormField<ModelCategory>(
              style: lv05TextStyle,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                label: Text("Pilih Kategori", style: lv1TextStyle),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              initialValue: filterCategory.firstWhere(
                (data) => data.getidCategory == selectedFilterCategoryItem,
                orElse: () => filterCategory.first,
              ),
              items: filterCategory
                  .where(
                    (data) =>
                        data.getidBranch == "0" ||
                        data.getidBranch ==
                            (context.read<InventoryBloc>().state
                                    as InventoryLoaded)
                                .selectedIdBranch,
                  )
                  .map(
                    (map) => DropdownMenuItem<ModelCategory>(
                      value: map,
                      child: Text(
                        map.getnameCategory,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  )
                  .toList(),
              onTap: () {
                if (filterCategory.isEmpty) {
                  customSnackBar(context, "Cabang tidak memiliki Kategori");
                }
              },
              onChanged: (value) {
                if (value == null) return;
                onFilterChangedCallBack(
                  filter: selectedFilterItem ?? "",
                  status: selectedStatusItem ?? "",
                  filterjenis: selectedFilterJenisItem ?? "",
                  filterIDCategory: value.getidCategory,
                );
              },
            ),
          ),

          const SizedBox(width: 10),

          // ===== STATUS ITEM =====
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                label: Text("Pilih Status", style: lv1TextStyle),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              initialValue: selectedStatusItem,
              items: statusItem
                  .map(
                    (map) => DropdownMenuItem(
                      value: map,
                      child: Text(map, style: lv05TextStyle),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                onFilterChangedCallBack(
                  filter: selectedFilterItem ?? "",
                  status: value,
                  filterjenis: selectedFilterJenisItem ?? "",
                  filterIDCategory: selectedFilterCategoryItem ?? "",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
