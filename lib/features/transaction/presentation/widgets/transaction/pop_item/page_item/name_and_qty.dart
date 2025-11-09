import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class UITransactionPopUpNameAndQty extends StatelessWidget {
  const UITransactionPopUpNameAndQty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child:
                BlocSelector<
                  TransactionBloc,
                  TransactionState,
                  ModelItemOrdered?
                >(
                  selector: (state) {
                    if (state is TransactionLoaded) {
                      return state.selectedItem;
                    }
                    return null;
                  },
                  builder: (context, state) {
                    return Text(state?.getnameItem ?? "", style: lv05TextStyle);
                  },
                ),
          ),
          Expanded(
            child: Column(
              children: [
                Text("Quantity:", style: lv05TextStyle),
                BlocSelector<TransactionBloc, TransactionState, double?>(
                  selector: (state) {
                    if (state is TransactionLoaded) {
                      return state.selectedItem?.getqtyItem;
                    }
                    return null;
                  },
                  builder: (context, state) {
                    if (state == null) {
                      return SizedBox.shrink();
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          style: ButtonStyle(
                            minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                            padding: WidgetStatePropertyAll(EdgeInsets.all(5)),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Colors.grey),
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () {
                            context.read<TransactionBloc>().add(
                              TransactionAdjustItem(mode: false),
                            );
                          },
                          icon: Icon(Icons.remove, size: 20),
                        ),
                        SizedBox(
                          width: 18,
                          child: Text(
                            formatQtyOrPrice(state),
                            style: lv1TextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        IconButton(
                          style: ButtonStyle(
                            minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                            padding: WidgetStatePropertyAll(EdgeInsets.all(5)),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Colors.grey),
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                          ),
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            context.read<TransactionBloc>().add(
                              TransactionAdjustItem(mode: true),
                            );
                          },
                          icon: Icon(Icons.add, size: 20),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
