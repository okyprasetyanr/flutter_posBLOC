import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/top_page/pop_item/page_item/name_and_qty.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/top_page/pop_item/page_item/price_and_custom_price.dart';
import 'package:flutter_pos/function/function.dart';
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
          Row(
            children: [
              Flexible(
                child: TextField(
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
              ),
              const SizedBox(width: 20),
              Flexible(
                child: TextField(
                  style: lv1TextStyleDisable,
                  enabled: false,
                  controller: TextEditingController(
                    text:
                        "${formatUang(context.select<SellBloc, double?>((value) {
                          final state = value.state;
                          if (state is SellLoaded && state.selectedItem != null) {
                            return state.selectedItem!.getsubTotal;
                          }
                          return 0;
                        })!)}",
                  ),
                  decoration: InputDecoration(
                    label: Text(
                      "Sub Total:",
                      style: lv05TextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
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
                      SellPopUpPriceAndCustomPrice(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 4,
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
                          return Wrap(
                            spacing: 8,
                            runSpacing: 8,
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
                                  padding: WidgetStatePropertyAll(
                                    EdgeInsets.zero,
                                  ),
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
                      const SizedBox(height: 5),
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
            ],
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
