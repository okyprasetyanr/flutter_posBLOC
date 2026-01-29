import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/pop_item/page_item/discount_and_custom.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/pop_item/page_item/name_and_qty.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/pop_item/page_item/note_and_subtotal.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/pop_item/page_item/price_and_custom.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/common_widget/widget_custom_date.dart';

class TransactionPopUpPageItem extends StatelessWidget {
  const TransactionPopUpPageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UITransactionPopUpNameAndQty(),
        const SizedBox(height: 10),
        UITransactionPopUpNoteAndSubTotal(),
        const SizedBox(height: 10),
        BlocSelector<TransactionBloc, TransactionState, bool>(
          selector: (state) {
            if (state is TransactionLoaded) {
              return state.isSell;
            }
            return true;
          },
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: UITransactionPopUpPriceAndCustom(
                    onChange: ({required value}) => context
                        .read<TransactionBloc>()
                        .add(TransactionAdjustItem(customPrice: value)),
                    isSell: state,
                    labelPrice: "Harga Jual:",
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: state
                      ? const UITransactionPopUpDiscountAndCustom()
                      : SizedBox(
                          height: 200,
                          child: Column(
                            children: [
                              UITransactionPopUpPriceAndCustom(
                                onChange: ({required value}) =>
                                    context.read<TransactionBloc>().add(
                                      TransactionAdjustItem(
                                        secondCustomPrice: value,
                                      ),
                                    ),
                                isSell: state,
                                labelPrice: "Harga Beli:",
                              ),

                              SizedBox(height: 10),
                              Text("Tanggal Kadaluarsa:", style: lv05TextStyle),
                              SizedBox(height: 10),
                              Expanded(
                                child: WidgetCustomDate(
                                  onSelected: (day, month, year) {
                                    debugPrint(
                                      "Log UITransaction: CustomDate: $year-$month-$day",
                                    );
                                    context.read<TransactionBloc>().add(
                                      TransactionAdjustItem(
                                        expiredDate: "$year-$month-$day",
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
