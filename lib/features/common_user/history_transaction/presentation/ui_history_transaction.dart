import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/common_widget/widget_custom_row_list_item.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_event.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_event.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/service/service_printer.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/common_widget/widget_custom_dropdown_filter.dart';
import 'package:flutter_pos/common_widget/date_picker.dart';
import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/common_widget/widget_animatePage.dart';
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
      contentAppBar: SizedBox(
        width: 123,
        height: 25,
        child:
            BlocSelector<HistoryTransactionBloc, HistoryTransactionState, bool>(
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
                    showAt1: 5,
                    showAt2: 0,
                  ),
                );
              },
            ),
      ),
      title: "Riwayat Transaksi",
      color: context.colorHist,
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
                return customButton(
                  backgroundColor: AppPropertyColor.white,
                  child: Text(state.$3, style: lv05TextStyle),
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
                );
              },
            ),

            const SizedBox(width: 10),
            customButton(
              child: const Icon(
                Icons.refresh_rounded,
                color: AppPropertyColor.black,
              ),
              backgroundColor: AppPropertyColor.white,
              onPressed: () {
                final bloc = context.read<HistoryTransactionBloc>();
                bloc.add(HistoryTransactionResetSelectedData());
                searchController.clear();
                _initData();
              },
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: WidgetDropDownFilter(
                initialValue: context
                    .select<HistoryTransactionBloc, ListStatusTransaction>((
                      bloc,
                    ) {
                      final state = bloc.state;
                      if (state is HistoryTransactionLoaded) {
                        return state.filter;
                      }
                      return ListStatusTransaction.All;
                    }),
                filters: listStatusTransaction
                    .where(
                      (element) => element != ListStatusTransaction.Tersimpan,
                    )
                    .toList(),
                text: "Pilih Filter",
                selectedValue: (selectedEnum) {
                  context.read<HistoryTransactionBloc>().add(
                    HistoryTransactionSelectedFilter(filter: selectedEnum),
                  );
                  searchController.clear();
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
                          color: AppPropertyColor.white,
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
                                      Expanded(
                                        child: Text.rich(
                                          TextSpan(
                                            text: "Status: ",
                                            style: lv05TextStyle,
                                            children: [
                                              TextSpan(
                                                text:
                                                    "${dataTransaction.getstatusTransaction!.name}",
                                                style:
                                                    dataTransaction
                                                            .getstatusTransaction ==
                                                        ListStatusTransaction
                                                            .Sukses
                                                    ? lv05textStylePrice
                                                    : lv05TextStyleRedPrice,
                                              ),
                                            ],
                                          ),
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
                                    "Tipe: ${dataTransaction.getpaymentMethod.name}",
                                    style: lv05TextStyle,
                                    textAlign: TextAlign.center,
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

  Future<void> confirmCancel(
    List<ModelItemOrdered> getitemsOrdered, {
    bool? revisi,
  }) async {
    // List<Map<String, dynamic>> dataExpiredItem = [];
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Konfirmasi", style: lv2TextStyle),
        // content: Column(
        //   children: [
        //     Text("Tanggal Kadaluarsa apabila tersedia:", style: lv05TextStyle),
        //     ...getitemsOrdered.map((item) {
        //       dataExpiredItem.add({'id_ordered': item.getidOrdered});
        //       return Column(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Text("${item.getnameItem}:", style: lv05TextStyle),
        //           WidgetCustomDate(
        //             onSelected: (day, month, year) {
        //               final index = dataExpiredItem.indexWhere(
        //                 (element) => element['id_ordered'] == item.getidOrdered,
        //               );
        //               final date = "$year-$month-$day";
        //               dataExpiredItem[index]['expired_date'] = date;
        //             },
        //           ),
        //         ],
        //       );
        //     }),
        //   ],
        // ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("Batal", style: lv1TextStyle),
          ),
          TextButton(
            onPressed: () {
              context.read<HistoryTransactionBloc>().add(
                HistoryTransactionCancelData(),
              );
              if (revisi != null) {
                context.read<HistoryTransactionBloc>().add(
                  HistoryTransactionRevisionData(context: context),
                );
              }
              Navigator.pop(context, true);
            },
            child: Text("Batalkan", style: lv1TextStyle),
          ),
        ],
      ),
    );
  }

  Widget layoutBottom() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            blurStyle: BlurStyle.outer,
            color: AppPropertyColor.black.withValues(alpha: 0.5),
          ),
        ],
      ),
      child:
          BlocSelector<
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
                return Center(
                  child: Text(
                    "Pilih Data transaksi",
                    style: lv05TextStyle,
                    textAlign: TextAlign.center,
                  ),
                );
              }
              final transaction = state.$1!;
              return Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: customTextBorder(
                      "Detail Transaksi",
                      lv2TextStyleWhite,
                      color: context.colorHist,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        rowContent("Nomor Faktur", transaction.getinvoice),
                        rowContent("Tanggal", transaction.getdate.toString()),
                        transaction.getnamePartner != null
                            ? rowContent("Kontak", transaction.getnamePartner!)
                            : const SizedBox.shrink(),
                        rowContent(
                          "Pembayaran",
                          transaction.getpaymentMethod.name,
                        ),
                        transaction.getbankName != null
                            ? rowContent(
                                "Bank Name",
                                transaction.getbankName.toString(),
                              )
                            : const SizedBox.shrink(),

                        rowContent("Operator", transaction.getnameOperator!),
                        rowContent(
                          "Status",
                          transaction.getstatusTransaction!.name,
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              customRowListItem(label: true),
                              ...transaction.getitemsOrdered.map((item) {
                                return Column(
                                  children: [
                                    customRowListItem(
                                      name: item.getnameItem,
                                      disc: formatDisc(item.getdiscountItem),
                                      quantity: formatQtyOrPrice(
                                        item.getqtyItem,
                                      ),
                                      total: formatPriceRp(item.getsubTotal),
                                    ),
                                    ...item.getCondiment.map((condiment) {
                                      return customRowListItem(
                                        condiment: true,
                                        name: condiment.getnameItem,
                                        disc: formatDisc(
                                          condiment.getdiscountItem,
                                        ),
                                        quantity: formatQtyOrPrice(
                                          condiment.getqtyItem,
                                        ),
                                        total: formatPriceRp(
                                          condiment.getsubTotal,
                                        ),
                                      );
                                    }),
                                  ],
                                );
                              }),
                              const SizedBox(
                                height: 1,
                                width: double.infinity,
                                child: const DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppPropertyColor.greyLight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
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
                          "PPN (${transaction.getppn}%)",
                          formatPriceRp(transaction.gettotalPpn),
                        ),
                        rowContent(
                          "Charge (${transaction.getcharge}%)",
                          formatPriceRp(transaction.gettotalCharge),
                        ),
                        rowContent(
                          "Total",
                          formatPriceRp(transaction.gettotal),
                          forTotal: true,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customButton(
                        backgroundColor: AppPropertyColor.white,
                        child: const Icon(
                          Icons.delete_forever_rounded,
                          color: AppPropertyColor.red,
                        ),
                        onPressed: () {
                          state.$2
                              ? transaction.getstatusTransaction ==
                                        ListStatusTransaction.Batal
                                    ? customSnackBar(
                                        context,
                                        "Sudah diBatalkan!",
                                      )
                                    : confirmCancel(transaction.getitemsOrdered)
                              : UserSession.fifo
                              ? context
                                        .read<DataUserRepositoryCache>()
                                        .dataBatch
                                        .where(
                                          (batch) =>
                                              batch.getinvoice ==
                                              state.$1!.getinvoice,
                                        )
                                        .expand((batch) => batch.getitems_batch)
                                        .every(
                                          (element) =>
                                              element.getqtyItem_out == 0,
                                        )
                                    ? confirmCancel(transaction.getitemsOrdered)
                                    : customSnackBar(
                                        context,
                                        "FIFO: Aktif, Stok Batch sudah terpakai, tidak dapat membatalkan!",
                                      )
                              : confirmCancel(state.$1!.getitemsOrdered);
                        },
                      ),
                      const SizedBox(width: 10),
                      customButton(
                        backgroundColor: AppPropertyColor.white,
                        child: const Icon(
                          Icons.edit_rounded,
                          color: AppPropertyColor.black,
                        ),
                        onPressed: () {
                          state.$1!.getstatusTransaction ==
                                  ListStatusTransaction.Batal
                              ? customSnackBar(
                                  context,
                                  "Transaksi sudah dibantalkan!",
                                )
                              : showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      "Konfirmasi",
                                      style: lv2TextStyle,
                                    ),
                                    content: const SizedBox.shrink(),

                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: Text(
                                          "Batal",
                                          style: lv1TextStyle,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.pop(context, true);
                                          await confirmCancel(
                                            revisi: true,
                                            state.$1!.getitemsOrdered,
                                          );
                                        },
                                        child: Text(
                                          "Hapus",
                                          style: lv1TextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                        },
                      ),
                      const SizedBox(width: 10),
                      customButton(
                        backgroundColor: AppPropertyColor.white,
                        child: const Icon(
                          Icons.print_rounded,
                          color: AppPropertyColor.black,
                        ),
                        onPressed: () => context.read<PrinterBloc>().add(
                          PrintData(
                            data: state.$1,
                            type: PrintFormatType.transaction_sell,
                            history: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      customButton(
                        backgroundColor: context.colorHist,
                        child: const Icon(
                          Icons.close_rounded,
                          color: AppPropertyColor.white,
                        ),
                        onPressed: () {
                          context.read<HistoryTransactionBloc>().add(
                            HistoryTransactionResetSelectedData(),
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
  }
}
