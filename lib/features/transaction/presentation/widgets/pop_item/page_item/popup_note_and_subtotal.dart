import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_input_decorator.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/transaction/logic/transaction_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction_event.dart';
import 'package:flutter_pos/features/transaction/logic/transaction_state.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';

class PopUpNoteAndSubTotal extends StatefulWidget {
  const PopUpNoteAndSubTotal({super.key});

  @override
  State<PopUpNoteAndSubTotal> createState() => _PopUpNoteAndSubTotalState();
}

class _PopUpNoteAndSubTotalState extends State<PopUpNoteAndSubTotal> {
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
              label: "Catatan",
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
