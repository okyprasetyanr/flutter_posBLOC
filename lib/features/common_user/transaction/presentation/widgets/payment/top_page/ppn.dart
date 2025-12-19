import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_state.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';

class UIPaymentPPN extends StatelessWidget {
  final TextEditingController customPPNController;
  const UIPaymentPPN({super.key, required this.customPPNController});

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
            SizedBox(width: 100, child: Text("PPN", style: lv1TextStyle)),
            Text(":", style: lv1TextStyle),
            Spacer(),
            Row(
              children: [
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [11, 25, 30].map((ppn) {
                    final isSelected = state.getppn == ppn;
                    return ElevatedButton.icon(
                      onPressed: () {
                        if (customPPNController.text.isNotEmpty) {
                          customPPNController.clear();
                        }
                        final ppnValue = isSelected ? 0 : ppn;
                        context.read<PaymentBloc>().add(
                          PaymentAdjust(ppn: ppnValue),
                        );
                      },
                      icon: Icon(Icons.check_rounded, size: lv1IconSize),
                      label: Text(
                        "$ppn%",
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
                ),
              ],
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: 50,
              child: TextField(
                controller: customPPNController,
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
                        int.tryParse(customPpn.isEmpty ? "0" : customPpn) ?? 0;
                    if (intValue > 100) {
                      customSnackBar(context, "Jumlah melebihi 100%");
                      return oldValue;
                    }
                    context.read<PaymentBloc>().add(
                      PaymentAdjust(ppn: intValue),
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
