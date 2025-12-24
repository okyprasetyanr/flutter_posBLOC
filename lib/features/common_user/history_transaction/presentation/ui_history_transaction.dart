import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_event.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/function/service_dart.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/common_widget/widget_custom_dropdown_filter.dart';
import 'package:flutter_pos/common_widget/date_picker.dart';
import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/common_widget/widget_custom_date.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';

class UIHistoryTransaction extends StatefulWidget {
  const UIHistoryTransaction({super.key});

  @override
  State<UIHistoryTransaction> createState() => _UIHistoryTransactionState();
}

class _UIHistoryTransactionState extends State<UIHistoryTransaction> {
  final searchController = TextEditingController();
  final printerService = ServicePrinter();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: null,
      refreshIndicator: refreshIndicator,
    );
  }

  Future<void> refreshIndicator() async {
    await context.read<DataUserRepositoryCache>().initTransaction();
    _initData();
  }

  void _initData() {
    context.read<HistoryTransactionBloc>().add(HistoryTransactionGetData());
  }

  Widget layoutTop() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Riwayat Transaksi", style: titleTextStyle),
            SizedBox(
              width: 80,
              height: 40,
              child:
                  BlocSelector<
                    HistoryTransactionBloc,
                    HistoryTransactionState,
                    bool
                  >(
                    selector: (state) {
                      if (state is HistoryTransactionLoaded) {
                        return state.isSell;
                      }
                      return true;
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          context.read<HistoryTransactionBloc>().add(
                            HistoryTransactionGetData(isSell: !state),
                          );
                        },
                        child: WidgetAnimatePage(
                          change: state,
                          text1: "Penjualan",
                          text2: "Pembelian",
                        ),
                      );
                    },
                  ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: customTextField(
                context: context,
                controller: searchController,
                enable: true,
                inputType: TextInputType.text,
                text: "Cari",
                onChanged: (value) {
                  context.read<HistoryTransactionBloc>().add(
                    HistoryTransactionSearchData(search: value),
                  );
                },
              ),
            ),
            const SizedBox(width: 10),

            BlocSelector<
              HistoryTransactionBloc,
              HistoryTransactionState,
              (DateTime?, DateTime?, String)
            >(
              selector: (state) {
                if (state is HistoryTransactionLoaded) {
                  return (state.dateStart, state.dateEnd, state.displayDate);
                }
                return (dateNowYMDBLOC(), dateNowYMDBLOC(), "Hari ini");
              },
              builder: (context, state) {
                return ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(0, 0),
                    padding: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    DateTime? pickedDateStart, pickedDateEnd;
                    await customDatePicker(
                      false,
                      "Tanggal mulai",
                      context,
                      parseDate(date: DateTime.now(), minute: false),
                      (picked) => pickedDateStart = picked,
                    );

                    await customDatePicker(
                      true,
                      "Tanggal selesai",
                      context,
                      parseDate(date: DateTime.now(), minute: false),
                      (picked) => pickedDateEnd = picked,
                    );

                    context.read<HistoryTransactionBloc>().add(
                      HistoryTransactionGetData(
                        dateStart: pickedDateStart,
                        dateEnd: pickedDateEnd,
                        idBranch: null,
                      ),
                    );
                  },
                  label: Text(state.$3, style: lv05TextStyle),
                );
              },
            ),

            const SizedBox(width: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(0, 0),
                padding: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                searchController.clear();
                final bloc = context.read<HistoryTransactionBloc>();
                bloc.add(HistoryTransactionResetSelectedData());
                _initData();
              },
              child: Icon(Icons.refresh_rounded),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: WidgetDropDownFilter(
                filters: ["All", ...listStatusTransaction],
                text: "Pilih Filter",
                selectedValue: (indexFilter) {
                  context.read<HistoryTransactionBloc>().add(
                    HistoryTransactionSelectedFilter(indexFilter: indexFilter),
                  );
                },
              ),
            ),
            SizedBox(
              width: 150,
              child:
                  BlocSelector<
                    HistoryTransactionBloc,
                    HistoryTransactionState,
                    String
                  >(
                    selector: (state) => state is HistoryTransactionLoaded
                        ? state.idBranch ?? ""
                        : "",
                    builder: (context, state) {
                      return WidgetDropdownBranch(
                        idBranch: state,
                        selectedIdBranch: (selectedIdBranch) {
                          searchController.clear();
                          context.read<HistoryTransactionBloc>().add(
                            HistoryTransactionGetData(
                              idBranch: selectedIdBranch,
                            ),
                          );
                        },
                      );
                    },
                  ),
            ),
          ],
        ),

        Expanded(
          child:
              BlocSelector<
                HistoryTransactionBloc,
                HistoryTransactionState,
                List<ModelTransaction>
              >(
                selector: (state) {
                  if (state is HistoryTransactionLoaded) {
                    return state.filteredData;
                  }
                  return const [];
                },
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      final dataTransaction = state[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 6,
                        ),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              context.read<HistoryTransactionBloc>().add(
                                HistoryTransactionSelectedData(
                                  selectedData: dataTransaction,
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        dataTransaction.getinvoice,
                                        style: lv05TextStyle,
                                      ),
                                      Text(
                                        formatDate(
                                          date: dataTransaction.getdate,
                                        ),
                                        style: lv05TextStyle,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      //   Expanded(
                                      //     child: Text.rich(
                                      //       TextSpan(
                                      //         text: "Status: ",
                                      //         style: lv05TextStyle,
                                      //         children: [
                                      //           TextSpan(
                                      //             text:
                                      //                 "${dataTransaction.getstatusTransaction}",
                                      //             style:
                                      //                 dataTransaction
                                      //                         .getstatusTransaction ==
                                      //                     statusTransaction(
                                      //                       index: 0,
                                      //                     )
                                      //                 ? lv05textStylePrice
                                      //                 : lv05TextStyleRedPrice,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ),
                                      Expanded(
                                        child: Text(
                                          "${dataTransaction.getpaymentMethod}",
                                          style: lv05TextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${formatPriceRp(dataTransaction.gettotal)}",
                                          style: lv1TextStylePrimaryPrice,
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Catatan: ${dataTransaction.getnote}",
                                    style: lv05TextStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
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
  }

  Future<void> _expiredConfirm(
    List<ModelItemOrdered> getitemsOrdered, {
    bool? revisi,
  }) async {
    List<Map<String, dynamic>> dataExpiredItem = [];
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Konfirmasi", style: lv2TextStyle),
        content: Column(
          children: [
            Text("Tanggal Kadaluarsa apabila tersedia:", style: lv05TextStyle),
            ...getitemsOrdered.map((item) {
              dataExpiredItem.add({'id_ordered': item.getidOrdered});
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${item.getnameItem}:", style: lv05TextStyle),
                  WidgetCustomDate(
                    onSelected: (day, month, year) {
                      final index = dataExpiredItem.indexWhere(
                        (element) => element['id_ordered'] == item.getidOrdered,
                      );
                      final date = "$year-$month-$day";
                      dataExpiredItem[index]['expired_date'] = date;
                    },
                  ),
                ],
              );
            }),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("Batal", style: lv1TextStyle),
          ),
          TextButton(
            onPressed: () {
              context.read<HistoryTransactionBloc>().add(
                HistoryTransactionCancelData(dataExpiredItem, context: context),
              );
              if (revisi != null) {
                context.read<HistoryTransactionBloc>().add(
                  HistoryTransactionRevisionData(context: context),
                );
              }
              Navigator.pop(context, true);
            },
            child: Text("Hapus", style: lv1TextStyle),
          ),
        ],
      ),
    );
  }

  Widget layoutBottom() {
    return BlocSelector<
      HistoryTransactionBloc,
      HistoryTransactionState,
      (ModelTransaction?, bool)
    >(
      selector: (state) {
        if (state is HistoryTransactionLoaded) {
          return (state.selectedData, state.isSell);
        }
        return (null, true);
      },
      builder: (context, state) {
        if (state.$1 == null) {
          return Text("Pilih Data transaksi", style: lv05TextStyle);
        }
        final transaction = state.$1!;
        return Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  rowContent("Nomor Faktur", transaction.getinvoice),
                  rowContent("Tanggal", transaction.getdate.toString()),
                  rowContent("Kontak", transaction.getnamePartner),
                  rowContent("Pembayaran", transaction.getpaymentMethod),
                  transaction.getbankName != null
                      ? rowContent(
                          "Bank Name",
                          transaction.getbankName.toString(),
                        )
                      : const SizedBox.shrink(),

                  rowContent("Operator", transaction.getnameOperator),
                  rowContent("Status", transaction.getstatusTransaction!),
                  ...transaction.getitemsOrdered.map((item) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${formatQtyOrPrice(item.getqtyItem)}x ${item.getnameItem} (-${item.getdiscountItem}%)",
                                style: lv05TextStyle,
                              ),
                              Text(
                                "${formatPriceRp(item.getsubTotal)}",
                                style: lv05TextStyle,
                              ),
                            ],
                          ),
                          Text("Condiemnt", style: lv05TextStyle),
                          ...item.getCondiment.map((e) {
                            return Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${formatQtyOrPrice(item.getqtyItem)}x ${item.getnameItem} (-${item.getdiscountItem}%)",
                                    style: lv05TextStyle,
                                  ),
                                  Text(
                                    "${formatPriceRp(item.getsubTotal)}",
                                    style: lv05TextStyle,
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  }),
                  rowContent(
                    "Sub Total",
                    formatPriceRp(transaction.getsubTotal),
                  ),
                  rowContent(
                    "Total Item",
                    transaction.getitemsOrdered.length.toString(),
                  ),
                  rowContent(
                    "Diskon (${transaction.getdiscount}%)",
                    formatPriceRp(transaction.gettotalDiscount),
                  ),
                  rowContent(
                    "Diskon (${transaction.getppn}%)",
                    formatPriceRp(transaction.gettotalPpn),
                  ),
                  rowContent(
                    "Diskon (${transaction.getcharge}%)",
                    formatPriceRp(transaction.gettotalCharge),
                  ),
                  rowContent("Total", formatPriceRp(transaction.gettotal)),
                ],
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    state.$2
                        ? transaction.getstatusTransaction ==
                                  statusTransaction(index: 3)
                              ? customSnackBar(context, "Sudah diBatalkan!")
                              : _expiredConfirm(transaction.getitemsOrdered)
                        : UserSession.fifo
                        ? customSnackBar(
                            context,
                            "FIFO: Aktif, tidak dapat membatalkan Pembelian",
                          )
                        : _expiredConfirm(state.$1!.getitemsOrdered);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    elevation: 2,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Icon(Icons.delete_forever_rounded, color: Colors.red),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    state.$1!.getstatusTransaction ==
                            statusTransaction(index: 3)
                        ? customSnackBar(
                            context,
                            "Transaksi sudah dibantalkan!",
                          )
                        : showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Konfirmasi", style: lv2TextStyle),
                              content: SizedBox.shrink(),
                              // Text.rich(
                              //   TextSpan(
                              //     text: "Revisi ${state.$1!.getinvoice}?",
                              //     style: lv1TextStyle,
                              //     children: [
                              //       TextSpan(
                              //         text:
                              //             "\nKonfirmasi Revisi berarti membatalkan Transaksi ini dan memulai Revisi.",
                              //         style: lv05TextStyle,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: Text("Batal", style: lv1TextStyle),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context, true);
                                    await _expiredConfirm(
                                      revisi: true,
                                      state.$1!.getitemsOrdered,
                                    );
                                  },
                                  child: Text("Hapus", style: lv1TextStyle),
                                ),
                              ],
                            ),
                          );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    elevation: 2,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Icon(Icons.edit_rounded, color: Colors.black),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final printer = context.read<ServicePrinter>();
                    final isAvailable = await printer.getSavedMac() != null;
                    if (isAvailable) {
                      await printer.printTest();
                    } else {
                      customSnackBar(context, "Printer tidak tersambung");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    elevation: 2,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Icon(
                    Icons.print_rounded,
                    color: AppPropertyColor.primary,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<HistoryTransactionBloc>().add(
                      HistoryTransactionResetSelectedData(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    elevation: 2,
                    backgroundColor: AppPropertyColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Icon(Icons.close_rounded, color: Colors.white),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
