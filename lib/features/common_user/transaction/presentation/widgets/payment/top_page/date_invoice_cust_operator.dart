import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/common_widget/row_content.dart';

class UIPaymentDateInvoiceCustomerOperator extends StatelessWidget {
  const UIPaymentDateInvoiceCustomerOperator({super.key});

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
        return Column(
          children: [
            rowContent("Tanggal", "${formatDate(date: state.getdate)}"),
            rowContent("Nomor Faktur", "${state.getinvoice}"),
            rowContent("Kontak", "${state.getnamePartner}"),
            rowContent("Operator", "${state.getnameOperator}"),
          ],
        );
      },
    );
  }
}
