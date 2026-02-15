import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UITransactionPopUpPriceAndCustom extends StatelessWidget {
  final bool forSell;
  final String labelPrice;
  final TextEditingController controller;
  final ValueNotifier<bool> editPrice;
  final Function({required double? value}) onChange;
  const UITransactionPopUpPriceAndCustom({
    super.key,
    required this.editPrice,
    required this.forSell,
    required this.labelPrice,
    required this.onChange,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelPrice, style: lv05TextStyle),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: customButtonIcon(
                  rightIcon: true,
                  backgroundColor: AppPropertyColor.white,
                  icon: const Icon(Icons.edit, color: AppPropertyColor.black),
                  label:
                      BlocSelector<
                        TransactionBloc,
                        TransactionState,
                        ModelItemOrdered?
                      >(
                        selector: (state) {
                          if (state is TransactionLoaded &&
                              state.selectedItem != null) {
                            return state.selectedItem;
                          }
                          return null;
                        },
                        builder: (context, state) {
                          debugPrint(
                            "Log UISell: BlocSelector Harga value: $state",
                          );
                          return Text(
                            formatPriceRp(
                              forSell
                                  ? state?.getpriceItemFinal ?? 0
                                  : state?.getpriceItemBuy ?? 0,
                            ),
                            style: lv05TextStyle,
                          );
                        },
                      ),
                  onPressed: () {
                    editPrice.value = !editPrice.value;
                  },
                ),
              ),
              SizedBox(
                height: 40,
                width: 120,
                child: Stack(
                  children: [
                    ValueListenableBuilder<bool>(
                      valueListenable: editPrice,
                      builder: (context, valueEditPrie, child) {
                        return AnimatedPositioned(
                          bottom: 0,
                          top: valueEditPrie ? 0 : -80,
                          left: 0,
                          right: 0,
                          duration: Duration(milliseconds: 500),
                          child: SizedBox(
                            width: 200,
                            child:
                                BlocListener<TransactionBloc, TransactionState>(
                                  listenWhen: (previous, current) =>
                                      previous is TransactionLoaded &&
                                      current is TransactionLoaded &&
                                      previous.selectedItem !=
                                          current.selectedItem,
                                  listener: (context, state) {
                                    if (state is TransactionLoaded &&
                                        state.selectedItem == null) {
                                      controller.clear();
                                    }
                                  },
                                  child: customTextField(
                                    context: context,
                                    hint: false,
                                    alignEnd: true,
                                    inputType: TextInputType.number,
                                    controller: controller,
                                    onChanged: (value) {
                                      debugPrint(
                                        "Log UISell: cek BlocSelector Harga",
                                      );
                                      onChange(
                                        value: value.isNotEmpty
                                            ? double.tryParse(value)
                                            : 0,
                                      );
                                    },
                                    text: "Ubah Harga:",
                                    suffixText: ",00",
                                  ),
                                ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
