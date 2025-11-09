import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/features/transaction/presentation/widgets/transaction/pop_item/main_page/popup_item.dart';
import 'package:flutter_pos/function/bottom_sheet.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition/transition_navigator/transition_up_down.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';

class TransactionListViewOrderedItem extends StatelessWidget {
  const TransactionListViewOrderedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocSelector<TransactionBloc, TransactionState, List<ModelItemOrdered>>(
            selector: (state) {
              if (state is TransactionLoaded) {
                return state.itemOrdered ?? [];
              }
              return [];
            },
            builder: (context, state) {
              if (state.isEmpty) {
                return Text("Belum ada Pesanan!", style: lv1TextStyle);
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.length,
                        itemBuilder: (context, index) {
                          final item = state[index];
                          return ShaderMask(
                            shaderCallback: (bounds) {
                              return LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.02, 0.98, 1],
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.dstIn,
                            child: Material(
                              color: index % 2 == 0
                                  ? Colors.white
                                  : const Color.fromARGB(255, 235, 235, 235),
                              child: InkWell(
                                onTap: () {
                                  context.read<TransactionBloc>().add(
                                    TransactionSelectedItem(
                                      selectedItem: item,
                                      edit: true,
                                    ),
                                  );
                                  customBottomSheet(
                                    context,
                                    () {
                                      context.read<TransactionBloc>().add(
                                        TransactionResetSelectedItem(),
                                      );
                                    },
                                    (scrollController) {
                                      return UITransactionPopUpItem();
                                    },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/logo.png",
                                            height: 35,
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "${formatQtyOrPrice(item.getqtyItem)}x ${item.getnameItem}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            lv05TextStyleOrderedItem,
                                                      ),
                                                    ),

                                                    Row(
                                                      children: [
                                                        Text(
                                                          "(${item.getdiscountItem}%)",
                                                          style:
                                                              lv05textStylePriceCondiment,
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          formatUang(
                                                            item.getsubTotal,
                                                          ),
                                                          style:
                                                              lv05textStylePrice,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppColor.primarylight3,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          5,
                                                        ),
                                                  ),
                                                  padding: const EdgeInsets.all(
                                                    5,
                                                  ),
                                                  child: Column(
                                                    children: item.getCondiment.map((
                                                      condiment,
                                                    ) {
                                                      return Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "${formatQtyOrPrice(condiment.getqtyItem)}x ${condiment.getnameItem}",
                                                            style:
                                                                lv05TextStyle,
                                                          ),

                                                          Text(
                                                            formatUang(
                                                              condiment
                                                                  .getsubTotal,
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
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),

        Row(
          children: [
            Expanded(
              flex: 3,
              child: ElevatedButton.icon(
                onPressed: () {
                  customBottomSheet(context, () {}, (scrollController) {
                    return Column(
                      children: [
                        Text("Pilih Kontak", style: lv1TextStyleBold),

                        Expanded(
                          child:
                              BlocSelector<
                                TransactionBloc,
                                TransactionState,
                                List<ModelPartner>?
                              >(
                                selector: (state) {
                                  if (state is TransactionLoaded) {
                                    return state.dataPartner ?? [];
                                  }
                                  return [];
                                },
                                builder: (context, state) {
                                  return ListView.builder(
                                    controller: scrollController,
                                    itemCount: state!.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: const CircleAvatar(
                                          child: Icon(Icons.person, size: 20),
                                        ),
                                        title: Text(
                                          state[index].getname,
                                          style: lv05TextStyle,
                                        ),
                                        subtitle: Text(
                                          "${state[index].getphone}",
                                          style: lv05TextStyle,
                                        ),
                                        onTap: () {
                                          context.read<TransactionBloc>().add(
                                            TransactionSelectedPartner(
                                              selectedPartner: state[index],
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              customSnackBar(context, "Tambah Customer Baru!!");
                            },
                            icon: const Icon(Icons.add),
                            label: const Text("Tambah Customer Baru"),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
                },
                label: Text(
                  context.select<TransactionBloc, String>(
                    (value) => value.state is TransactionLoaded
                        ? (value.state as TransactionLoaded)
                                  .selectedPartner
                                  ?.getname ??
                              "Kontak"
                        : "Kontak",
                  ),
                  style: lv1TextStyleWhite,
                  overflow: TextOverflow.ellipsis,
                ),
                icon: Icon(Icons.contacts_rounded, color: Colors.white),
                style: ButtonStyle(
                  iconAlignment: IconAlignment.start,
                  minimumSize: WidgetStatePropertyAll(Size(0, 0)),
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                  ),
                  backgroundColor: WidgetStatePropertyAll(AppColor.primary),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  context.read<TransactionBloc>().add(
                    TransactionResetOrderedItem(),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                ),
                child: Icon(Icons.delete, color: Colors.red),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  final bloc = context.read<TransactionBloc>();
                  if (bloc.state is TransactionLoaded &&
                      (bloc.state as TransactionLoaded).itemOrdered!.isEmpty) {
                    return customSnackBar(context, "Belum ada Pesanan!");
                  }

                  navUpDownTransition(context, '/sellpayment', false);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColor.primary),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                ),
                child: Icon(Icons.attach_money_rounded, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
