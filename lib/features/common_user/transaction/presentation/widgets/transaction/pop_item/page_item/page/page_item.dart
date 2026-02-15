import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/pop_item/page_item/discount_and_custom.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/pop_item/page_item/expired_date.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/pop_item/page_item/name_and_qty.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/pop_item/page_item/note_and_subtotal.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/pop_item/page_item/price_and_custom.dart';

class TransactionPopUpPageItem extends StatelessWidget {
  final TextEditingController sellPrice;
  final TextEditingController buyPrice;
  final ValueNotifier<bool> editSell;
  final ValueNotifier<bool> editBuy;

  const TransactionPopUpPageItem({
    super.key,
    required this.sellPrice,
    required this.buyPrice,
    required this.editSell,
    required this.editBuy,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UITransactionPopUpNameAndQty(),
        const SizedBox(height: 10),
        UITransactionPopUpNoteAndSubTotal(),
        const SizedBox(height: 10),
        BlocSelector<TransactionBloc, TransactionState, bool>(
          selector: (state) => state is TransactionLoaded ? state.isSell : true,
          builder: (context, state) =>
              state ? SizedBox.shrink() : UITransactionPopUpExpiredDate(),
        ),
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
                  flex: state ? 3 : 1,
                  child: UITransactionPopUpPriceAndCustom(
                    forSell: true,
                    labelPrice: "Harga Jual:",
                    controller: sellPrice,
                    editPrice: editSell,
                    onChange: ({required value}) {
                      context.read<TransactionBloc>().add(
                        TransactionAdjustItem(
                          customPrice: state ? value : null,
                          secondCustomPrice: state ? null : value ?? 0,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  flex: state ? 4 : 1,
                  child: state
                      ? const UITransactionPopUpDiscountAndCustom()
                      : UITransactionPopUpPriceAndCustom(
                          forSell: false,
                          labelPrice: "Harga Beli:",
                          controller: buyPrice,
                          editPrice: editBuy,
                          onChange: ({required value}) {
                            context.read<TransactionBloc>().add(
                              TransactionAdjustItem(customPrice: value),
                            );
                          },
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
