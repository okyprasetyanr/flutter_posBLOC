import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class SellPopUpPriceAndCustomPrice extends StatefulWidget {
  const SellPopUpPriceAndCustomPrice({super.key});

  @override
  State<SellPopUpPriceAndCustomPrice> createState() =>
      _SellPopUpPriceAndCustomPriceState();
}

class _SellPopUpPriceAndCustomPriceState
    extends State<SellPopUpPriceAndCustomPrice> {
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
        context.read<SellBloc>().add(SellAdjustItem(customprice: 0));
        priceController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Harga: ", style: lv05TextStyle),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                  ),
                  iconAlignment: IconAlignment.end,
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    editprice.value = !editprice.value;
                  },
                  label: BlocSelector<SellBloc, SellState, double>(
                    selector: (state) {
                      if (state is SellLoaded && state.selectedItem != null) {
                        return state.selectedItem!.getpriceItemCustom;
                      }
                      return 0;
                    },
                    builder: (context, state) {
                      debugPrint(
                        "Log UISell: BlocSelector Harga value: $state",
                      );
                      return Text(formatUang(state), style: lv05TextStyle);
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
                      builder: (context, valueEditHarga, child) {
                        return AnimatedPositioned(
                          bottom: 0,
                          top: valueEditHarga ? 0 : -80,
                          left: 0,
                          right: 0,
                          duration: Duration(milliseconds: 500),
                          child: SizedBox(
                            width: 200,
                            child: BlocListener<SellBloc, SellState>(
                              listenWhen: (previous, current) =>
                                  previous is SellLoaded &&
                                  current is SellLoaded &&
                                  previous.selectedItem != current.selectedItem,
                              listener: (context, state) {
                                if (state is SellLoaded &&
                                    state.selectedItem == null) {
                                  priceController.clear();
                                }
                              },
                              child: TextField(
                                style: lv05TextStyle,
                                decoration: InputDecoration(
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
                                  context.read<SellBloc>().add(
                                    SellAdjustItem(
                                      customprice: double.tryParse(value),
                                    ),
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
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
