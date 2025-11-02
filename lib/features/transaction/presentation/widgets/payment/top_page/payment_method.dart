import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/transaction/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/transaction/logic/payment/payment_state.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class UIPaymentPaymentMethod extends StatelessWidget {
  final Function(int) gotoPage;
  const UIPaymentPaymentMethod({super.key, required this.gotoPage});

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
        return Wrap(
          spacing: 15,
          runSpacing: 5,
          children: ["Cash", "Debit", "QRIS", "Split"].asMap().entries.map((
            entry,
          ) {
            final index = entry.key;
            final paymentMethod = entry.value;
            final isSelected = state.getpaymentMethod == paymentMethod;
            return ElevatedButton.icon(
              onPressed: () {
                gotoPage(index);
                context.read<PaymentBloc>().add(
                  PaymentAdjust(paymentMethod: paymentMethod),
                );
              },
              icon: const Icon(Icons.payment_outlined, size: 15),
              label: Text(
                "$paymentMethod",
                style: isSelected ? lv05TextStyleWhite : lv05TextStyle,
              ),
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
                minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                padding: const WidgetStatePropertyAll(EdgeInsets.all(7)),
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
    );
  }
}
