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
import 'package:flutter_pos/widget/common_widget/row_content.dart';
import 'package:flutter_pos/widget/common_widget/widget_animatePage.dart';
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
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                                                  "Done"
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
                      return Column(
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

                          rowContent(
                            "Sub Total",
                            formatPriceRp(state.getsubTotal),
                          ),
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
                        ],
                      );
                    }),
                    Row(
                      children: [
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
                            Icons.delete_forever_rounded,
                            color: Colors.red,
                          ),
                        ),
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
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(8),
                            elevation: 2,
                            backgroundColor: AppColor.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                          ),
                          child: Icon(Icons.close_rounded, color: Colors.black),
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
