import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/common_widget/widget_custom_dropdown_filter.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';

class UIFiltersItem extends StatelessWidget {
  final List<FilterItem> filters;
  final List<StatusData> statusItem;
  final List<FilterTypeItem> filterType;
  final List<ModelCategory> filterCategory;

  final Function({
    int filter,
    StatusData status,
    FilterTypeItem filterType,
    int filterIDCategory,
  })
  onFilterChangedCallBack;

  const UIFiltersItem({
    super.key,
    required this.filters,
    required this.statusItem,
    required this.filterType,
    required this.filterCategory,
    required this.onFilterChangedCallBack,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.select<InventoryBloc, Enum>;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          // ===== FILTER ITEM =====
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: WidgetDropDownFilter(
              initialValue: bloc((value) {
                final blocurrentState = value.state;
                if (blocurrentState is InventoryLoaded) {
                  return blocurrentState.filterItem;
                }
                return FilterItem.A_Z;
              }),
              filters: filters,
              text: "Pilih Filter",
              selectedValue: (selectedEnum) {
                onFilterChangedCallBack(filter: selectedEnum);
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
              initialValue: () {
                final index = bloc((value) {
                  final s = value.state;
                  if (s is InventoryLoaded) {
                    return s.indexFilterByCategoryItem;
                  }
                  return 0;
                });

                if (index < 0 || index >= filterCategory.length) {
                  return filterCategory[0];
                }

                return filterCategory[index];
              }(),

              items: filterCategory
                  .where(
                    (data) =>
                        data.getidBranch == "0" ||
                        data.getidBranch ==
                            (context.read<InventoryBloc>().state
                                    as InventoryLoaded)
                                .idBranch,
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
                  filterIDCategory: filterCategory.indexOf(value),
                );
              },
            ),
          ),

          const SizedBox(width: 10),

          // ===== STATUS ITEM =====
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: WidgetDropDownFilter(
              initialValue: bloc((value) {
                final blocurrentState = value.state;
                if (blocurrentState is InventoryLoaded) {
                  return blocurrentState.statusItem;
                }
                return StatusData.Aktif;
              }),
              filters: statusItem,
              text: "Pilih Status",
              onChanged: (value) => onFilterChangedCallBack(status: value),
            ),

            //  DropdownButtonFormField<String>(
            //   decoration: InputDecoration(
            //     isDense: true,
            //     contentPadding: const EdgeInsets.symmetric(vertical: 4),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(6),
            //     ),
            //     label: Text("Pilih Status", style: lv1TextStyle),
            //     floatingLabelBehavior: FloatingLabelBehavior.always,
            //   ),
            //   initialValue:
            //       statusItem[bloc((value) {
            //         final blocurrentState = value.state;
            //         if (blocurrentState is InventoryLoaded) {
            //           return blocurrentState.statusItem;
            //         }
            //         return 0;
            //       })],
            //   items: statusItem
            //       .map(
            //         (map) => DropdownMenuItem(
            //           value: map,
            //           child: Text(map, style: lv05TextStyle),
            //         ),
            //       )
            //       .toList(),
            //   onChanged: (value) {
            //     if (value == null) return;
            //     onFilterChangedCallBack(status: statusItem.indexOf(value));
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}
