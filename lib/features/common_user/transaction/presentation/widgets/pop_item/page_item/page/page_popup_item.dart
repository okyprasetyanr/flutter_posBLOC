import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction_state.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/pop_item/page_item/popup_discount_and_custom.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/pop_item/page_item/popup_expired_date.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/pop_item/page_item/popup_name_and_qty.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/pop_item/page_item/popup_note_and_subtotal.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/pop_item/page_item/popup_price_and_custom.dart';

class PagePopUpItem extends StatelessWidget {
  final TextEditingController sellPrice;
  final TextEditingController buyPrice;
  final ValueNotifier<bool> editSell;
  final ValueNotifier<bool> editBuy;

  const PagePopUpItem({
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
        PopUpNameAndQty(),
        const SizedBox(height: 10),
        PopUpNoteAndSubTotal(),
        const SizedBox(height: 10),
        BlocSelector<TransactionBloc, TransactionState, bool>(
          selector: (state) => state is TransactionLoaded ? state.isSell : true,
          builder: (context, state) =>
              state ? SizedBox.shrink() : PopUpExpiredDate(),
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
                  child: PopUpPriceAndCustom(
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
                      ? const PopUpDiscountAndCustom()
                      : PopUpPriceAndCustom(
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
