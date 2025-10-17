import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UIInventoryDropdownCabang extends StatelessWidget {
  final String selectedFilterItem;
  final String selectedStatusItem;
  final String selectedFilterJenisItem;
  final String selectedFilterKategoriItem;
  const UIInventoryDropdownCabang({
    super.key,
    required this.selectedFilterItem,
    required this.selectedStatusItem,
    required this.selectedFilterJenisItem,
    required this.selectedFilterKategoriItem,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
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
          return const SpinKitThreeBounce(color: Colors.blue, size: 30.0);
        }
        return DropdownButtonFormField<ModelCabang>(
          style: lv1TextStyle,
          initialValue: state.$1.firstWhere(
            (data) => data.getidBranch == state.$2,
          ),
          items: state.$1
              .map(
                (map) => DropdownMenuItem(
                  value: map,
                  child: Text(map.getareaBranch),
                ),
              )
              .toList(),
          onChanged: (value) {
            context.read<InventoryBloc>().add(
              InvAmbilData(
                filter: selectedFilterItem,
                status: selectedStatusItem,
                idCabang: value!.getidBranch,
                filterjenis: selectedFilterJenisItem,
                filterIDKategori: selectedFilterKategoriItem,
              ),
            );
          },
        );
      },
    );
  }
}
