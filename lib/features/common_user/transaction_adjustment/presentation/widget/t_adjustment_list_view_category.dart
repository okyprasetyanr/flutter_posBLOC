import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/common_user/transaction_adjustment/logic/transaction_adjustment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction_adjustment/logic/transaction_adjustment_event.dart';
import 'package:flutter_pos/features/common_user/transaction_adjustment/logic/transaction_adjustment_state.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/common_widget/widget_custom_spin_kit.dart';

class TAdjustmentListViewCategory extends StatelessWidget {
  const TAdjustmentListViewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AdjustmentBloc, AdjustmentState, List<ModelCategory>?>(
      selector: (state) {
        if (state is AdjustmentLoaded) {
          return (state.dataCategory);
        }
        return null;
      },
      builder: (context, state) {
        if (state == null) {
          return customSpinKit();
        }
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppPropertyColor.black,
                AppPropertyColor.black,
                AppPropertyColor.black,
                AppPropertyColor.transparent,
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
              final category = state[index];

              return Padding(
                padding: const EdgeInsets.only(right: 7),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<AdjustmentBloc>().add(
                          AdjustmentFilterByCateogry(
                            selectedCategory: category,
                          ),
                        );
                      },
                      child:
                          BlocSelector<
                            AdjustmentBloc,
                            AdjustmentState,
                            ModelCategory?
                          >(
                            selector: (state) {
                              if (state is AdjustmentLoaded) {
                                return state.selectedFilterCategory;
                              }
                              return null;
                            },
                            builder: (context, stateSelected) {
                              if (stateSelected == null) {
                                return customSpinKit();
                              }

                              final validasiSelected =
                                  category.getidCategory ==
                                  stateSelected.getidCategory;
                              final backgroundColor = validasiSelected
                                  ? context.colorAdjustment
                                  : AppPropertyColor.greyLight;
                              final textColor = validasiSelected
                                  ? lv05TextStyleWhite
                                  : lv05TextStyle;

                              return Material(
                                borderRadius: BorderRadius.circular(5),
                                color: backgroundColor,

                                child: Padding(
                                  padding: const EdgeInsetsGeometry.all(5),
                                  child: Text(
                                    category.getnameCategory,
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
