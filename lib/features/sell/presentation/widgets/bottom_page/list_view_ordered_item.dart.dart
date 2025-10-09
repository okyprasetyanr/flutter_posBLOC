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
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            final item = state[index];
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${item.getqtyItem}x ${item.getnamaItem}",
                      style: lv05TextStyle,
                    ),
                    Text(formatUang(item.gethargaItem), style: lv05TextStyle),
                  ],
                ),
                ListView.builder(
                  itemCount: item.getCondiment.length,
                  itemBuilder: (context, index) {
                    final condiment = item.getCondiment[index];
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
      },
    );
  }
}
