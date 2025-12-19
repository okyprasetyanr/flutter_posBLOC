import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
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
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),

        color: Colors.grey.shade200,
      ),
      child: BlocSelector<TransactionBloc, TransactionState, List<ModelItem>>(
        selector: (state) {
          if (state is TransactionLoaded) {
            return state.dataItem
                    ?.where(
                      (element) =>
                          element.getstatusCondiment &&
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
              Text("Condiment", style: labelTextStyle),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  itemCount: state.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    mainAxisExtent: 65,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return Material(
                      elevation: 2,
                      color: Colors.white,
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

                              double qtyitem = stateCondiment.$2!.isNotEmpty
                                  ? stateCondiment.$2!
                                        .firstWhere(
                                          (element) =>
                                              state[index].getidItem ==
                                              element.getidItem,
                                        )
                                        .getqtyItem
                                  : 0;

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    state[index].getnameItem,
                                    style: lv05TextStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                Colors.white,
                                              ),
                                          padding: const WidgetStatePropertyAll(
                                            EdgeInsets.all(10),
                                          ),
                                          minimumSize: WidgetStatePropertyAll(
                                            Size(0, 0),
                                          ),
                                          shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
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
                                                priceItemFinal:
                                                    state[index].getpriceItem,
                                                subTotal:
                                                    state[index].getpriceItem,
                                                idBranch:
                                                    state[index].getidBranch,
                                                nameItem:
                                                    state[index].getnameItem,
                                                idItem: state[index].getidItem,
                                                idOrdered: stateCondiment.$1!,
                                                qtyItem: qtyitem,
                                                priceItem:
                                                    state[index].getpriceItem,
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
                                        child: Icon(
                                          Icons.remove_rounded,
                                          color: AppPropertyColor.delete,
                                        ),
                                      ),

                                      SizedBox(
                                        width: 20,
                                        child: Text(
                                          "${formatQtyOrPrice(qtyitem)}",
                                          style: lv1TextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                Colors.white,
                                              ),
                                          padding: const WidgetStatePropertyAll(
                                            EdgeInsets.all(10),
                                          ),
                                          minimumSize: WidgetStatePropertyAll(
                                            Size(0, 0),
                                          ),
                                          shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          ModelItemOrdered
                                          selectedItemCondiment =
                                              ModelItemOrdered(
                                                priceItemFinal:
                                                    state[index].getpriceItem,
                                                subTotal:
                                                    state[index].getpriceItem,
                                                idBranch:
                                                    state[index].getidBranch,
                                                nameItem:
                                                    state[index].getnameItem,
                                                idItem: state[index].getidItem,
                                                idOrdered: stateCondiment.$1!,
                                                qtyItem: qtyitem + 1,
                                                priceItem:
                                                    state[index].getpriceItem,
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
                                        child: Icon(
                                          Icons.add_rounded,
                                          color: AppPropertyColor.delete,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );

                              // Material(
                              //   elevation: 4,
                              //   borderRadius: BorderRadius.circular(15),
                              //   child: InkWell(
                              //     borderRadius: BorderRadius.circular(15),
                              // onTap: () {
                              //   ModelItemOrdered selectedItemCondiment =
                              //       ModelItemOrdered(
                              //         priceItemCustom: state[index].getpriceItem,
                              //         subTotal: state[index].getpriceItem,
                              //         idBranch: state[index].getidBranch,
                              //         nameItem: state[index].getnameItem,
                              //         idItem: state[index].getidItem,
                              //         idOrdered: stateCondiment.$1!,
                              //         qtyItem: qtyitem + 1,
                              //         priceItem: state[index].getpriceItem,
                              //         discountItem: 0,
                              //         idCategoryItem:
                              //             state[index].getidCategoryiItem,
                              //         idCondiment: stateCondiment.$3!,
                              //         note: "",
                              //         urlImage: "",
                              //         condiment: [],
                              //       );
                              //   context.read<SellBloc>().add(
                              //     SellSelectedCondiment(
                              //       selectedCondiment: selectedItemCondiment,
                              //     ),
                              //   );
                              // },
                              //     child: Padding(
                              //       padding: const EdgeInsets.all(10),
                              //       child: Row(
                              //         children: [
                              //           Text(
                              //             state[index].getnameItem,
                              //             style: lv05TextStyle,
                              //           ),
                              //           const Spacer(),
                              //           Text(
                              //             "${formatQty(qtyitem)}x",
                              //             style: lv05TextStyleRed,
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 60),
            ],
          );
        },
      ),
    );
  }
}
