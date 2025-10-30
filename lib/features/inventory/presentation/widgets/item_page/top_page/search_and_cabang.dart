import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UIInventorySearchAndCabang extends StatelessWidget {
  final String? selectedFilterItem;
  final String? selectedStatusItem;
  final String? selectedFilterJenisItem;
  final String? selectedFilterKategoriItem;
  const UIInventorySearchAndCabang({
    super.key,
    required this.selectedFilterItem,
    required this.selectedStatusItem,
    required this.selectedFilterJenisItem,
    required this.selectedFilterKategoriItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, top: 5),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              style: lv1TextStyle,
              decoration: InputDecoration(
                isDense: true,
                labelText: "Search...",
                hintText: "...",
                labelStyle: lv1TextStyle,
                hintStyle: lv1TextStyle,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                context.read<InventoryBloc>().add(InvSearchitem(text: value));
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child:
                BlocSelector<
                  InventoryBloc,
                  InventoryState,
                  (List<ModelBranch>, String?)
                >(
                  selector: (state) {
                    if (state is InventoryLoaded) {
                      return (state.datacabang, state.selectedIdBranch);
                    }
                    return ([], "");
                  },
                  builder: (context, state) {
                    if (state.$1.isEmpty) {
                      return const SpinKitThreeBounce(
                        color: Colors.blue,
                        size: 30.0,
                      );
                    }
                    return DropdownButtonFormField<ModelBranch>(
                      style: lv05TextStyle,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        label: Text("Pilih Cabang", style: lv1TextStyle),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      initialValue: state.$1.firstWhere(
                        (data) => data.getidBranch == state.$2,
                      ),
                      items: state.$1
                          .map(
                            (map) => DropdownMenuItem(
                              value: map,
                              child: Text(
                                map.getareaBranch,
                                style: lv05TextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        String idBranch = value!.getidBranch;
                        context.read<InventoryBloc>().add(
                          InvGetData(
                            idBranch: idBranch,
                            filter: selectedFilterItem!,
                            status: selectedStatusItem!,
                            filterjenis: selectedFilterJenisItem!,
                            filterIDKategori: selectedFilterKategoriItem!,
                          ),
                        );
                      },
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}
