import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/top_page/pop_item/page_item/name_and_qty.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';

class SellPopUpPageItem extends StatelessWidget {
  final noteController;
  final priceController;
  final customDiscountController;
  const SellPopUpPageItem({
    super.key,
    required this.noteController,
    required this.priceController,
    required this.customDiscountController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SellPopUpNameAndQty(),
          SizedBox(height: 10),
          TextField(
            style: lv05TextStyle,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              labelText: "Catatan",
              labelStyle: lv05TextStyle,
              contentPadding: EdgeInsets.zero,
              hintText: "Catatan...",
              hintStyle: lv05TextStyle,
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            controller: noteController,
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Harga: ", style: lv05TextStyle),

                      SizedBox(height: 20),
                      SizedBox(
                        child: TextField(
                          controller: customDiscountController,
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.number,
                          style: lv05TextStyle,
                          decoration: InputDecoration(
                            suffixText: "%",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: "Custom Disc",
                            labelStyle: lv05TextStyle,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TextInputFormatter.withFunction((
                              oldValue,
                              newValue,
                            ) {
                              final customDiscount = newValue.text;
                              final intValue =
                                  int.tryParse(
                                    customDiscount.isEmpty
                                        ? "0"
                                        : customDiscount,
                                  ) ??
                                  0;
                              if (intValue > 100) {
                                customSnackBar(context, "Jumlah melebihi 100%");
                                return oldValue;
                              }
                              context.read<SellBloc>().add(
                                SellAdjustItem(
                                  discount: customDiscount.isEmpty
                                      ? 0
                                      : intValue,
                                ),
                              );
                              return newValue;
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Diskon:", style: lv05TextStyle),
                      const SizedBox(height: 8),
                      BlocSelector<SellBloc, SellState, int?>(
                        selector: (state) {
                          if (state is SellLoaded &&
                              state.selectedItem != null) {
                            return state.selectedItem!.getdiscountItem;
                          }
                          return null;
                        },
                        builder: (context, state) {
                          if (state == null) {
                            return SizedBox.shrink();
                          }
                          final diskonList = [10, 25, 50];
                          return Column(
                            children: diskonList.map((diskon) {
                              final isSelected = state == diskon;
                              return ElevatedButton.icon(
                                onPressed: () {
                                  if (customDiscountController
                                      .text
                                      .isNotEmpty) {
                                    customDiscountController.clear();
                                  }

                                  context.read<SellBloc>().add(
                                    SellAdjustItem(discount: diskon),
                                  );
                                },
                                icon: const Icon(Icons.check_rounded),
                                label: Text(
                                  "$diskon%",
                                  style: isSelected
                                      ? lv05TextStyleWhite
                                      : lv05TextStyle,
                                ),
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    isSelected
                                        ? AppColor.primary
                                        : Colors.white,
                                  ),
                                  iconColor: WidgetStatePropertyAll(
                                    isSelected ? Colors.white : Colors.black,
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
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
                              if (stateCondiment.$1 == null) {
                                return Spacer();
                              }
                              double qtyitem = stateCondiment.$2!
                                  .firstWhere(
                                    (element) =>
                                        state[index].getidItem ==
                                        element.getidItem,
                                  )
                                  .getqtyItem;
                              return Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(15),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(15),
                                  onTap: () {
                                    ModelItemPesanan selectedItemCondiment =
                                        ModelItemPesanan(
                                          subTotal: state[index].getpriceItem,
                                          idCabang: state[index].getidBranch,
                                          namaItem: state[index].getnameItem,
                                          idItem: state[index].getidItem,
                                          idPesanan: stateCondiment.$1!,
                                          qtyItem: qtyitem,
                                          hargaItem: state[index].getpriceItem,
                                          diskonItem: 0,
                                          idKategoriItem:
                                              state[index].getidCategoryiItem,
                                          idCondimen: stateCondiment.$3!,
                                          catatan: "",
                                          urlGambar: "",
                                          condiment: [],
                                        );
                                    context.read<SellBloc>().add(
                                      SellSelectedCondiment(
                                        selectedCondiment:
                                            selectedItemCondiment,
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
          ),
        ],
      ),
    );
  }
}
