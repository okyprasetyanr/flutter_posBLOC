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
  final List<ModelKategori> filterkategori;

  final String? selectedFilterItem;
  final String? selectedStatusItem;
  final String? selectedFilterJenisItem;
  final String? selectedFilterKategoriItem;

  final Function({
    required String filter,
    required String status,
    required String filterjenis,
    required String filterIDKategori,
  })
  onFilterChangedCallBack;

  const UIFiltersItem({
    super.key,
    required this.filters,
    required this.statusItem,
    required this.filterjenis,
    required this.filterkategori,
    required this.selectedFilterItem,
    required this.selectedStatusItem,
    required this.selectedFilterJenisItem,
    required this.selectedFilterKategoriItem,
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
                  filterIDKategori: selectedFilterKategoriItem ?? "",
                );
              },
            ),
          ),

          const SizedBox(width: 10),

          // ===== KATEGORI =====
          SizedBox(
            width: 120,
            child: DropdownButtonFormField<ModelKategori>(
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
              initialValue: filterkategori.firstWhere(
                (data) => data.getidCategory == selectedFilterKategoriItem,
                orElse: () => filterkategori.first,
              ),
              items: filterkategori
                  .where(
                    (data) =>
                        data.getidBranch == "0" ||
                        data.getidBranch ==
                            (context.read<InventoryBloc>().state
                                    as InventoryLoaded)
                                .idCabang,
                  )
                  .map(
                    (map) => DropdownMenuItem<ModelKategori>(
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
                if (filterkategori.isEmpty) {
                  customSnackBar(context, "Cabang tidak memiliki Kategori");
                }
              },
              onChanged: (value) {
                if (value == null) return;
                onFilterChangedCallBack(
                  filter: selectedFilterItem ?? "",
                  status: selectedStatusItem ?? "",
                  filterjenis: selectedFilterJenisItem ?? "",
                  filterIDKategori: value.getidCategory,
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
                  filterIDKategori: selectedFilterKategoriItem ?? "",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
