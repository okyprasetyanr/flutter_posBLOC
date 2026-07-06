import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/features/common_user/transaction_payment/logic/payment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction_payment/logic/payment_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/features/common_user/transaction/model/model_transaction.dart';

class TPaymentSummary extends StatelessWidget {
  const TPaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
          return Column(
            children: [
              rowContent("Total Item", "${state.gettotalItem}"),
              rowContent("Sub Total", "${formatPriceRp(state.getsubTotal)}"),
              rowContent(
                "Total Discount (${state.getdiscount}%)",
                "${formatPriceRp(state.gettotalDiscount)}",
              ),
              rowContent(
                "Total PPN (${state.getppn}%)",
                "${formatPriceRp(state.gettotalPpn)}",
              ),
              rowContent(
                "Total Charge (${state.getcharge}%)",
                "${formatPriceRp(state.gettotalCharge)}",
              ),
              rowContent(
                "Nominal Bayar",
                "${formatPriceRp(state.getbillPaid)}",
              ),
              rowContent(
                "Total",
                "${formatPriceRp(state.gettotal)}",
                forTotal: true,
              ),
            ],
          );
        },
      ),
    );
  }
}
