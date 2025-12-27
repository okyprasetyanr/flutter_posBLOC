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

  final Function({
    FilterItem filter,
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
            child: WidgetDropDownFilter(
              initialValue: context.select<InventoryBloc, FilterItem>((value) {
                final blocurrentState = value.state;
                if (blocurrentState is InventoryLoaded) {
                  return blocurrentState.filterItem;
                }
                return FilterItem.A_Z;
              }),
              filters: filters,
              text: "Pilih Filter",
              extension: (extension) => extension.label,
              selectedValue: (selectedEnum) {
                onFilterChangedCallBack(filter: selectedEnum);
              },
            ),
          ),

          const SizedBox(width: 10),

          // ===== CATEGORY =====
          SizedBox(
            width: 120,
            child:
                BlocSelector<
                  InventoryBloc,
                  InventoryState,
                  (List<ModelCategory>, int?)
                >(
                  selector: (state) => state is InventoryLoaded
                      ? (
                          state.filteredDataCategory,
                          state.indexFilterByCategoryItem,
                        )
                      : ([], null),
                  builder: (context, state) {
                    return DropdownButtonFormField<ModelCategory>(
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
                      initialValue: state.$2 != null
                          ? state.$1[state.$2!]
                          : null,

                      items: state.$1
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
                        if (state.$1.isEmpty) {
                          customSnackBar(
                            context,
                            "Cabang tidak memiliki Kategori",
                          );
                        }
                      },
                      onChanged: (value) {
                        if (value == null) return;
                        onFilterChangedCallBack(
                          filterIDCategory: state.$1.indexOf(value),
                        );
                      },
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
              initialValue: context.select<InventoryBloc, StatusData>((value) {
                final blocurrentState = value.state;
                if (blocurrentState is InventoryLoaded) {
                  return blocurrentState.statusItem;
                }
                return StatusData.Aktif;
              }),
              filters: statusItem,
              text: "Pilih Status",
              selectedValue: (selectedEnum) {
                onFilterChangedCallBack(status: selectedEnum);
              },
            ),
          ),
        ],
      ),
    );
  }
}
