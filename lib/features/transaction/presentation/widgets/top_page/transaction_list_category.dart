import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/features/transaction/logic/transaction_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction_event.dart';
import 'package:flutter_pos/features/transaction/logic/transaction_state.dart';
import 'package:flutter_pos/features/inventory/model/model_category.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_spin_kit.dart';

class TransactionListCategory extends StatelessWidget {
  const TransactionListCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      TransactionBloc,
      TransactionState,
      List<ModelCategory>?
    >(
      selector: (state) {
        if (state is TransactionLoaded) {
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
                        context.read<TransactionBloc>().add(
                          TransactionSelectedCategoryItem(
                            selectedCategory: category,
                          ),
                        );
                      },
                      child:
                          BlocSelector<
                            TransactionBloc,
                            TransactionState,
                            ModelCategory?
                          >(
                            selector: (state) {
                              if (state is TransactionLoaded) {
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
                                  ? context.colorTrans
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
