import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_state.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';

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
            SizedBox(width: 100, child: Text("Diskon", style: lv05TextStyle)),
            Spacer(),
            Text(":", style: lv05TextStyle),
            Spacer(),
            Row(
              children: [
                Wrap(
                  spacing: 5,
                  children: [10, 25, 50].map((discount) {
                    final isSelected = state.getdiscount == discount;
                    return customButtonIcon(
                      backgroundColor: isSelected
                          ? AppPropertyColor.primary
                          : AppPropertyColor.white,
                      icon: Icon(
                        Icons.check_rounded,
                        size: lv05IconSize,
                        color: isSelected
                            ? AppPropertyColor.white
                            : AppPropertyColor.black,
                      ),
                      label: Text(
                        "$discount%",
                        style: isSelected ? lv05TextStyleWhite : lv05TextStyle,
                      ),
                      onPressed: () {
                        if (customDiscountController.text.isNotEmpty) {
                          customDiscountController.clear();
                        }
                        final discountValue = isSelected ? 0 : discount;
                        context.read<PaymentBloc>().add(
                          PaymentAdjust(discount: discountValue),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: 50,
              child: customTextField(
                hint: false,
                controller: customDiscountController,
                inputType: const TextInputType.numberWithOptions(),
                text: "Dis.",
                suffixText: "%",
                inputFormatter: [
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
                alignEnd: true,
                context: context,
              ),
            ),
          ],
        );
      },
    );
  }
}
