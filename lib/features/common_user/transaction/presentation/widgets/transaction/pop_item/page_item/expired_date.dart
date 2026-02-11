import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/common_widget/widget_custom_date.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UITransactionPopUpExpiredDate extends StatefulWidget {
  const UITransactionPopUpExpiredDate({super.key});

  @override
  State<UITransactionPopUpExpiredDate> createState() =>
      _UITransactionPopUpExpiredDateState();
}

class _UITransactionPopUpExpiredDateState
    extends State<UITransactionPopUpExpiredDate> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text("Kadaluarsa:", style: lv05TextStyle)),
        Expanded(
          flex: 2,
          child: WidgetCustomDate(
            onSelected: (day, month, year) {
              debugPrint("Log UITransaction: CustomDate: $year-$month-$day");
              context.read<TransactionBloc>().add(
                TransactionAdjustItem(expiredDate: "$year-$month-$day"),
              );
            },
          ),
        ),
      ],
    );
  }
}
