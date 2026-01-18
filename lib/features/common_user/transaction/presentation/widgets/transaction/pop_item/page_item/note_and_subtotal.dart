import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

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
    return BlocListener<TransactionBloc, TransactionState>(
      listener: (context, state) {
        if (state is TransactionLoaded) {
          noteController.text = state.selectedItem?.getNote ?? "";
          subTotalController.text = formatPriceRp(
            state.selectedItem?.getsubTotal ?? 0,
          );
        }
      },
      child: Row(
        children: [
          Flexible(
            child: customTextField(
              controller: noteController,
              text: "Catatan",
              onChanged: (value) => context.read<TransactionBloc>().add(
                TransactionAdjustItem(note: value),
              ),
            ),
          ),

          const SizedBox(width: 20),
          Flexible(
            child: TextField(
              style: lv05TextStyleDisable,
              enabled: false,
              controller: subTotalController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                label: Text(
                  "Sub Total:",
                  style: lv05TextStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
