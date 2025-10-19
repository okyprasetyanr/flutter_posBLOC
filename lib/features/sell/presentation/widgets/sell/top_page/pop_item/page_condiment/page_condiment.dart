import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';

class SellPopUpPageCondiment extends StatelessWidget {
  const SellPopUpPageCondiment({super.key});

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
      child: BlocSelector<SellBloc, SellState, List<ModelItem>>(
        selector: (state) {
          if (state is SellLoaded) {
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
          return [];
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
                            SellBloc,
                            SellState,
                            (String?, List<ModelItemOrdered>?, String?)
                          >(
                            selector: (state) {
                              if (state is SellLoaded) {
                                return (
                                  state.selectedItem?.getidOrdered,
                                  state.selectedItem?.getCondiment,
                                  state.selectedItem?.getidCondimen,
                                );
                              }
                              return ("", [], "");
                            },
                            builder: (context, stateCondiment) {
                              if (stateCondiment.$1 == null &&
                                  stateCondiment.$2 == null &&
                                  stateCondiment.$3 == null) {
                                return Spacer();
                              }

                              double qtyitem = 0;
                              if (stateCondiment.$2!.any(
                                (element) =>
                                    state[index].getidItem == element.getidItem,
                              )) {
                                qtyitem = stateCondiment.$2!
                                    .firstWhere(
                                      (element) =>
                                          state[index].getidItem ==
                                          element.getidItem,
                                    )
                                    .getqtyItem;
                              }

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
                                                  BorderRadiusGeometry.circular(
                                                    10,
                                                  ),
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
                                                idCustomer: null,
                                                nameCustomer: null,
                                                priceItemCustom:
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
                                                idCondiment: stateCondiment.$3!,
                                                note: "",
                                                urlImage: "",
                                                condiment: [],
                                              );
                                          context.read<SellBloc>().add(
                                            SellSelectedCondiment(
                                              add: false,
                                              selectedCondiment:
                                                  selectedItemCondiment,
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.remove_rounded,
                                          color: AppColor.delete,
                                        ),
                                      ),

                                      SizedBox(
                                        width: 20,
                                        child: Text(
                                          "${formatQty(qtyitem)}",
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
                                                  BorderRadiusGeometry.circular(
                                                    10,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          ModelItemOrdered
                                          selectedItemCondiment =
                                              ModelItemOrdered(
                                                idCustomer: null,
                                                nameCustomer: null,
                                                priceItemCustom:
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
                                                idCondiment: stateCondiment.$3!,
                                                note: "",
                                                urlImage: "",
                                                condiment: [],
                                              );
                                          context.read<SellBloc>().add(
                                            SellSelectedCondiment(
                                              add: true,
                                              selectedCondiment:
                                                  selectedItemCondiment,
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.add_rounded,
                                          color: AppColor.delete,
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
