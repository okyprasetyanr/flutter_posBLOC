import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';

class UITransactionPopUpPageCondiment extends StatelessWidget {
  const UITransactionPopUpPageCondiment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Condiment", style: labelTextStyle),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: AppPropertyColor.greyLight,
            ),
            child: BlocSelector<TransactionBloc, TransactionState, List<ModelItem>>(
              selector: (state) {
                if (state is TransactionLoaded) {
                  return state.dataItem
                          ?.where(
                            (element) =>
                                element.getstatusCondiment ==
                                    StatusData.Aktif &&
                                element.getidCategoryiItem ==
                                    state.selectedItem?.getidCategoryItem,
                          )
                          .toList() ??
                      [];
                }
                return const [];
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        shrinkWrap: true,
                        itemCount: state.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 155,
                          mainAxisExtent: 65,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          return Material(
                            elevation: 2,
                            color: AppPropertyColor.white,
                            borderRadius: BorderRadius.circular(8),
                            child:
                                BlocSelector<
                                  TransactionBloc,
                                  TransactionState,
                                  (String?, List<ModelItemOrdered>?)
                                >(
                                  selector: (state) {
                                    if (state is TransactionLoaded) {
                                      return (
                                        state.selectedItem?.getidOrdered,
                                        state.selectedItem?.getCondiment,
                                      );
                                    }
                                    return ("", []);
                                  },
                                  builder: (context, stateCondiment) {
                                    if (stateCondiment.$1 == null &&
                                        stateCondiment.$2 == null) {
                                      return Spacer();
                                    }
                                    debugPrint(
                                      "Log UIPageCondiment: ${stateCondiment.$2}",
                                    );
                                    double qtyitem =
                                        stateCondiment.$2!.isNotEmpty
                                        ? stateCondiment.$2
                                                  ?.firstWhere(
                                                    (element) =>
                                                        state[index]
                                                            .getidItem ==
                                                        element.getidItem,
                                                    orElse: null,
                                                  )
                                                  .getqtyItem ??
                                              0
                                        : 0;

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          state[index].getnameItem,
                                          style: lv05TextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            customButton(
                                              backgroundColor:
                                                  AppPropertyColor.white,
                                              child: const Icon(
                                                Icons.remove_rounded,
                                                color: AppPropertyColor
                                                    .deleteOrClose,
                                              ),
                                              onPressed: () {
                                                if (qtyitem == 0) {
                                                  return customSnackBar(
                                                    context,
                                                    "Qty 0 tidak dapat dikurangi!",
                                                  );
                                                }
                                                ModelItemOrdered
                                                selectedItemCondiment =
                                                    ModelItemOrdered(
                                                      priceItemBuy: state[index]
                                                          .getpriceItemBuyByBatch,
                                                      itemOrderedBatch: [],
                                                      priceItemFinal:
                                                          state[index]
                                                              .getpriceItem,
                                                      subTotal: state[index]
                                                          .getpriceItem,
                                                      idBranch: state[index]
                                                          .getidBranch,
                                                      nameItem: state[index]
                                                          .getnameItem,
                                                      idItem: state[index]
                                                          .getidItem,
                                                      idOrdered:
                                                          stateCondiment.$1!,
                                                      qtyItem: qtyitem,
                                                      priceItem: state[index]
                                                          .getpriceItem,
                                                      discountItem: 0,
                                                      idCategoryItem: state[index]
                                                          .getidCategoryiItem,
                                                      note: "",
                                                      condiment: [],
                                                    );
                                                context.read<TransactionBloc>().add(
                                                  TransactionSelectedCondiment(
                                                    add: false,
                                                    selectedCondiment:
                                                        selectedItemCondiment,
                                                  ),
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              width: 30,
                                              child: Text(
                                                "${formatQtyOrPrice(qtyitem)}",
                                                style: lv1TextStyle,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            customButton(
                                              backgroundColor:
                                                  AppPropertyColor.white,
                                              child: const Icon(
                                                Icons.add_rounded,
                                                color: AppPropertyColor
                                                    .deleteOrClose,
                                              ),
                                              onPressed: () {
                                                ModelItemOrdered
                                                selectedItemCondiment =
                                                    ModelItemOrdered(
                                                      priceItemBuy: state[index]
                                                          .getpriceItemBuyByBatch,
                                                      itemOrderedBatch: [],
                                                      priceItemFinal:
                                                          state[index]
                                                              .getpriceItem,
                                                      subTotal: state[index]
                                                          .getpriceItem,
                                                      idBranch: state[index]
                                                          .getidBranch,
                                                      nameItem: state[index]
                                                          .getnameItem,
                                                      idItem: state[index]
                                                          .getidItem,
                                                      idOrdered:
                                                          stateCondiment.$1!,
                                                      qtyItem: qtyitem,
                                                      priceItem: state[index]
                                                          .getpriceItem,
                                                      discountItem: 0,
                                                      idCategoryItem: state[index]
                                                          .getidCategoryiItem,
                                                      note: "",
                                                      condiment: [],
                                                    );
                                                context.read<TransactionBloc>().add(
                                                  TransactionSelectedCondiment(
                                                    add: true,
                                                    selectedCondiment:
                                                        selectedItemCondiment,
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
