import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/common_widget/widget_custom_row_list_item.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/enum_and_string/enum.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_event.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_state.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_event.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_by.dart';
import 'package:flutter_pos/from_and_to_map/from_isar.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition_text/transition_navigator/transition_up_down.dart';

class HistoryTransactionDetail extends StatelessWidget {
  const HistoryTransactionDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
                                final batches = item.getitemOrderedBatch;
                                final Map<double, double> grouped = {};

                                for (final batch in batches) {
                                  final price = batch.getprice_item;
                                  final qty = batch.getqty_item;

                                  grouped.update(
                                    price,
                                    (existingQty) => existingQty + qty,
                                    ifAbsent: () => qty,
                                  );
                                }
                                final entries = grouped.entries.toList();
                                final valueQty = entries
                                    .map((e) => formatQtyOrPrice(e.value))
                                    .join("\n");

                                final valuePrice = entries
                                    .map((e) => formatPriceRp(e.key))
                                    .join("\n");

                                return Column(
                                  children: [
                                    customRowListItem(
                                      row1: item.getnameItem,
                                      row2: formatDisc(item.getdiscountItem),
                                      row3: valueQty,
                                      row4: valuePrice,
                                    ),
                                    ...item.getCondiment.map((condiment) {
                                      return customRowListItem(
                                        condiment: true,
                                        row1: condiment.getnameItem,
                                        row2: formatDisc(
                                          condiment.getdiscountItem,
                                        ),
                                        row3: formatQtyOrPrice(
                                          condiment.getqtyItem,
                                        ),
                                        row4: formatPriceRp(
                                          condiment.getsubTotal,
                                        ),
                                      );
                                    }),
                                  ],
                                );
                              }),
                              const Divider(
                                thickness: 1,
                                height: 5,
                                color: AppPropertyColor.greyLight,
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
                        onPressed: () async {
                          if (transaction.getstatusTransaction ==
                              ListStatusTransaction.Batal) {
                            return customSnackBar(context, "Sudah diBatalkan!");
                          }
                          if (!state.$2) {
                            final dataBatch = fromIsarBatch(
                              await getBatchIsarByInvoice(
                                transaction.getinvoice,
                              ),
                            );
                            if (UserSession.getStatusFifo()) {
                              if (dataBatch.getitems_batch.any(
                                (element) => element.getqtyItem_out > 0,
                              )) {
                                return customSnackBar(
                                  context,
                                  "FIFO: Aktif, Stok Batch sudah terpakai, tidak dapat membatalkan!",
                                );
                              }
                            }
                          }
                          return confirmCancel(transaction, context: context);
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
                                            context: context,
                                            revisi: true,
                                            transaction,
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

  Future<void> confirmCancel(
    ModelTransaction transaction, {
    bool revisi = false,
    required BuildContext context,
  }) async {
    // List<Map<String, dynamic>> dataExpiredItem = [];
    final historyBloc = context.read<HistoryTransactionBloc>();
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
              Navigator.pop(context, true);
              historyBloc.add(HistoryTransactionCancelData());
              if (revisi) {
                navUpDownTransition(
                  context,
                  '/sell',
                  false,
                  arguments: {"revision": true, "transaction": transaction},
                );
              }
            },
            child: Text("Batalkan", style: lv1TextStyle),
          ),
        ],
      ),
    );
  }
}
