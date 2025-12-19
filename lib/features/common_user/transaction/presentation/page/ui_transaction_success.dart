import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/common_widget/row_content.dart';

class UITransactionSuccess extends StatelessWidget {
  const UITransactionSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.popUntil(context, ModalRoute.withName('/sell'));
          context.read<PaymentBloc>().add(PaymentResetTransaction());
        }
      },
      child: LayoutTopBottom(
        layoutTop: layoutTop(),
        layoutBottom: layoutBottom(),
        widgetNavigation: null,
        refreshIndicator: refreshIndicator,
      ),
    );
  }

  Widget layoutTop() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: AppPropertyColor.primarylight1,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                blurStyle: BlurStyle.outer,
                color: Colors.black.withValues(alpha: 0.3),
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppPropertyColor.primarylight2,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  blurStyle: BlurStyle.outer,
                  color: Colors.black.withValues(alpha: 0.2),
                ),
              ],
            ),
            child: Image.asset("assets/success.png", height: 60),
          ),
        ),
        Text("Transaksi Sukses!", style: transactionSuccessTextStyle),
        BlocSelector<PaymentBloc, PaymentState, ModelTransaction?>(
          selector: (state) {
            if (state is PaymentLoaded) {
              return state.transaction_sell;
            }
            return null;
          },
          builder: (context, state) {
            return state != null
                ? Column(
                    children: [
                      Text(
                        "Nominal ${formatPriceRp(state.gettotal)}",
                        style: transactionSuccessPaidTextStyle,
                      ),
                      Text(
                        "Dibayar ${formatPriceRp(state.getbillPaid)}",
                        style: transactionSuccessPaidTextStyle,
                      ),
                      Text(
                        "Kembali ${formatPriceRp(state.getbillPaid - state.gettotal)}",
                        style: transactionSuccessPaidTextStyle,
                      ),
                    ],
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppPropertyColor.primarylight3,
        border: BoxBorder.all(
          color: Colors.grey,
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
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
              rowContent("Nomor Faktur", "${state.getinvoice}"),
              rowContent("Tanggal", "${state.getdate}"),
              rowContent("Tipe", "${state.getpaymentMethod}"),
              rowContent(
                "Diskon",
                "(${state.getdiscount}%) -${formatPriceRp(state.gettotalDiscount)}",
              ),
              rowContent(
                "PPN",
                "(${state.getppn}%) -${formatPriceRp(state.gettotalPpn)}",
              ),
              rowContent(
                "Charge",
                "(${state.getcharge}%) +${formatPriceRp(state.gettotalCharge)}",
              ),
              rowContent("Status", "Transaksi Sukses"),
            ],
          );
        },
      ),
    );
  }

  Future<void> refreshIndicator() async {
    return;
  }
}
