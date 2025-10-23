import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_state.dart';
import 'package:flutter_pos/model_data/model_transaction_sell.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';

class UIPaymentDebitPayment extends StatelessWidget {
  final bool split;
  final TextEditingController chargeController;
  const UIPaymentDebitPayment({
    super.key,
    required this.chargeController,
    required this.split,
  });

  @override
  Widget build(BuildContext context) {
    final listBank = [
      "BCA",
      "BRI",
      "Mandiri",
      "BNI",
      "BTN",
      "CIMB Niaga",
      "Permata",
      "Danamon",
      "BTPN / Jenius",
      "BNC (Neo Commerce)",
      "SeaBank",
      "Bank Jago",
      "BSI (Syariah Indonesia)",
    ];
    return BlocSelector<PaymentBloc, PaymentState, ModelTransactionSell?>(
      selector: (state) {
        if (state is PaymentLoaded) {
          return state.transaction_sell!;
        }
        return null;
      },
      builder: (context, state) {
        if (state == null) {
          return SizedBox.shrink();
        }
        return Padding(
          padding: EdgeInsetsGeometry.all(5),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: Text("Daftar Bank", style: lv05TextStyle),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      items: listBank
                          .map(
                            (map) => DropdownMenuItem(
                              value: map,
                              child: Text(map, style: lv05TextStyle),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        context.read<PaymentBloc>().add(
                          PaymentAdjust(paymentMethod: value),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: chargeController,
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
                        labelText: "PPN",
                        labelStyle: lv05TextStyle,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          final customPpn = newValue.text;
                          final intValue =
                              int.tryParse(
                                customPpn.isEmpty ? "0" : customPpn,
                              ) ??
                              0;
                          if (intValue > 100) {
                            customSnackBar(context, "Jumlah melebihi 100%");
                            return oldValue;
                          }
                          context.read<PaymentBloc>().add(
                            PaymentAdjust(charge: intValue),
                          );
                          return newValue;
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              split
                  ? SizedBox(
                      width: 300,
                      child: Row(
                        children: [
                          Text("Sesuaikan Nominal: Rp", style: lv05TextStyle),
                          const SizedBox(width: 5),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.right,
                              style: lv05TextStyle,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                suffixText: ",00",
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                label: Text(
                                  "Nominal Debit",
                                  style: lv05TextStyle,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                TextInputFormatter.withFunction((
                                  oldValue,
                                  newValue,
                                ) {
                                  if (newValue.text.length > 8) {
                                    customSnackBar(
                                      context,
                                      "Jumlah melebihi batas",
                                    );
                                    return oldValue;
                                  }
                                  final value =
                                      double.tryParse(newValue.text) ?? 0;
                                  context.read<PaymentBloc>().add(
                                    PaymentAdjust(billPaid: value),
                                  );
                                  return newValue;
                                }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
