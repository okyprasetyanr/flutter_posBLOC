import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/history_transaction/logic/history_transaction_bloc.dart';
import 'package:flutter_pos/features/history_transaction/logic/history_transaction_event.dart';
import 'package:flutter_pos/features/history_transaction/logic/history_transaction_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/common_widget/date_picker.dart';
import 'package:flutter_pos/widget/common_widget/row_content.dart';
import 'package:flutter_pos/widget/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_date.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UIHistoryTransaction extends StatefulWidget {
  const UIHistoryTransaction({super.key});

  @override
  State<UIHistoryTransaction> createState() => _UIHistoryTransactionState();
}

class _UIHistoryTransactionState extends State<UIHistoryTransaction> {
  final searchController = TextEditingController();

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
    await context.read<DataUserRepositoryCache>().initTransactionSell();
    await context.read<DataUserRepositoryCache>().initTransactionBuy();
    _initData();
  }

  void _initData() {
    context.read<HistoryTransactionBloc>().add(
      HistoryTransactionGetData(dateStart: null, dateEnd: null, idBranch: null),
    );
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
                      return Stack(
                        children: [
                          WidgetAnimatePage(
                            state: state,
                            text1: "Penjualan",
                            text2: "Pembelian",
                          ),
                        ],
                      );
                    },
                  ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: lv05TextStyle,
                  labelText: "Search",
                  labelStyle: lv05TextStyle,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
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
              (DateTime?, DateTime?)
            >(
              selector: (state) {
                if (state is HistoryTransactionLoaded) {
                  return (state.dateStart!, state.dateEnd!);
                }
                return (null, null);
              },
              builder: (context, state) {
                return ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(0, 0),
                    padding: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    DateTime? pickedDateStart, pickedDateEnd;
                    await customDatePicker(
                      "Tanggal mulai",
                      context,
                      parseDate(
                        date: formatDate(date: DateTime.now()),
                        minute: false,
                      ),
                      (picked) => pickedDateStart = picked,
                    );

                    await customDatePicker(
                      "Tanggal selesai",
                      context,
                      parseDate(
                        date: formatDate(date: DateTime.now()),
                        minute: false,
                      ),
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
                  label: Text(
                    state.$1 == null || state.$1 == state.$2
                        ? "Hari ini"
                        : "${formatDate(date: state.$1!, minute: false)} - ${formatDate(date: state.$2!, minute: false)}",
                    style: lv05TextStyle,
                  ),
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
              },
              child: Icon(Icons.refresh_rounded),
            ),
          ],
        ),
        Expanded(
          child:
              BlocSelector<
                HistoryTransactionBloc,
                HistoryTransactionState,
                List<ModelTransaction>?
              >(
                selector: (state) {
                  if (state is HistoryTransactionLoaded) {
                    return state.isSell
                        ? state.filteredSell
                        : state.filteredBuy;
                  }
                  return [];
                },
                builder: (context, state) {
                  if (state == null) {
                    return const SpinKitThreeBounce(
                      color: Colors.blue,
                      size: 15.0,
                    );
                  }
                  return ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      final dataTransaction = state[index];
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(0, 0),
                          padding: EdgeInsets.all(8),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(8),
                          ),
                        ),
                        onPressed: () {
                          context.read<HistoryTransactionBloc>().add(
                            HistoryTransactionSelectedData(
                              selectedData: dataTransaction,
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  dataTransaction.getinvoice,
                                  style: lv05TextStyle,
                                ),
                                Text(
                                  dataTransaction.getdate.toString(),
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
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              "${dataTransaction.getstatusTransaction}",
                                          style:
                                              dataTransaction
                                                      .getstatusTransaction ==
                                                  statusTransaction(index: 0)
                                              ? lv05textStylePrice
                                              : lv05TextStyleRedPrice,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "${dataTransaction.getpaymentMethod}",
                                    style: lv05TextStyle,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "${dataTransaction.gettotal}",
                                    style: lv05textStylePrice,
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
                      );
                    },
                  );
                },
              ),
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return BlocSelector<
      HistoryTransactionBloc,
      HistoryTransactionState,
      ModelTransaction?
    >(
      selector: (state) {
        if (state is HistoryTransactionLoaded) {
          return state.selectedData;
        }
        return null;
      },
      builder: (context, state) {
        if (state == null) {
          return Text("Pilih Data transaksi", style: lv05TextStyle);
        }
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    rowContent("Nomor Faktur", state.getinvoice),
                    rowContent("Tanggal", state.getdate.toString()),
                    rowContent("Kontak", state.getnamePartner),
                    rowContent("Pembayaran", state.getpaymentMethod),
                    state.getbankName != null
                        ? rowContent("Bank Name", state.getdate.toString())
                        : const SizedBox.shrink(),

                    rowContent("Operator", state.getnameOperator),
                    rowContent("Status", state.getstatusTransaction!),
                    ...state.getitemsOrdered.map((item) {
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
                    rowContent("Sub Total", formatPriceRp(state.getsubTotal)),
                    rowContent(
                      "Total Item",
                      state.getitemsOrdered.length.toString(),
                    ),
                    rowContent(
                      "Diskon (${state.getdiscount}%)",
                      formatPriceRp(state.gettotalDiscount),
                    ),
                    rowContent(
                      "Diskon (${state.getppn}%)",
                      formatPriceRp(state.gettotalPpn),
                    ),
                    rowContent(
                      "Diskon (${state.getcharge}%)",
                      formatPriceRp(state.gettotalCharge),
                    ),
                    rowContent("Total", formatPriceRp(state.gettotal)),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            List<Map<String, dynamic>> dataExpiredItem = [];
                            state.getstatusTransaction ==
                                    statusTransaction(index: 3)
                                ? customSnackBar(context, "Sudah diBatalkan!")
                                : showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                        "Konfirmasi",
                                        style: lv2TextStyle,
                                      ),
                                      content: Column(
                                        children: [
                                          Text(
                                            "Tanggal Kadaluarsa apabila tersedia:",
                                            style: lv05TextStyle,
                                          ),
                                          ...state.getitemsOrdered.map((item) {
                                            dataExpiredItem.add({
                                              'id_ordered': item.getidOrdered,
                                            });
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "${item.getnameItem}:",
                                                  style: lv05TextStyle,
                                                ),
                                                WidgetCustomDate(
                                                  onSelected: (day, month, year) {
                                                    final index = dataExpiredItem
                                                        .indexWhere(
                                                          (element) =>
                                                              element['id_ordered'] ==
                                                              item.getidOrdered,
                                                        );
                                                    final date =
                                                        "$year-$month-$day";
                                                    dataExpiredItem[index]['expired_date'] =
                                                        date;
                                                  },
                                                ),
                                              ],
                                            );
                                          }),
                                        ],
                                      ),
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
                                          onPressed: () {
                                            context
                                                .read<HistoryTransactionBloc>()
                                                .add(
                                                  HistoryTransactionRemoveData(
                                                    dataExpiredItem,
                                                    context: context,
                                                  ),
                                                );
                                            Navigator.pop(context, true);
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
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(8),
                            elevation: 2,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                          ),
                          child: Icon(
                            Icons.delete_forever_rounded,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Konfirmasi", style: lv2TextStyle),
                                content: Text.rich(
                                  TextSpan(
                                    text: "Revisi ${state.getinvoice}?",
                                    style: lv1TextStyle,
                                    children: [
                                      TextSpan(
                                        text:
                                            "\nKonfirmasi Revisi berarti membatalkan Transaksi ini dan memulai Revisi.",
                                        style: lv05TextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                    child: Text("Batal", style: lv1TextStyle),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .read<HistoryTransactionBloc>()
                                          .add(
                                            HistoryTransactionRevisionData(
                                              context: context,
                                            ),
                                          );
                                      Navigator.pop(context, true);
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
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                          ),
                          child: Icon(Icons.edit_rounded, color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(8),
                            elevation: 2,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                          ),
                          child: Icon(
                            Icons.print_rounded,
                            color: AppColor.primary,
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            context.read<HistoryTransactionBloc>().add(
                              HistoryTransactionResetData(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(8),
                            elevation: 2,
                            backgroundColor: AppColor.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                          ),
                          child: Icon(Icons.close_rounded, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
