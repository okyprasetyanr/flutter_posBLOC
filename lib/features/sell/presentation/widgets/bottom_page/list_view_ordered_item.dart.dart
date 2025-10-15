import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item_pesanan.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class SellListViewOrderedItem extends StatelessWidget {
  const SellListViewOrderedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SellBloc, SellState, List<ModelItemPesanan>>(
      selector: (state) {
        if (state is SellLoaded) {
          return state.itemPesanan ?? [];
        }
        return [];
      },
      builder: (context, state) {
        if (state.isEmpty) {
          return Text("Belum ada Pesanan!", style: lv1TextStyle);
        } else {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              final item = state[index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/logo.png", height: 50),
                          const SizedBox(width: 10),
                          Text(
                            "${item.getqtyItem}x ${item.getnamaItem}",
                            style: lv05TextStyle,
                          ),
                        ],
                      ),
                      Text(formatUang(item.gethargaItem), style: lv05TextStyle),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: item.getCondiment.length,
                    itemBuilder: (context, index) {
                      final condiment = item.getCondiment[index];
                      if (item.getCondiment.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${condiment.getqtyItem}x ${condiment.getnamaItem}",
                            style: lv05TextStyle,
                          ),
                          Text(
                            formatUang(condiment.gethargaItem),
                            style: lv05TextStyle,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}
