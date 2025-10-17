import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UISellListViewKategori extends StatelessWidget {
  const UISellListViewKategori({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SellBloc, SellState, List<ModelKategori>?>(
      selector: (state) {
        if (state is SellLoaded) {
          return (state.dataCategory);
        }
        return null;
      },
      builder: (context, state) {
        if (state == null) {
          return const SpinKitThreeBounce(color: Colors.blue, size: 30.0);
        }
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black,
                Colors.black,
                Colors.black,
                Colors.transparent,
              ],
              stops: [0, 0.02, 0.98, 1],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: state.length,
            itemBuilder: (context, index) {
              final kategori = state[index];

              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<SellBloc>().add(
                          SellSelectedKategoriItem(selectedKategori: kategori),
                        );
                      },
                      child: BlocSelector<SellBloc, SellState, ModelKategori?>(
                        selector: (state) {
                          if (state is SellLoaded) {
                            return state.selectedKategori;
                          }
                          return null;
                        },
                        builder: (context, stateSelected) {
                          if (stateSelected == null) {
                            return const SpinKitThreeBounce(
                              color: Colors.blue,
                              size: 30.0,
                            );
                          }

                          final validasiSelected =
                              kategori.getidCategory ==
                              stateSelected.getidCategory;
                          final backgroundColor = validasiSelected
                              ? AppColor.primary
                              : Colors.grey.shade200;
                          final textColor = validasiSelected
                              ? lv05TextStyleWhite
                              : lv05TextStyle;

                          return Material(
                            borderRadius: BorderRadius.circular(15),
                            color: backgroundColor,

                            child: Padding(
                              padding: EdgeInsetsGeometry.all(5),
                              child: Text(
                                kategori.getnameCategory,
                                style: textColor,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
