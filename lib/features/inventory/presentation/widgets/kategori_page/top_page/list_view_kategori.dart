import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListViewKategori extends StatelessWidget {
  const ListViewKategori({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      InventoryBloc,
      InventoryState,
      (List<ModelCategory>?, String?)
    >(
      selector: (state) => state is InventoryLoaded
          ? (state.dataKategori, state.selectedIdBranch)
          : (null, null),
      builder: (context, state) {
        if (state.$1 == null) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: const SpinKitThreeBounce(color: Colors.blue, size: 15.0),
          );
        }
        final dataKategori = state.$1!
            .where((data) => data.getidBranch == state.$2)
            .toList();
        return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: ListView.builder(
            itemCount: dataKategori.length,
            itemBuilder: (context, index) {
              return ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [0, 0.02, 0.98, 1],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: Material(
                  color: index % 2 == 0
                      ? const Color.fromARGB(255, 235, 235, 235)
                      : const Color.fromARGB(255, 221, 221, 221),
                  child: InkWell(
                    onTap: () {
                      context.read<InventoryBloc>().add(
                        InvSelectedKategori(
                          selectedKategori: dataKategori[index],
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                        top: 10,
                        bottom: 10,
                      ),

                      child: Text(
                        dataKategori[index].getnameCategory,
                        style: lv1TextStyle,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
