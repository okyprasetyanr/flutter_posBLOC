import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/history_financial/logic/history_financial_bloc.dart';
import 'package:flutter_pos/features/history_financial/logic/history_financial_event.dart';
import 'package:flutter_pos/features/history_financial/logic/history_financial_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/common_widget/custom_dropdown_filter.dart';
import 'package:flutter_pos/widget/common_widget/date_picker.dart';
import 'package:flutter_pos/widget/common_widget/row_content.dart';
import 'package:flutter_pos/widget/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/widget/common_widget/widget_dropdown_branch.dart';

class UiHistoryFinancial extends StatefulWidget {
  const UiHistoryFinancial({super.key});

  @override
  State<UiHistoryFinancial> createState() => _UiHistoryFinancialState();
}

class _UiHistoryFinancialState extends State<UiHistoryFinancial> {
  final searchController = TextEditingController();
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

  void _initData() {
    context.read<HistoryFinancialBloc>().add(HistoryFinancialGetData());
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

  Widget layoutTop() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Riwayat Kas", style: titleTextStyle),
            SizedBox(
              width: 80,
              height: 40,
              child:
                  BlocSelector<
                    HistoryFinancialBloc,
                    HistoryFinancialState,
                    bool
                  >(
                    selector: (state) {
                      if (state is HistoryFinancialLoaded) {
                        return state.isIncome;
                      }
                      return true;
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          context.read<HistoryFinancialBloc>().add(
                            HistoryFinancialGetData(isIncome: !state),
                          );
                        },
                        child: WidgetAnimatePage(
                          change: state,
                          text1: "Pendapatan",
                          text2: "Pengeluaran",
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
                enable: true,
                controller: searchController,
                inputType: TextInputType.text,
                text: "Cari",
                onChanged: (value) {
                  context.read<HistoryFinancialBloc>().add(
                    HistoryFinancialSearchData(search: value),
                  );
                },
              ),
            ),
            const SizedBox(width: 10),

            BlocSelector<
              HistoryFinancialBloc,
              HistoryFinancialState,
              (DateTime?, DateTime?)
            >(
              selector: (state) {
                if (state is HistoryFinancialLoaded) {
                  return (state.dateStart, state.dateEnd);
                }
                return (dateNowYMDBLOC(), dateNowYMDBLOC());
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
                      false,
                      "Tanggal mulai",
                      context,
                      parseDate(
                        date: formatDate(date: DateTime.now()),
                        minute: false,
                      ),
                      (picked) => pickedDateStart = picked,
                    );

                    await customDatePicker(
                      true,
                      "Tanggal selesai",
                      context,
                      parseDate(
                        date: formatDate(date: DateTime.now()),
                        minute: false,
                      ),
                      (picked) => pickedDateEnd = picked,
                    );

                    context.read<HistoryFinancialBloc>().add(
                      HistoryFinancialGetData(
                        dateStart: pickedDateStart,
                        dateEnd: pickedDateEnd,
                        idBranch: null,
                      ),
                    );
                  },
                  label: Text(
                    state.$1 == null ||
                            formatDate(date: state.$1!, minute: false) ==
                                    formatDate(
                                      date: DateTime.now(),
                                      minute: false,
                                    ) &&
                                formatDate(date: state.$2!, minute: false) ==
                                    formatDate(
                                      date: DateTime.now(),
                                      minute: false,
                                    )
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
                final bloc = context.read<HistoryFinancialBloc>();
                bloc.add(HistoryFinancialResetSelectedData());
                bloc.add(HistoryFinancialGetData());
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
                filters: ["All", ...listStatusTransactionFinancial],
                text: "Pilih Filter",
                selectedValue: (indexFilter) {
                  context.read<HistoryFinancialBloc>().add(
                    HistoryFinancialSelectedFilter(indexFilter: indexFilter),
                  );
                  searchController.clear();
                },
              ),
            ),
            SizedBox(
              width: 150,
              child:
                  BlocSelector<
                    HistoryFinancialBloc,
                    HistoryFinancialState,
                    String
                  >(
                    selector: (state) => state is HistoryFinancialLoaded
                        ? state.idBranch ?? ""
                        : "",
                    builder: (context, state) {
                      return WidgetDropdownBranch(
                        idBranch: state,
                        selectedIdBranch: (selectedIdBranch) {
                          searchController.clear();
                          context.read<HistoryFinancialBloc>().add(
                            HistoryFinancialGetData(idBranch: selectedIdBranch),
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
                HistoryFinancialBloc,
                HistoryFinancialState,
                List<ModelTransactionFinancial>?
              >(
                selector: (state) {
                  if (state is HistoryFinancialLoaded) {
                    return state.filteredData;
                  }
                  return [];
                },
                builder: (context, state) {
                  if (state == null) {
                    return customSpinKit();
                  }
                  return ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      final dataTransaction = state[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 6,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(0, 0),
                            padding: EdgeInsets.all(8),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                          ),
                          onPressed: () {
                            context.read<HistoryFinancialBloc>().add(
                              HistoryFinancialSelectedData(
                                selectedData: dataTransaction,
                              ),
                            );
                          },
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
                                    formatDate(date: dataTransaction.getdate),
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
                                      "${formatPriceRp(dataTransaction.getamount)}",
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
      HistoryFinancialBloc,
      HistoryFinancialState,
      (ModelTransactionFinancial?, bool)
    >(
      selector: (state) {
        if (state is HistoryFinancialLoaded) {
          return (state.selectedData, state.isIncome);
        }
        return (null, true);
      },
      builder: (context, state) {
        if (state.$1 == null) {
          return Text("Pilih Data Kas", style: lv05TextStyle);
        }
        final transaction = state.$1!;
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    rowContent("Nomor Faktur", transaction.getinvoice),
                    rowContent("Tanggal", transaction.getdate.toString()),
                    rowContent("Status", transaction.getstatusTransaction!),
                    rowContent("Total", formatPriceRp(transaction.getamount)),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            transaction.getstatusTransaction ==
                                    statusTransaction(index: 3)
                                ? customSnackBar(context, "Sudah diBatalkan!")
                                : context.read<HistoryFinancialBloc>().add(
                                    HistoryFinancialCancelData(),
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
                            context.read<HistoryFinancialBloc>().add(
                              HistoryFinancialResetSelectedData(),
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

  Future<void> refreshIndicator() async {
    await context.read<DataUserRepositoryCache>().initTransIncome();
    await context.read<DataUserRepositoryCache>().initTransExpense();
    _initData();
  }
}
