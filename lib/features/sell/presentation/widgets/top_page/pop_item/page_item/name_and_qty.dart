import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class SellPopUpNameAndQty extends StatelessWidget {
  const SellPopUpNameAndQty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: BlocSelector<SellBloc, SellState, ModelItemPesanan?>(
              selector: (stateNama) {
                if (stateNama is SellLoaded) {
                  return stateNama.selectedItem;
                }
                return null;
              },
              builder: (context, stateNama) {
                return Text(stateNama?.getnameItem ?? "", style: lv05TextStyle);
              },
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text("Quantity:", style: lv05TextStyle),
                BlocSelector<SellBloc, SellState, double?>(
                  selector: (state) {
                    if (state is SellLoaded) {
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
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            context.read<SellBloc>().add(
                              SellAdjustItem(mode: false),
                            );
                          },
                          icon: Icon(Icons.remove, size: 20),
                        ),
                        SizedBox(width: 10),
                        Text(formatQty(state), style: lv1TextStyle),
                        SizedBox(width: 10),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            context.read<SellBloc>().add(
                              SellAdjustItem(mode: true),
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
