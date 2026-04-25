import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/date_picker.dart';
import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/features/common_user/history_adjustment/logic/history_adjustment_bloc.dart';
import 'package:flutter_pos/features/common_user/history_adjustment/logic/history_adjustment_event.dart';
import 'package:flutter_pos/features/common_user/history_adjustment/logic/history_adjustment_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction_adjustment_in.dart';
import 'package:flutter_pos/model_data/model_transaction_adjustment_out.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/template/dynamic_history_layout.dart';

class UiHistoryAdjustment extends StatefulWidget {
  const UiHistoryAdjustment({super.key});

  @override
  State<UiHistoryAdjustment> createState() => _UiHistoryAdjustmentState();
}

class _UiHistoryAdjustmentState extends State<UiHistoryAdjustment> {
  final searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HistoryLayout(
      layoutTop1: layoutTop1(),
      layoutTop2: layoutTop2(),
      header: header(),
      layoutBottom1: layoutBottom1(),
      layoutBottom2: layoutBottom2(),
      widgetNavigation: null,
      refreshIndicator: refreshIndicator,
      title: "Riwayat Penyesuaian",
      color: context.colorHistAdjustment,
      contentAppBar: SizedBox(
        width: 95,
        height: 28,
        child:
            BlocSelector<HistoryAdjustmentBloc, HistoryAdjustmentState, bool>(
              selector: (state) {
                if (state is HistoryAdjustmentLoaded) {
                  return state.isAdjustmentIn;
                }
                return true;
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    context.read<HistoryAdjustmentBloc>().add(
                      HistoryAdjustmentChangeMode(isAdjustmentIn: !state),
                    );
                  },
                  child: WidgetAnimatePage(
                    change: state,
                    text1: "Masuk",
                    text2: "Keluar",
                    showAt1: 5,
                    showAt2: 0,
                  ),
                );
              },
            ),
      ),
    );
  }

  Widget layoutTop1() {
    return BlocSelector<
      HistoryAdjustmentBloc,
      HistoryAdjustmentState,
      List<ModelTransactionAdjustmentIn>
    >(
      selector: (state) {
        if (state is HistoryAdjustmentLoaded) {
          return state.filteredDataAdjustmentIn;
        }
        return const [];
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            final dataTransaction = state[index];
            return cardLayout(
              name: dataTransaction.getitemName,
              invoice: dataTransaction.getinvoice,
              date: dataTransaction.getdate,
              note: dataTransaction.getnote,
              onTap: () {
                context.read<HistoryAdjustmentBloc>().add(
                  HistoryAdjustmentSelectedData<ModelTransactionAdjustmentIn>(
                    selectedData: dataTransaction,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget layoutBottom1() {
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
            HistoryAdjustmentBloc,
            HistoryAdjustmentState,
            ModelTransactionAdjustmentIn?
          >(
            selector: (state) {
              if (state is HistoryAdjustmentLoaded) {
                return state.selectedTransactionAdjustmentIn;
              }
              return null;
            },
            builder: (context, state) {
              if (state == null) {
                return Center(
                  child: Text(
                    "Pilih Data",
                    style: lv05TextStyle,
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: customTextBorder(
                      "Detail Transaksi",
                      lv2TextStyleWhite,
                      color: context.colorHistAdjustment,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        rowContent("Nomor Faktur", state.getinvoice),
                        rowContent("Tanggal", formatDate(date: state.getdate)),
                        rowContent("Catatan:", state.getnote),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      // customButton(
                      //   backgroundColor: AppPropertyColor.white,
                      //   child: Icon(
                      //     Icons.print_rounded,
                      //     color: context.colorHistAdjustment,
                      //   ),
                      //   onPressed: () => context.read<PrinterBloc>().add(
                      //     PrintData(
                      //       data: state.$1,
                      //       type: PrintFormatType.transaction_financial,
                      //       history: true,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(width: 10),
                      customButton(
                        backgroundColor: context.colorHistAdjustment,
                        child: Icon(
                          Icons.close_rounded,
                          color: AppPropertyColor.white,
                        ),
                        onPressed: () {
                          context.read<HistoryAdjustmentBloc>().add(
                            HistoryAdjustmentResetSelectedData(),
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
    await context.read<DataUserRepositoryCache>().initTransaction();
    context.read<HistoryAdjustmentBloc>().add(HistoryAdjustmentGetData());
  }

  Widget header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: customTextField(
                enable: true,
                controller: searchController,
                inputType: TextInputType.text,
                label: "Cari",
                onChanged: (value) {
                  context.read<HistoryAdjustmentBloc>().add(
                    HistoryAdjustmentSearchData(search: value),
                  );
                },
              ),
            ),
            const SizedBox(width: 10),

            BlocSelector<
              HistoryAdjustmentBloc,
              HistoryAdjustmentState,
              (DateTime?, DateTime?, String)
            >(
              selector: (state) {
                if (state is HistoryAdjustmentLoaded) {
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

                    context.read<HistoryAdjustmentBloc>().add(
                      HistoryAdjustmentGetData(
                        dateStart: pickedDateStart,
                        dateEnd: pickedDateEnd,
                      ),
                    );
                  },
                );
              },
            ),

            customButton(
              backgroundColor: AppPropertyColor.white,
              child: const Icon(
                Icons.refresh_rounded,
                color: AppPropertyColor.black,
              ),
              onPressed: () {
                searchController.clear();
                final bloc = context.read<HistoryAdjustmentBloc>();
                bloc.add(
                  HistoryAdjustmentGetData(
                    dateEnd: dateNowYMDBLOC(),
                    dateStart: dateNowYMDBLOC(),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 150,
          child:
              BlocSelector<
                HistoryAdjustmentBloc,
                HistoryAdjustmentState,
                String
              >(
                selector: (state) => state is HistoryAdjustmentLoaded
                    ? state.idBranch ?? ""
                    : "",
                builder: (context, state) {
                  return WidgetDropdownBranch(
                    idBranch: state,
                    selectedIdBranch: (selectedIdBranch) {
                      searchController.clear();
                      context.read<HistoryAdjustmentBloc>().add(
                        HistoryAdjustmentGetData(idBranch: selectedIdBranch),
                      );
                    },
                  );
                },
              ),
        ),
      ],
    );
  }

  Widget cardLayout({
    required String name,
    required String invoice,
    required DateTime date,
    required String note,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 6),
      child: Card(
        color: AppPropertyColor.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: customTextBorder(
                    "$name (${invoice})",
                    lv1TextStyleWhite,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(invoice, style: lv05TextStyle),
                    Text(formatDate(date: date), style: lv05TextStyle),
                  ],
                ),
                Text(
                  "Catatan: ${note}",
                  style: lv05TextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget layoutTop2() {
    return BlocSelector<
      HistoryAdjustmentBloc,
      HistoryAdjustmentState,
      List<ModelTransactionAdjustmentOut>
    >(
      selector: (state) {
        if (state is HistoryAdjustmentLoaded) {
          return state.filteredDataAdjustmentOut;
        }
        return const [];
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            final dataTransaction = state[index];
            return cardLayout(
              name: dataTransaction.getitemName,
              invoice: dataTransaction.getinvoice,
              date: dataTransaction.getdate,
              note: dataTransaction.getnote,
              onTap: () {
                context.read<HistoryAdjustmentBloc>().add(
                  HistoryAdjustmentSelectedData<ModelTransactionAdjustmentOut>(
                    selectedData: dataTransaction,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget layoutBottom2() {
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
            HistoryAdjustmentBloc,
            HistoryAdjustmentState,

            ModelTransactionAdjustmentOut?
          >(
            selector: (state) {
              if (state is HistoryAdjustmentLoaded) {
                return state.selectedTransactionAdjustmentOut;
              }
              return null;
            },
            builder: (context, state) {
              if (state == null) {
                return Center(
                  child: Text(
                    "Pilih Data",
                    style: lv05TextStyle,
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: customTextBorder(
                      "Detail Transaksi",
                      lv2TextStyleWhite,
                      color: context.colorHistAdjustment,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        rowContent("Nomor Faktur", state.getinvoice),
                        rowContent("Tanggal", formatDate(date: state.getdate)),
                        rowContent("Catatan:", state.getnote),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      // customButton(
                      //   backgroundColor: AppPropertyColor.white,
                      //   child: Icon(
                      //     Icons.print_rounded,
                      //     color: context.colorHistAdjustment,
                      //   ),
                      //   onPressed: () => context.read<PrinterBloc>().add(
                      //     PrintData(
                      //       data: state.$1,
                      //       type: PrintFormatType.transaction_financial,
                      //       history: true,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(width: 10),
                      customButton(
                        backgroundColor: context.colorHistAdjustment,
                        child: Icon(
                          Icons.close_rounded,
                          color: AppPropertyColor.white,
                        ),
                        onPressed: () {
                          context.read<HistoryAdjustmentBloc>().add(
                            HistoryAdjustmentResetSelectedData(),
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
