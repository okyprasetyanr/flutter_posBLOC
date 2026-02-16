import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/function/bottom_sheet.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UITransactionSavedCart extends StatelessWidget {
  const UITransactionSavedCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        customButton(
          backgroundColor: AppPropertyColor.primary,
          child: const Icon(
            Icons.shopping_bag_rounded,
            size: lv2IconSize,
            color: AppPropertyColor.white,
          ),
          onPressed: () {
            customBottomSheet(
              context: context,
              resetItemForm: () {},
              content: (scrollController) {
                return BlocSelector<
                  TransactionBloc,
                  TransactionState,
                  List<ModelTransaction>
                >(
                  selector: (state) {
                    if (state is TransactionLoaded) {
                      return state.dataTransactionSaved;
                    }
                    return const [];
                  },
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        final transaction = state[index];
                        return InkWell(
                          onTap: () {
                            debugPrint(
                              "Log UITransaction: CartSaved: ${state[index].getitemsOrdered}",
                            );
                            context.read<TransactionBloc>().add(
                              TransactionResetOrderedItem(),
                            );
                            context.read<TransactionBloc>().add(
                              TransactionLoadTransaction(
                                currentTransaction: state[index],
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Dismissible(
                            key: Key(state[index].getinvoice),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              padding: const EdgeInsets.only(right: 10),
                              color: AppPropertyColor.deleteOrClose,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.delete,
                                  color: AppPropertyColor.white,
                                ),
                              ),
                            ),
                            confirmDismiss: (direction) async {
                              final result = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    "Konfirmasi",
                                    style: lv2TextStyle,
                                  ),
                                  content: Text(
                                    "Hapus Transaksi ${state[index].getinvoice}?",
                                    style: lv1TextStyle,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: Text("Batal", style: lv1TextStyle),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.read<TransactionBloc>().add(
                                          TransactionDeleteItemSaved(
                                            invoice: state[index].getinvoice,
                                          ),
                                        );
                                        Navigator.pop(context, true);
                                      },
                                      child: Text("Hapus", style: lv1TextStyle),
                                    ),
                                  ],
                                ),
                              );
                              if (result == true) {
                                return true;
                              }
                              return false;
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                                right: 5,
                                top: 10,
                                bottom: 10,
                              ),

                              child: ListTile(
                                title: Text(
                                  "${transaction.getinvoice}, ${formatPriceRp(transaction.gettotal)}",
                                ),
                                subtitle: Text(
                                  "Date: ${transaction.getdate}, Note: ${transaction.getnote}",
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),

        Positioned(
          right: 15,
          top: 3,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppPropertyColor.deleteOrClose,
              shape: BoxShape.circle,
            ),
            child: Text(
              context.select<TransactionBloc, String>(
                (bloc) => bloc.state is TransactionLoaded
                    ? (bloc.state as TransactionLoaded)
                          .dataTransactionSaved
                          .length
                          .toString()
                    : "0",
              ),
              style: TextStyle(
                color: AppPropertyColor.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
