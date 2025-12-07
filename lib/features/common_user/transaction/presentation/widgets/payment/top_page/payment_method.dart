import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_state.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/payment/top_page/cash_payment.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/payment/top_page/debit_payment.dart';
import 'package:flutter_pos/function/bottom_sheet.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class UIPaymentPaymentMethod extends StatelessWidget {
  final Function(int) gotoPage;
  final TextEditingController chargeController;
  final TextEditingController payController;
  final TextEditingController payDebitController;
  final ValueNotifier<double> selectedAmount;
  const UIPaymentPaymentMethod({
    super.key,
    required this.gotoPage,
    required this.chargeController,
    required this.payController,
    required this.payDebitController,
    required this.selectedAmount,
  });

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
                if (index == 3) {
                  context.read<PaymentBloc>().add(PaymentResetSplit());
                  customBottomSheet(
                    context: context,
                    resetItemForm: null,
                    content: (scrollController) => Column(
                      children: [
                        Text("Cash", style: lv05TextStyleBold),
                        Expanded(
                          child: UIPaymentCashPayment(
                            split: true,
                            payController: payController,
                            selectedAmount: selectedAmount,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("Debit", style: lv05TextStyleBold),
                        UIPaymentDebitPayment(
                          split: true,
                          chargeController: chargeController,
                          payDebitController: payDebitController,
                        ),
                      ],
                    ),
                  );
                }
                context.read<PaymentBloc>().add(
                  PaymentAdjust(paymentMethod: paymentMethod),
                );
                gotoPage(index);
              },
              icon: Icon(Icons.payment_outlined, size: lv1IconSize),
              label: Text(
                "$paymentMethod",
                style: isSelected ? lv05TextStyleWhite : lv05TextStyle,
              ),
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
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
