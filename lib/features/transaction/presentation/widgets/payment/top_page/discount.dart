import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/transaction/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/transaction/logic/payment/payment_state.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';

class UIPaymentDiscount extends StatelessWidget {
  final TextEditingController customDiscountController;
  const UIPaymentDiscount({super.key, required this.customDiscountController});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PaymentBloc, PaymentState, ModelTransaction?>(
      selector: (state) {
        if (state is PaymentLoaded) {
          return state.transaction_sell;
        }
        return null;
      },
      builder: (context, state) {
        if (state == null) {
          return SizedBox.shrink();
        }
        return Row(
          children: [
            SizedBox(width: 100, child: Text("Diskon", style: lv1TextStyle)),
            Text(":", style: lv1TextStyle),
            Spacer(),
            Row(
              children: [
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [10, 25, 50].map((discount) {
                    final isSelected = state.getdiscount == discount;
                    return ElevatedButton.icon(
                      onPressed: () {
                        if (customDiscountController.text.isNotEmpty) {
                          customDiscountController.clear();
                        }
                        final discountValue = isSelected ? 0 : discount;
                        context.read<PaymentBloc>().add(
                          PaymentAdjust(discount: discountValue),
                        );
                      },
                      icon: const Icon(Icons.check_rounded, size: 15),
                      label: Text(
                        "$discount%",
                        style: isSelected ? lv05TextStyleWhite : lv05TextStyle,
                      ),
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                        ),
                        minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                        padding: const WidgetStatePropertyAll(
                          EdgeInsets.all(7),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          isSelected ? AppColor.primary : Colors.white,
                        ),
                        iconColor: WidgetStatePropertyAll(
                          isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: 50,
              child: TextField(
                controller: customDiscountController,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                style: lv05TextStyle,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  suffixText: "%",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelText: "Diskon",
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
                    context.read<PaymentBloc>().add(
                      PaymentAdjust(discount: intValue),
                    );
                    return newValue;
                  }),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
