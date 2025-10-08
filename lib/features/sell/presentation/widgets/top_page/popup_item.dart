import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class UISellPopUpItem extends StatefulWidget {
  const UISellPopUpItem({super.key});

  @override
  State<UISellPopUpItem> createState() => _UISellPopUpItemState();
}

class _UISellPopUpItemState extends State<UISellPopUpItem> {
  ValueNotifier<bool> popup = ValueNotifier(false);
  ValueNotifier<double> jumlah = ValueNotifier<double>(0);
  @override
  Widget build(BuildContext context) {
    return BlocListener<SellBloc, SellState>(
      listener: (context, state) {
        if (state is SellLoaded) {
          final data = state.selectedItem;
          popup.value = data != null;
          jumlah.value = data?.getqtyitem ?? 0;
        }
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: popup,
        builder: (_, isVisible, __) {
          return AnimatedPositioned(
            top: isVisible ? 60 : 500,
            left: 0,
            right: 0,
            bottom: 0,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 500),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, 0),
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child:
                                  BlocSelector<SellBloc, SellState, ModelItem?>(
                                    selector: (stateNama) {
                                      if (stateNama is SellLoaded) {
                                        return stateNama.selectedItem;
                                      }
                                      return null;
                                    },
                                    builder: (context, stateNama) {
                                      return Text(
                                        stateNama?.getnamaItem ?? "",
                                        style: lv1TextStyle,
                                      );
                                    },
                                  ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text("Quantity:", style: lv1TextStyle),
                                  ValueListenableBuilder<double>(
                                    valueListenable: jumlah,
                                    builder: (context, value, child) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              jumlah.value--;
                                            },
                                            icon: Icon(Icons.remove, size: 20),
                                          ),
                                          Text(
                                            formatQty(value),
                                            style: lv1TextStyle,
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              jumlah.value++;
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
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.all(10),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  const Color.fromARGB(255, 255, 154, 72),
                                ),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      5,
                                    ),
                                  ),
                                ),
                              ),
                              icon: Icon(Icons.card_giftcard_rounded),
                              label: Text(
                                "Free/Bonus",
                                style: lv1TextStyleWhite,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),

                        SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.all(10),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  const Color.fromARGB(255, 255, 89, 78),
                                ),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      5,
                                    ),
                                  ),
                                ),
                              ),
                              icon: Icon(Icons.delete_forever_rounded),
                              label: Text("Hapus", style: lv1TextStyleWhite),
                              onPressed: () {
                                popup.value = !isVisible;
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.all(10),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.red,
                                ),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      5,
                                    ),
                                  ),
                                ),
                              ),
                              icon: Icon(Icons.close_rounded),
                              label: Text("Tutup", style: lv1TextStyleWhite),
                              onPressed: () {
                                popup.value = false;
                                context.read<SellBloc>().add(
                                  SellResetSelectedItem(),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  AppColor.primary,
                                ),
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.all(10),
                                ),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      5,
                                    ),
                                  ),
                                ),
                              ),
                              icon: Icon(Icons.edit_note_rounded),
                              label: Text("Simpan", style: lv1TextStyleWhite),
                              onPressed: () {
                                popup.value = !isVisible;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
