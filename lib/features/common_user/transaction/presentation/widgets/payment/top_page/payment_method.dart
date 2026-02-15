import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_state.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/payment/top_page/cash_payment.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/payment/top_page/debit_payment.dart';
import 'package:flutter_pos/function/bottom_sheet.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

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
    return Center(
      child: BlocSelector<PaymentBloc, PaymentState, ModelTransaction?>(
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
            children: LabelPaymentMethod.values.asMap().entries.map((entry) {
              final index = entry.key;
              final paymentMethod = entry.value;
              final isSelected = state.getpaymentMethod == paymentMethod;
              return customButtonIcon(
                backgroundColor: isSelected
                    ? AppPropertyColor.primary
                    : AppPropertyColor.white,
                icon: Icon(
                  Icons.payment_outlined,
                  size: lv1IconSize,
                  color: isSelected
                      ? AppPropertyColor.white
                      : AppPropertyColor.black,
                ),
                label: Text(
                  "${paymentMethod.name}",
                  style: isSelected ? lv05TextStyleWhite : lv05TextStyle,
                ),
                onPressed: () {
                  if (index == 3) {
                    context.read<PaymentBloc>().add(PaymentResetSplit());
                    customBottomSheet(
                      context: context,
                      resetItemForm: null,
                      content: (scrollController) => Padding(
                        padding: EdgeInsets.all(10),
                        child: ListView(
                          controller: scrollController,
                          children: [
                            Text(
                              "Pembayaran ${LabelPaymentMethod.Cash.name}",
                              style: lv1TextStyleBold,
                            ),
                            const SizedBox(width: 10),
                            UIPaymentCashPayment(
                              split: true,
                              payController: payController,
                              selectedAmount: selectedAmount,
                            ),
                            const SizedBox(height: 25),
                            Text(
                              "Pembayaran ${LabelPaymentMethod.Debit.name}",
                              style: lv1TextStyleBold,
                            ),
                            const SizedBox(width: 10),
                            UIPaymentDebitPayment(
                              split: true,
                              chargeController: chargeController,
                              payDebitController: payDebitController,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  context.read<PaymentBloc>().add(
                    PaymentAdjust(paymentMethod: paymentMethod),
                  );
                  gotoPage(index);
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
