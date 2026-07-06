import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/shared/helper/enum_and_string/enum.dart';
import 'package:flutter_pos/features/transaction_payment/logic/payment_bloc.dart';
import 'package:flutter_pos/features/transaction_payment/logic/payment_event.dart';
import 'package:flutter_pos/features/transaction_payment/logic/payment_state.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/transaction/model/model_split.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class TPaymentCash extends StatelessWidget {
  final bool split;
  final TextEditingController payController;
  final ValueNotifier<double> selectedAmount;

  const TPaymentCash({
    super.key,
    required this.split,
    required this.payController,
    required this.selectedAmount,
  });

  List<double> _generateQuickPayOptions(double total) {
    if (total <= 0) return const [];

    List<double> options = [];

    options.add(total);

    if (total < 20000 && !options.contains(20000)) {
      options.add(20000.0);
    }

    if (total < 50000 && !options.contains(50000)) {
      options.add(50000.0);
    } else if (total < 75000 && !options.contains(75000)) {
      options.add(75000.0);
    }

    if (total < 100000 && !options.contains(100000)) {
      options.add(100000.0);
    }

    Set<double> uniqueOptions = options.where((o) => o >= total).toSet();
    List<double> sortedOptions = uniqueOptions.toList()..sort();

    if (sortedOptions.isNotEmpty && sortedOptions.first != total) {
      sortedOptions.remove(total);
      sortedOptions.insert(0, total);
    }

    return sortedOptions.take(4).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!split)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text('Uang diterima:', style: lv05TextStyle),
          ),
        BlocSelector<
          PaymentBloc,
          PaymentState,
          (double?, double?, List<ModelSplit>?)
        >(
          selector: (state) {
            if (state is PaymentLoaded) {
              return (
                state.transaction_sell?.gettotal,
                state.transaction_sell?.getbillPaid,
                state.transaction_sell?.getdataSplit,
              );
            }
            return (null, null, null);
          },
          builder: (context, state) {
            List<double> quickPayOptions = _generateQuickPayOptions(
              state.$1 ?? 0,
            );
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!split) {
                if (payController.text != formatQtyOrPrice(state.$2 ?? 0)) {
                  payController.text = formatQtyOrPrice(state.$2 ?? 0);
                  selectedAmount.value = state.$2 ?? 0;
                }
              } else {
                payController.text = formatQtyOrPrice(
                  state.$3
                          ?.firstWhereOrNull(
                            (element) =>
                                element.getpaymentName ==
                                LabelPaymentMethod.Cash,
                          )
                          ?.getpaymentTotal ??
                      0,
                );
              }
            });
            return !split
                ? SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: quickPayOptions.map((amount) {
                        return ValueListenableBuilder(
                          valueListenable: selectedAmount,
                          builder: (context, value, child) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: customButton(
                                backgroundColor: value == amount
                                    ? context.colorTrans
                                    : AppPropertyColor.white,
                                child: Text(
                                  formatPriceRp(amount),
                                  style: value == amount
                                      ? lv05TextStyleWhite
                                      : lv05TextStyle,
                                ),
                                onPressed: () {
                                  selectedAmount.value =
                                      selectedAmount.value == amount
                                      ? 0
                                      : amount;
                                  context.read<PaymentBloc>().add(
                                    PaymentAdjust(
                                      billPaid: selectedAmount.value,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  )
                : SizedBox.shrink();
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text("Sesuaikan Nominal: Rp", style: lv05TextStyle),
            const SizedBox(width: 5),
            Expanded(
              child: customTextField(
                alignEnd: true,
                context: context,
                controller: payController,
                inputType: TextInputType.number,
                suffixText: ",00",
                label: "Nominal Bayar",
                onChanged: (value) {
                  final finalValue = double.tryParse(value) ?? 0;
                  split
                      ? context.read<PaymentBloc>().add(
                          PaymentAdjust(billPaidSplitCash: finalValue),
                        )
                      : context.read<PaymentBloc>().add(
                          PaymentAdjust(billPaid: finalValue),
                        );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
