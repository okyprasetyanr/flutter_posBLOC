import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UITransactionPopUpPriceAndCustom extends StatefulWidget {
  final bool isSell;
  final String labelPrice;
  final Function({required double? value}) onChange;
  const UITransactionPopUpPriceAndCustom({
    super.key,
    required this.isSell,
    required this.labelPrice,
    required this.onChange,
  });

  @override
  State<UITransactionPopUpPriceAndCustom> createState() =>
      _UITransactionPopUpPriceAndCustomState();
}

class _UITransactionPopUpPriceAndCustomState
    extends State<UITransactionPopUpPriceAndCustom> {
  final priceController = TextEditingController();
  final editprice = ValueNotifier(false);

  @override
  void dispose() {
    priceController.dispose();
    editprice.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    editprice.addListener(() {
      if (!editprice.value) {
        widget.onChange(value: 0);
        priceController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelPrice, style: lv05TextStyle),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                    padding: const WidgetStatePropertyAll(EdgeInsets.all(7)),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  iconAlignment: IconAlignment.end,
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    editprice.value = !editprice.value;
                  },
                  label:
                      BlocSelector<TransactionBloc, TransactionState, double>(
                        selector: (state) {
                          if (state is TransactionLoaded &&
                              state.selectedItem != null) {
                            return state.selectedItem!.getpriceItemFinal;
                          }
                          return 0;
                        },
                        builder: (context, state) {
                          debugPrint(
                            "Log UISell: BlocSelector Harga value: $state",
                          );
                          return Text(
                            formatPriceRp(state),
                            style: lv05TextStyle,
                          );
                        },
                      ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 120,
                child: Stack(
                  children: [
                    ValueListenableBuilder<bool>(
                      valueListenable: editprice,
                      builder: (context, valueEditPrie, child) {
                        return AnimatedPositioned(
                          bottom: 0,
                          top: valueEditPrie ? 0 : -80,
                          left: 0,
                          right: 0,
                          duration: Duration(milliseconds: 500),
                          child: SizedBox(
                            width: 200,
                            child:
                                BlocListener<TransactionBloc, TransactionState>(
                                  listenWhen: (previous, current) =>
                                      previous is TransactionLoaded &&
                                      current is TransactionLoaded &&
                                      previous.selectedItem !=
                                          current.selectedItem,
                                  listener: (context, state) {
                                    if (state is TransactionLoaded &&
                                        state.selectedItem == null) {
                                      priceController.clear();
                                    }
                                  },
                                  child: TextField(
                                    style: lv05TextStyle,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            vertical: 8,
                                            horizontal: 5,
                                          ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: "Ubah Harga:",
                                      labelStyle: lv05TextStyle,
                                      hintText: "Rp...",
                                      hintStyle: lv05TextStyle,
                                    ),
                                    textAlign: TextAlign.right,
                                    controller: priceController,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      debugPrint(
                                        "Log UISell: cek BlocSelector Harga",
                                      );
                                      widget.onChange(
                                        value: value.isNotEmpty
                                            ? double.tryParse(value)
                                            : 0,
                                      );
                                    },
                                  ),
                                ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
