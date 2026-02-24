import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_event.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_bloc.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_event.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/common_widget/widget_custom_dropdown_filter.dart';
import 'package:flutter_pos/common_widget/date_picker.dart';
import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';

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
      title: "Riwayat Kas",
      contentAppBar: SizedBox(
        width: 143,
        height: 28,
        child: BlocSelector<HistoryFinancialBloc, HistoryFinancialState, bool>(
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
                showAt1: 5,
                showAt2: 0,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget layoutTop() {
    return Column(
      children: [
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
              (DateTime?, DateTime?, String)
            >(
              selector: (state) {
                if (state is HistoryFinancialLoaded) {
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

                    context.read<HistoryFinancialBloc>().add(
                      HistoryFinancialGetData(
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
              backgroundColor: AppPropertyColor.white,
              child: const Icon(
                Icons.refresh_rounded,
                color: AppPropertyColor.black,
              ),
              onPressed: () {
                searchController.clear();
                final bloc = context.read<HistoryFinancialBloc>();
                bloc.add(HistoryFinancialResetSelectedData());
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
                    .select<HistoryFinancialBloc, ListStatusTransaction>((
                      bloc,
                    ) {
                      final state = bloc.state;
                      if (state is HistoryFinancialLoaded) {
                        return state.filter;
                      }
                      return ListStatusTransaction.All;
                    }),
                filters: listStatusTransaction
                    .where(
                      (element) =>
                          element != ListStatusTransaction.Tersimpan &&
                          element != ListStatusTransaction.Revisi,
                    )
                    .toList(),
                text: "Pilih Filter",
                selectedValue: (selectedEnum) {
                  context.read<HistoryFinancialBloc>().add(
                    HistoryFinancialSelectedFilter(filter: selectedEnum),
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
                List<ModelTransactionFinancial>
              >(
                selector: (state) {
                  if (state is HistoryFinancialLoaded) {
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
                              context.read<HistoryFinancialBloc>().add(
                                HistoryFinancialSelectedData(
                                  selectedData: dataTransaction,
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: customTextBorder(
                                      dataTransaction.getnameFinancial,
                                      lv1TextStyleWhite,
                                    ),
                                  ),
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
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
                return Center(
                  child: Text(
                    "Pilih Data Kas",
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
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        rowContent("Nomor Faktur", transaction.getinvoice),
                        rowContent("Tanggal", transaction.getdate.toString()),
                        rowContent(
                          "Status",
                          transaction.getstatusTransaction!.name,
                        ),
                        rowContent(
                          "Catatan:",
                          transaction.getnote.isEmpty
                              ? "-"
                              : transaction.getnote,
                        ),
                        rowContent(
                          transaction.getnameFinancial,
                          formatPriceRp(transaction.getamount),
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
                        child: Icon(
                          Icons.delete_forever_rounded,
                          color: AppPropertyColor.deleteOrClose,
                        ),
                        onPressed: () {
                          transaction.getstatusTransaction ==
                                  ListStatusTransaction.Batal
                              ? customSnackBar(context, "Sudah diBatalkan!")
                              : context.read<HistoryFinancialBloc>().add(
                                  HistoryFinancialCancelData(),
                                );
                        },
                      ),
                      const SizedBox(width: 10),
                      customButton(
                        backgroundColor: AppPropertyColor.white,
                        child: const Icon(
                          Icons.print_rounded,
                          color: AppPropertyColor.primary,
                        ),
                        onPressed: () => context.read<PrinterBloc>().add(
                          PrintData(
                            data: state.$1,
                            type: PrintFormatType.transaction_financial,
                            history: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      customButton(
                        backgroundColor: AppPropertyColor.primary,
                        child: Icon(
                          Icons.close_rounded,
                          color: AppPropertyColor.white,
                        ),
                        onPressed: () {
                          context.read<HistoryFinancialBloc>().add(
                            HistoryFinancialResetSelectedData(),
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

  Future<void> refreshIndicator() async {
    await context.read<DataUserRepositoryCache>().initTransFinancial();
    _initData();
  }
}
