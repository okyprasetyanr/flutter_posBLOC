import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/model_data/model_category.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_spin_kit.dart';

class UITransactionListViewCategory extends StatelessWidget {
  const UITransactionListViewCategory({super.key});

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
                                return state.selectedCategory;
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
                                  ? AppColor.primary
                                  : Colors.grey.shade200;
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
