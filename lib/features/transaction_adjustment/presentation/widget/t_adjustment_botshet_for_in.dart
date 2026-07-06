import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_date.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/transaction_adjustment/logic/transaction_adjustment_bloc.dart';
import 'package:flutter_pos/features/transaction_adjustment/logic/transaction_adjustment_event.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/batch/model/model_date_expired.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class TAdjustmentBotshetForIn extends StatelessWidget {
  final Color color;
  final ModelDateExpired? dateExpired;
  final TextEditingController sellPriceController;
  final TextEditingController buyPriceController;
  final TextEditingController noteController;
  final GlobalKey<FormState> keyForm;
  final Function({required ModelDateExpired? date}) onSelect;
  const TAdjustmentBotshetForIn({
    super.key,
    required this.color,
    required this.keyForm,
    required this.noteController,
    required this.onSelect,
    required this.sellPriceController,
    required this.buyPriceController,
    this.dateExpired,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: Row(
                children: [
                  Text("Harga Jual", style: lv05TextStyle),
                  Spacer(),
                  Text(":", style: lv1TextStyle),
                ],
              ),
            ),

            const SizedBox(width: 10),
            Expanded(
              child: customTextField(
                controller: sellPriceController,
                inputType: TextInputType.number,
                alignEnd: true,
                suffixText: ",00",
                onChanged: (value) => context.read<AdjustmentBloc>().add(
                  AdjustmentAdjustData(sellPrice: value.isEmpty ? "0" : value),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: Row(
                children: [
                  Text("Harga Jual", style: lv05TextStyle),
                  Spacer(),
                  Text(":", style: lv1TextStyle),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: customTextField(
                controller: buyPriceController,
                inputType: TextInputType.number,
                alignEnd: true,
                suffixText: ",00",
                onChanged: (value) => context.read<AdjustmentBloc>().add(
                  AdjustmentAdjustData(buyPrice: value.isEmpty ? "0" : value),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: Row(
                children: [
                  Text("Harga Jual", style: lv05TextStyle),
                  Spacer(),
                  Text(":", style: lv1TextStyle),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: WidgetCustomDate(
                initDay: dateExpired?.dayExpired,
                initMonth: dateExpired?.monthExpired,
                initYear: dateExpired?.yearExpired,
                onSelected: (day, month, year) {
                  devLog(
                    "Log UIAdjustment: CustomDate: $year-$month-$day : from Main: $dateExpired",
                  );
                  onSelect(
                    date: ModelDateExpired(
                      dayExpired: day,
                      monthExpired: month,
                      yearExpired: year,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
