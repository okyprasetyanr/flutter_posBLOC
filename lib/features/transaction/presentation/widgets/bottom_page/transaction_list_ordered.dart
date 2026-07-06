import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/features/transaction/logic/transaction_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction_event.dart';
import 'package:flutter_pos/features/transaction/logic/transaction_state.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/transaction/model/model_item_ordered.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class TransactionListOrdered extends StatelessWidget {
  const TransactionListOrdered({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      TransactionBloc,
      TransactionState,
      List<ModelItemOrdered>
    >(
      selector: (state) {
        if (state is TransactionLoaded) {
          return state.itemOrdered;
        }
        return const [];
      },
      builder: (context, state) {
        if (state.isEmpty) {
          return Center(child: Text("Belum ada Pesanan!", style: lv1TextStyle));
        } else {
          return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(),
            itemCount: state.length,
            itemBuilder: (context, index) {
              final item = state[index];
              return ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppPropertyColor.transparent,
                      AppPropertyColor.black,
                      AppPropertyColor.black,
                      AppPropertyColor.transparent,
                    ],
                    stops: [0, 0.02, 0.98, 1],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: Material(
                  color: index % 2 == 0
                      ? AppPropertyColor.white
                      : const Color.fromARGB(255, 235, 235, 235),
                  child: InkWell(
                    onTap: () {
                      context.read<TransactionBloc>().add(
                        TransactionSelectedItem(selectedItem: item, edit: true),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 5,
                        bottom: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/logo.png", height: 35),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${formatQtyOrPrice(item.getqtyItem)}x ${item.getnameItem}",
                                            overflow: TextOverflow.ellipsis,
                                            style: lv05TextStyleOrderedItem,
                                          ),
                                        ),

                                        Row(
                                          children: [
                                            Text(
                                              "(${item.getdiscountItem}%)",
                                              style:
                                                  lv05textStylePriceCondiment,
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              formatPriceRp(item.getsubTotal),
                                              style: lv05textStylePrice,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppPropertyColor.primaryLight3,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: const EdgeInsets.all(5),
                                      child: Column(
                                        children: item.getCondiment.map((
                                          condiment,
                                        ) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${formatQtyOrPrice(condiment.getqtyItem)}x ${condiment.getnameItem}",
                                                style: lv05TextStyle,
                                              ),

                                              Text(
                                                formatPriceRp(
                                                  condiment.getsubTotal,
                                                ),
                                                style:
                                                    lv05textStylePriceCondiment,
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Catatan: ${item.getNote}",
                            style: lv05TextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
