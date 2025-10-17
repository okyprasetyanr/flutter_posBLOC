import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class SellPopUpPageCondiment extends StatelessWidget {
  const SellPopUpPageCondiment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
                    ?.where((element) => element.getstatusCondiment)
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
                  itemCount: state.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisExtent: 50,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return BlocSelector<
                      SellBloc,
                      SellState,
                      (String?, List<ModelItemPesanan>?, String?)
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
                        if (stateCondiment.$2!.isNotEmpty) {
                          qtyitem = stateCondiment.$2!
                              .firstWhere(
                                (element) =>
                                    state[index].getidItem == element.getidItem,
                              )
                              .getqtyItem;
                        }

                        return Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(15),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () {
                              ModelItemPesanan selectedItemCondiment =
                                  ModelItemPesanan(
                                    priceItemCustom: state[index].getpriceItem,
                                    subTotal: state[index].getpriceItem,
                                    idBranch: state[index].getidBranch,
                                    namaItem: state[index].getnameItem,
                                    idItem: state[index].getidItem,
                                    idOrdered: stateCondiment.$1!,
                                    qtyItem: qtyitem + 1,
                                    priceItem: state[index].getpriceItem,
                                    discountItem: 0,
                                    idCategoryItem:
                                        state[index].getidCategoryiItem,
                                    idCondiment: stateCondiment.$3!,
                                    note: "",
                                    urlImage: "",
                                    condiment: [],
                                  );
                              context.read<SellBloc>().add(
                                SellSelectedCondiment(
                                  selectedCondiment: selectedItemCondiment,
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text(
                                    state[index].getnameItem,
                                    style: lv05TextStyle,
                                  ),
                                  Spacer(),
                                  Text(
                                    "${formatQty(qtyitem)}x",
                                    style: lv05TextStyleRed,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
