import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/common_widget/widget_custom_icon_button_min_plus.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class PopUpNameAndQty extends StatelessWidget {
  const PopUpNameAndQty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: context.select<TransactionBloc, Color>((value) {
          final currentState = value.state;
          if (currentState is TransactionLoaded) {
            return currentState.isSell
                ? AppPropertyColor.primary
                : AppPropertyColor.secondPrimary;
          }

          return AppPropertyColor.primary;
        }),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset("assets/logo.png", height: 50),
                const SizedBox(width: 10),
                Expanded(
                  child:
                      BlocSelector<
                        TransactionBloc,
                        TransactionState,
                        (ModelItemOrdered?, String?)
                      >(
                        selector: (state) {
                          if (state is TransactionLoaded) {
                            return (state.selectedItem, state.idBranch);
                          }
                          return (null, "");
                        },
                        builder: (context, state) {
                          devLog(
                            "Log UITransaction: NameAndQty: idBranch: ${state.$2}",
                          );
                          return Text(
                            state.$1?.getnameItem ?? "",
                            style: lv1TextStyleWhiteBold,
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text("Jumlah:", style: lv1TextStyleWhite),
              BlocSelector<TransactionBloc, TransactionState, double?>(
                selector: (state) {
                  if (state is TransactionLoaded) {
                    return state.selectedItem?.getqtyItem;
                  }
                  return null;
                },
                builder: (context, state) {
                  if (state == null) {
                    return SizedBox.shrink();
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customIconButtonMinPlus(
                        isIncrement: false,
                        onPressed: () => context.read<TransactionBloc>().add(
                          TransactionAdjustItem(mode: false),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: customButton(
                          onPressed: () {
                            final TextEditingController controller =
                                TextEditingController();
                            final bloc = context.read<TransactionBloc>();
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Input Angka"),
                                  content: TextField(
                                    controller: controller,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: "Masukkan angka",
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("Batal"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        bloc.add(
                                          TransactionAdjustItem(
                                            qty: double.tryParse(
                                              controller.text,
                                            ),
                                          ),
                                        );
                                        Navigator.pop(context, controller.text);
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            formatQtyOrPrice(state),
                            style: lv1TextStyleBold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      customIconButtonMinPlus(
                        isIncrement: true,
                        onPressed: () => context.read<TransactionBloc>().add(
                          TransactionAdjustItem(mode: true),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
