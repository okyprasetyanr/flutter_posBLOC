import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_state.dart';
import 'package:flutter_pos/model_data/model_transaction_sell.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/row_content.dart';

class UIPaymentDateInvoiceCustomerOperator extends StatelessWidget {
  const UIPaymentDateInvoiceCustomerOperator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PaymentBloc, PaymentState, ModelTransactionSell?>(
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
            rowContent("Tanggal", "${state.getdate}"),
            const SizedBox(height: 10),
            rowContent("Nomor Faktur", "${state.getinvoice}"),
            const SizedBox(height: 10),
            rowContent("Customer", "${state.getnameCustomer}"),
            const SizedBox(height: 10),
            rowContent("Operator", "${state.getnameOperator}"),
          ],
        );
      },
    );
  }
}
