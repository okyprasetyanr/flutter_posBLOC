import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/common_widget/widget_custom_date.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
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
          child:
              BlocSelector<
                TransactionBloc,
                TransactionState,
                ModelItemOrdered?
              >(
                selector: (state) =>
                    state is TransactionLoaded ? state.selectedItem : null,
                builder: (context, state) {
                  final String? day = state != null
                      ? state.getexpiredDate?.day.toString()
                      : null;
                  final String? month = state != null
                      ? state.getexpiredDate?.month.toString()
                      : null;
                  final String? year = state != null
                      ? state.getexpiredDate?.year.toString()
                      : null;
                  return WidgetCustomDate(
                    initDay: day,
                    initMonth: month,
                    initYear: year,
                    onSelected: (day, month, year) {
                      debugPrint(
                        "Log UITransaction: CustomDate: $year-$month-$day",
                      );
                      context.read<TransactionBloc>().add(
                        TransactionAdjustItem(
                          day: day,
                          month: month,
                          year: year,
                        ),
                      );
                    },
                  );
                },
              ),
        ),
      ],
    );
  }
}
