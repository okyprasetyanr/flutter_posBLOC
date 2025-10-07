import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListViewKategori extends StatelessWidget {
  const ListViewKategori({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      InventoryBloc,
      InventoryState,
      (List<ModelKategori>? data, String? selectedIDCabang)
    >(
      selector: (state) => state is InventoryLoaded
          ? (state.dataKategori, state.idCabang)
          : (null, null),
      builder: (context, state) {
        if (state.$1 == null) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: const SpinKitThreeBounce(color: Colors.blue, size: 30.0),
          );
        }
        final dataKategori = state.$1!
            .where((data) => data.getidCabang == state.$2)
            .toList();
        return Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
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
                      padding: EdgeInsets.only(
                        left: 5,
                        right: 5,
                        top: 10,
                        bottom: 10,
                      ),

                      child: Text(
                        dataKategori[index].getnamaKategori,
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
