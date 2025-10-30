import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DropdownKategoriItem extends StatelessWidget {
  const DropdownKategoriItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      InventoryBloc,
      InventoryState,
      (List<ModelKategori>?, ModelKategori?)
    >(
      selector: (state) {
        if (state is InventoryLoaded) {
          return (state.dataKategori, state.dataSelectedKategoriItem);
        }
        return (null, null);
      },
      builder: (contextBloc, stateBLoc) {
        if (stateBLoc.$1 == null) {
          return const SpinKitThreeBounce(color: Colors.blue, size: 30.0);
        }
        final blocState = contextBloc.read<InventoryBloc>().state;
        final idBranch = blocState is InventoryLoaded
            ? blocState.selectedIdBranch
            : "";
        final initselection = stateBLoc.$2 != null
            ? stateBLoc.$1!.firstWhere((element) {
                return element.getidCategory == stateBLoc.$2!.getidCategory;
              })
            : null;
        debugPrint("Log UIInventory initselection: $initselection");
        return DropdownButtonFormField<ModelKategori?>(
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
          initialValue: initselection,
          hint: Text("Kategori...", style: lv05TextStyle),
          items: stateBLoc.$1!
              .where((data) => data.getidBranch == idBranch)
              .map(
                (map) => DropdownMenuItem<ModelKategori>(
                  value: map,
                  child: Text(map.getnameCategory, style: lv05TextStyle),
                ),
              )
              .toList(),
          onChanged: (value) {
            context.read<InventoryBloc>().add(
              InvSelectedKategoriItem(dataKategoriItem: value),
            );
          },
        );
      },
    );
  }
}
