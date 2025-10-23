import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/sell/logic/payment/payment_event.dart';
import 'package:flutter_pos/features/sell/logic/sell/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell/sell_event.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';

class UISellTransactionSuccess extends StatelessWidget {
  const UISellTransactionSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.popUntil(context, ModalRoute.withName('/sell'));
          final blocSell = context.read<SellBloc>();
          blocSell.add(SellResetOrderedItem());
          blocSell.add(SellResetSelectedItem());

          final blocPayment = context.read<PaymentBloc>();
          blocPayment.add(PaymentResetTransaction());
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
      children: [
        Text("Transaksi Sukses!", style: transactionSuccessTextStyle),
        Padding(
          padding: EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return Text("data");
  }

  Future<void> refreshIndicator() async {
    return;
  }
}
