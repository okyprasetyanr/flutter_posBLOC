import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/enum_and_string/enum.dart';
import 'package:flutter_pos/features/common_user/transaction_payment/logic/payment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction_payment/logic/payment_event.dart';
import 'package:flutter_pos/features/common_user/transaction_payment/logic/payment_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition_text/transition_navigator/transition_up_down.dart';

class TPaymentButton extends StatelessWidget {
  const TPaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: BlocSelector<PaymentBloc, PaymentState, bool>(
            selector: (state) => state is PaymentLoaded ? state.isSell : false,
            builder: (context, isSell) {
              return isSell
                  ? customButton(
                      backgroundColor: AppPropertyColor.white,
                      child: Text("Simpan", style: lv05TextStyleBold),
                      onPressed: () {
                        context.read<PaymentBloc>().add(
                          PaymentProcess(
                            statusTransaction: ListStatusTransaction.Tersimpan,
                            context: context,
                          ),
                        );
                        customSnackBar(context, "Transaksi Disimpan!");
                      },
                    )
                  : const SizedBox.shrink();
            },
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: customButtonIcon(
            backgroundColor: AppPropertyColor.red,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: AppPropertyColor.white,
            ),
            label: Text("Batal", style: lv05TextStyleBoldWhite),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/sell'));
              final blocPayment = context.read<PaymentBloc>();
              blocPayment.add(PaymentResetTransaction());
            },
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: customButtonIcon(
            backgroundColor: context.colorTrans,
            icon: const Icon(
              Icons.attach_money_rounded,
              color: AppPropertyColor.white,
            ),
            label: Text("Bayar", style: lv05TextStyleBoldWhite),
            onPressed: () {
              final dataTransaction =
                  (context.read<PaymentBloc>().state as PaymentLoaded)
                      .transaction_sell!;
              if (dataTransaction.getbillPaid == 0 ||
                  dataTransaction.getbillPaid < dataTransaction.gettotal) {
                return customSnackBar(
                  context,
                  "Nominal Pembayaran tidak Sesuai!",
                );
              }

              if (dataTransaction.getpaymentMethod ==
                      LabelPaymentMethod.Split &&
                  (dataTransaction.getbillPaid == 0 ||
                      dataTransaction.getbillPaid !=
                          dataTransaction.gettotal)) {
                return customSnackBar(
                  context,
                  "Nominal Pembayaran tidak Sama!",
                );
              }
              context.read<PaymentBloc>().add(
                PaymentProcess(
                  statusTransaction: ListStatusTransaction.Sukses,
                  context: context,
                ),
              );

              navUpDownTransition(
                context,
                '/selltransactionsuccess',
                false,
                arguments: context.read<PaymentBloc>(),
              );
            },
          ),
        ),
      ],
    );
  }
}
