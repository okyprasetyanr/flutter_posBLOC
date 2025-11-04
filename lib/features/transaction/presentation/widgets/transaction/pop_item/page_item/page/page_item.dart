import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/features/transaction/presentation/widgets/transaction/pop_item/page_item/discount_and_custom.dart';
import 'package:flutter_pos/features/transaction/presentation/widgets/transaction/pop_item/page_item/name_and_qty.dart';
import 'package:flutter_pos/features/transaction/presentation/widgets/transaction/pop_item/page_item/note_and_subtotal.dart';
import 'package:flutter_pos/features/transaction/presentation/widgets/transaction/pop_item/page_item/price_and_custom.dart';

class TransactionPopUpPageItem extends StatelessWidget {
  const TransactionPopUpPageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UITransactionPopUpNameAndQty(),
          const SizedBox(height: 10),
          UITransactionPopUpNoteAndSubTotal(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 4, child: UITransactionPopUpPriceAndCustom()),
              const SizedBox(width: 5),
              Expanded(
                flex: 6,
                child: BlocSelector<TransactionBloc, TransactionState, bool>(
                  selector: (state) {
                    if (state is TransactionLoaded) {
                      return state.isSell;
                    }
                    return true;
                  },
                  builder: (context, state) {
                    return state
                        ? const UITransactionPopUpDiscountAndCustom()
                        : const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
