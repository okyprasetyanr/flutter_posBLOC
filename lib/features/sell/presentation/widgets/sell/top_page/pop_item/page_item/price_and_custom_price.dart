import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell/sell_state.dart';
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
      padding: const EdgeInsets.all(5),
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
                    minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                    padding: const WidgetStatePropertyAll(EdgeInsets.all(7)),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),
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
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
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
        ],
      ),
    );
  }
}
