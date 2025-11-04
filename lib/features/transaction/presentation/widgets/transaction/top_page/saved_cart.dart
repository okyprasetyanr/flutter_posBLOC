import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/function/bottom_sheet.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';

class UITransactionSavedCart extends StatelessWidget {
  const UITransactionSavedCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10),
              ),
            ),
            minimumSize: WidgetStatePropertyAll(Size(0, 0)),
            padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
            backgroundColor: WidgetStatePropertyAll(AppColor.primary),
          ),
          onPressed: () {
            customBottomSheet(
              context,
              () {
              },
              (scrollController) {
                return BlocSelector<
                  TransactionBloc,
                  TransactionState,
                  List<ModelTransaction>
                >(
                  selector: (state) {
                    if (state is TransactionLoaded) {
                      return state.dataTransactionSaved;
                    }
                    return [];
                  },
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        final transaction = state[index];
                        return InkWell(
                          onTap: () {
                            print(
                              "Log UITransaction: CartSaved: ${state[index].getitemsOrdered}",
                            );
                            context.read<TransactionBloc>().add(
                              TransactionLoadTransaction(
                                currentTransaction: state[index],
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            title: Text(
                              "${transaction.getinvoice}, ${formatUang(transaction.gettotal)}",
                            ),
                            subtitle: Text(
                              "Date: ${transaction.getdate}, Note: ${transaction.getnote}",
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
          child: Icon(
            Icons.shopping_bag_rounded,
            size: 20,
            color: Colors.white,
          ),
        ),
        Positioned(
          right: 10,
          top: 8,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.red,
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
                color: Colors.white,
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
