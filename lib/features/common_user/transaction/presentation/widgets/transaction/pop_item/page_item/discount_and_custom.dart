import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';

class UITransactionPopUpDiscountAndCustom extends StatefulWidget {
  const UITransactionPopUpDiscountAndCustom({super.key});

  @override
  State<UITransactionPopUpDiscountAndCustom> createState() =>
      _UITransactionPopUpDiscountAndCustomState();
}

class _UITransactionPopUpDiscountAndCustomState
    extends State<UITransactionPopUpDiscountAndCustom> {
  TextEditingController customDiscountController = TextEditingController();

  @override
  void dispose() {
    customDiscountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Diskon:", style: lv05TextStyle),
          Center(
            child: BlocSelector<TransactionBloc, TransactionState, int?>(
              selector: (state) {
                if (state is TransactionLoaded && state.selectedItem != null) {
                  return state.selectedItem!.getdiscountItem;
                }
                return null;
              },
              builder: (context, state) {
                if (state == null) {
                  return SizedBox.shrink();
                }
                final diskonList = [10, 25, 50];
                return Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: diskonList.map((diskon) {
                    final isSelected = state == diskon;
                    return ElevatedButton.icon(
                      onPressed: () {
                        if (customDiscountController.text.isNotEmpty) {
                          customDiscountController.clear();
                        }

                        context.read<TransactionBloc>().add(
                          TransactionAdjustItem(discount: diskon),
                        );
                      },
                      icon: Icon(Icons.check_rounded, size: lv1IconSize),
                      label: Text(
                        "$diskon%",
                        style: isSelected ? lv05TextStyleWhite : lv05TextStyle,
                      ),
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                        padding: const WidgetStatePropertyAll(
                          EdgeInsets.all(7),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          isSelected ? AppPropertyColor.primary : Colors.white,
                        ),
                        iconColor: WidgetStatePropertyAll(
                          isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            child: BlocListener<TransactionBloc, TransactionState>(
              listenWhen: (previous, current) =>
                  previous is TransactionLoaded &&
                  current is TransactionLoaded &&
                  previous.selectedItem?.getdiscountItem !=
                      current.selectedItem?.getdiscountItem,
              listener: (context, state) {
                if (state is TransactionLoaded) {
                  if (state.selectedItem == null) {
                    customDiscountController.clear();
                  } else {
                    customDiscountController.text =
                        "${state.selectedItem!.getdiscountItem}";
                  }
                }
              },
              child: TextField(
                controller: customDiscountController,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                style: lv05TextStyle,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(10),
                  suffixText: "%",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelText: "Ubah Diskon",
                  labelStyle: lv05TextStyle,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    final customDiscount = newValue.text;
                    final intValue =
                        int.tryParse(
                          customDiscount.isEmpty ? "0" : customDiscount,
                        ) ??
                        0;
                    if (intValue > 100) {
                      customSnackBar(context, "Jumlah melebihi 100%");
                      return oldValue;
                    }
                    context.read<TransactionBloc>().add(
                      TransactionAdjustItem(
                        discount: customDiscount.isEmpty ? 0 : intValue,
                      ),
                    );
                    return newValue;
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
