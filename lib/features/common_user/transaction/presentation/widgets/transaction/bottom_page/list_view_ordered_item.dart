import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_bloc.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/pop_item/main_page/popup_item.dart';
import 'package:flutter_pos/function/bottom_sheet.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_partner.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition_text/transition_navigator/transition_up_down.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';

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
                return state.itemOrdered ?? const [];
              }
              return const [];
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
                                    context: context,
                                    resetItemForm: () {
                                      context.read<TransactionBloc>().add(
                                        TransactionResetSelectedItem(),
                                      );
                                    },
                                    content: (scrollController) {
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
                                                          formatPriceRp(
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
                                                    color: AppPropertyColor
                                                        .primarylight3,
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
                                                            formatPriceRp(
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
              child: customButtonIcon(
                onPressed: () {
                  customBottomSheet(
                    context: context,
                    resetItemForm: () {},
                    content: (scrollController) {
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
                                      return state.dataPartner ?? const [];
                                    }
                                    return const [];
                                  },
                                  builder: (context, state) {
                                    return ListView.builder(
                                      controller: scrollController,
                                      itemCount: state!.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: CircleAvatar(
                                            child: Icon(
                                              Icons.person,
                                              size: lv2IconSize,
                                            ),
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
                              onPressed: () async {
                                context.read<PartnerBloc>().add(
                                  PartnerStatusPartner(
                                    isCustomer:
                                        (context.read<TransactionBloc>().state
                                                as TransactionLoaded)
                                            .isSell,
                                  ),
                                );
                                await navUpDownTransition(
                                  context,
                                  '/partner',
                                  false,
                                );
                              },
                              icon: const Icon(Icons.add),
                              label: Text(
                                "Tambah Kontak Baru",
                                style: lv05TextStyle,
                              ),
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
                    },
                  );
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
                backgroundColor: AppPropertyColor.primary,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: customButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  context.read<TransactionBloc>().add(
                    TransactionResetOrderedItem(),
                  );
                },
                child: Icon(Icons.delete, color: Colors.red),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: customButton(
                onPressed: () {
                  final bloc = context.read<TransactionBloc>();
                  if (bloc.state is TransactionLoaded) {
                    final itemOrdered =
                        (bloc.state as TransactionLoaded).itemOrdered!;
                    final listItem =
                        (bloc.state as TransactionLoaded).dataItem!;
                    if (itemOrdered.isEmpty) {
                      return customSnackBar(context, "Belum ada Pesanan!");
                    } else if (UserSession.getStatusFifo() &&
                        (bloc.state as TransactionLoaded).isSell) {
                      Map<String, double> dataItem = {};
                      itemOrdered.forEach((element) {
                        dataItem.containsKey(element.getidItem)
                            ? dataItem[element.getidItem] =
                                  dataItem[element.getidItem]! +
                                  element.getqtyItem
                            : dataItem[element.getidItem] = element.getqtyItem;
                      });

                      final isQtyNotEnough = dataItem.entries.any((entry) {
                        final key = entry.key;
                        final value = entry.value;

                        final item = listItem.firstWhere(
                          (element) => element.getidItem == key,
                        );

                        return item.getqtyItem < value;
                      });
                      if (isQtyNotEnough) {
                        return customSnackBar(
                          context,
                          "FIFO: Ada Item yang melebihi batas jumlah Stok!",
                        );
                      }
                    }
                  }

                  navUpDownTransition(context, '/sellpayment', false);
                },
                child: Icon(Icons.attach_money_rounded, color: Colors.white),
                backgroundColor: AppPropertyColor.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
