import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/shared/helper/enum_and_string/enum.dart';
import 'package:flutter_pos/features/transaction_payment/logic/payment_bloc.dart';
import 'package:flutter_pos/features/transaction_payment/logic/payment_event.dart';
import 'package:flutter_pos/features/transaction_payment/logic/payment_state.dart';
import 'package:flutter_pos/features/transaction_payment/presentation/widget/t_payment_cash.dart';
import 'package:flutter_pos/features/transaction_payment/presentation/widget/t_payment_debit.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_bottom_sheet.dart';
import 'package:flutter_pos/features/transaction/model/model_transaction.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class TPaymentMethod extends StatelessWidget {
  final Function(int) gotoPage;
  final TextEditingController chargeController;
  final TextEditingController payController;
  final TextEditingController payDebitController;
  final ValueNotifier<double> selectedAmount;
  const TPaymentMethod({
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
                    ? context.colorTrans
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
                      content: (scrollController) => BlocProvider.value(
                        value: context.read<PaymentBloc>(),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListView(
                            controller: scrollController,
                            children: [
                              Text(
                                "Pembayaran ${LabelPaymentMethod.Cash.name}",
                                style: lv1TextStyleBold,
                              ),
                              const SizedBox(width: 10),
                              TPaymentCash(
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
                              TPaymentDebit(
                                split: true,
                                chargeController: chargeController,
                                payDebitController: payDebitController,
                              ),
                            ],
                          ),
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
