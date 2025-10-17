import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class SellListViewOrderedItem extends StatelessWidget {
  const SellListViewOrderedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocSelector<SellBloc, SellState, List<ModelItemPesanan>>(
            selector: (state) {
              if (state is SellLoaded) {
                return state.itemOrdered ?? [];
              }
              return [];
            },
            builder: (context, state) {
              if (state.isEmpty) {
                return Text("Belum ada Pesanan!", style: lv1TextStyle);
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.length,
                        itemBuilder: (context, index) {
                          final item = state[index];
                          return ShaderMask(
                            shaderCallback: (bounds) {
                              return LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.02, 0.98, 1],
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.dstIn,
                            child: Material(
                              color: index % 2 == 0
                                  ? Colors.white
                                  : const Color.fromARGB(255, 235, 235, 235),
                              child: InkWell(
                                onTap: () {
                                  context.read<SellBloc>().add(
                                    SellSelectedItem(
                                      selectedItem: item,
                                      edit: true,
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/logo.png",
                                        height: 45,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${formatQty(item.getqtyItem)}x ${item.getnameItem}",
                                                  style: lv05TextStyle,
                                                ),
                                                Text(
                                                  formatUang(item.getsubTotal),
                                                  style: lv05textStyleHarga,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: item.getCondiment.map((
                                                condiment,
                                              ) {
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${formatQty(condiment.getqtyItem)}x ${condiment.getnameItem}",
                                                      style: lv05TextStyle,
                                                    ),
                                                    Text(
                                                      formatUang(
                                                        condiment.getsubTotal,
                                                      ),
                                                      style:
                                                          lv05textStyleHargaCondiment,
                                                    ),
                                                  ],
                                                );
                                              }).toList(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: BlocSelector<SellBloc, SellState, (int, double)>(
            selector: (state) {
              if (state is SellLoaded && state.itemOrdered != null) {
                final itemOrdered = state.itemOrdered!;
                int itemcount = 0;
                double subTotal = 0;
                for (int i = 0; i < itemOrdered.length; i++) {
                  subTotal += itemOrdered[i].getsubTotal;
                  itemcount++;
                  if (itemOrdered[i].getCondiment.isNotEmpty) {
                    for (
                      int u = 0;
                      u < itemOrdered[i].getCondiment.length;
                      u++
                    ) {
                      itemcount++;
                      subTotal += itemOrdered[i].getCondiment[u].getsubTotal;
                    }
                  }
                }
                return (itemcount, subTotal);
              }
              return (0, 0);
            },
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${state.$1}x : ${formatUang(state.$2)}",
                    style: lv05TextStyleRed,
                  ),
                ],
              );
            },
          ),
        ),

        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Text("Hapus", style: lv0TextStyleRED),
                icon: Icon(Icons.delete, color: Colors.white),
                style: ElevatedButton.styleFrom(elevation: 4),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Text("Simpan", style: lv1TextStyleWhite),

                icon: Icon(Icons.save, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: AppColor.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
