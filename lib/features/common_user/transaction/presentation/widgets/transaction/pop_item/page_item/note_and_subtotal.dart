import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/common_widget/widget_custom_input_decorator.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/function/function.dart';

class UITransactionPopUpNoteAndSubTotal extends StatefulWidget {
  const UITransactionPopUpNoteAndSubTotal({super.key});

  @override
  State<UITransactionPopUpNoteAndSubTotal> createState() =>
      _UITransactionPopUpNoteAndSubTotalState();
}

class _UITransactionPopUpNoteAndSubTotalState
    extends State<UITransactionPopUpNoteAndSubTotal> {
  TextEditingController noteController = TextEditingController();
  TextEditingController subTotalController = TextEditingController();

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: BlocListener<TransactionBloc, TransactionState>(
            listenWhen: (previous, current) =>
                previous is TransactionLoaded &&
                current is TransactionLoaded &&
                previous.selectedItem != current.selectedItem,
            listener: (context, state) {
              if (state is TransactionLoaded) {
                noteController.text = state.selectedItem?.getNote ?? "";
                subTotalController.text = formatPriceRp(
                  state.selectedItem?.getsubTotal ?? 0,
                );
              }
            },
            child: customTextField(
              controller: noteController,
              text: "Catatan",
              onChanged: (value) => context.read<TransactionBloc>().add(
                TransactionAdjustItem(note: value),
              ),
            ),
          ),
        ),

        const SizedBox(width: 20),
        Flexible(
          child: BlocSelector<TransactionBloc, TransactionState, double>(
            selector: (state) => (state is TransactionLoaded)
                ? state.selectedItem?.getsubTotal ?? 0
                : 0,
            builder: (context, state) {
              return customInputDecorator(
                text: "Sub Total",
                value: formatPriceRp(state),
              );
            },
          ),
        ),
      ],
    );
  }
}
