import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';

class SellPopUpDiscountAndCustomDiscount extends StatefulWidget {
  const SellPopUpDiscountAndCustomDiscount({super.key});

  @override
  State<SellPopUpDiscountAndCustomDiscount> createState() =>
      _SellPopUpDiscountAndCustomDiscountState();
}

class _SellPopUpDiscountAndCustomDiscountState
    extends State<SellPopUpDiscountAndCustomDiscount> {
  TextEditingController customDiscountController = TextEditingController();

  @override
  void dispose() {
    customDiscountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Diskon:", style: lv05TextStyle),
          BlocSelector<SellBloc, SellState, int?>(
            selector: (state) {
              if (state is SellLoaded && state.selectedItem != null) {
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
                spacing: 8,
                runSpacing: 8,
                children: diskonList.map((diskon) {
                  final isSelected = state == diskon;
                  return ElevatedButton.icon(
                    onPressed: () {
                      if (customDiscountController.text.isNotEmpty) {
                        customDiscountController.clear();
                      }

                      context.read<SellBloc>().add(
                        SellAdjustItem(discount: diskon),
                      );
                    },
                    icon: const Icon(Icons.check_rounded),
                    label: Text(
                      "$diskon%",
                      style: isSelected ? lv05TextStyleWhite : lv05TextStyle,
                    ),
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                      backgroundColor: WidgetStatePropertyAll(
                        isSelected ? AppColor.primary : Colors.white,
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
          const SizedBox(height: 5),
          SizedBox(
            child: TextField(
              controller: customDiscountController,
              textAlign: TextAlign.right,
              keyboardType: TextInputType.number,
              style: lv05TextStyle,
              decoration: InputDecoration(
                suffixText: "%",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                labelText: "Custom Disc",
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
                  context.read<SellBloc>().add(
                    SellAdjustItem(
                      discount: customDiscount.isEmpty ? 0 : intValue,
                    ),
                  );
                  return newValue;
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
