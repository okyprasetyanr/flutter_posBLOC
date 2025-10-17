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
      padding: EdgeInsets.only(right: 5),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextFormField(
              style: lv1TextStyle,
              decoration: InputDecoration(
                labelText: "Search...",
                hintText: "...",
                labelStyle: lv1TextStyle,
                hintStyle: lv1TextStyle,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: (value) {
                context.read<InventoryBloc>().add(InvSearchitem(text: value));
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child:
                BlocSelector<
                  InventoryBloc,
                  InventoryState,
                  (List<ModelCabang> data, String? selectedIDCabang)
                >(
                  selector: (state) {
                    if (state is InventoryLoaded) {
                      return (state.datacabang, state.idCabang);
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
                    return DropdownButtonFormField<ModelCabang>(
                      decoration: InputDecoration(
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
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        String idCabang = value!.getidBranch;
                        context.read<InventoryBloc>().add(
                          InvAmbilData(
                            idCabang: idCabang,
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
