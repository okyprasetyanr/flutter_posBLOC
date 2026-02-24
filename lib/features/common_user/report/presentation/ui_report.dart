import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_bloc.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_event.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_state.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_event.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_report.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/common_widget/date_picker.dart';
import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';

class UIReport extends StatefulWidget {
  const UIReport({super.key});

  @override
  State<UIReport> createState() => _UIReportState();
}

class _UIReportState extends State<UIReport> {
  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() {
    context.read<ReportBloc>().add(ReportGetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPropertyColor.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: BlocSelector<ReportBloc, ReportState, bool>(
              selector: (state) {
                if (state is ReportLoaded) {
                  return state.isSell;
                }
                return true;
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => context.read<ReportBloc>().add(ReportIsSell()),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 123,
                    height: 30,
                    child: WidgetAnimatePage(
                      change: state,
                      text1: "Penjualan",
                      text2: "Pembelian",
                      showAt1: 5,
                      showAt2: 0,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
        toolbarHeight: 44,
        leadingWidth: 250,
        leading: Row(
          children: [
            IconButton(
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
              ),
              icon: const Icon(Icons.arrow_back_ios_new, size: 25),
              constraints: const BoxConstraints(),
              onPressed: () => Navigator.pop(context),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: AppPropertyColor.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("Laporan Kasir", style: titleTextStyleWhite),
            ),
          ],
        ),
      ),
      backgroundColor: AppPropertyColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocSelector<ReportBloc, ReportState, ModelReport?>(
            selector: (state) {
              if (state is ReportLoaded) {
                return state.report;
              }
              return null;
            },
            builder: (context, state) {
              final report = state;
              if (report == null) {
                return Column(
                  children: [
                    customSpinKit(),
                    Text("Menunggu Data...", style: lv05TextStyle),
                  ],
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocSelector<
                        ReportBloc,
                        ReportState,
                        (DateTime?, DateTime?)
                      >(
                        selector: (state) {
                          if (state is ReportLoaded) {
                            return (state.dateStart, state.dateEnd);
                          }
                          return (null, null);
                        },
                        builder: (context, state) {
                          return customButtonIcon(
                            backgroundColor: AppPropertyColor.white,
                            icon: const Icon(
                              Icons.date_range_rounded,
                              color: AppPropertyColor.black,
                            ),
                            label: Text(
                              state.$1 == null ||
                                      formatDate(
                                                date: state.$1!,
                                                minute: false,
                                              ) ==
                                              formatDate(
                                                date: DateTime.now(),
                                                minute: false,
                                              ) &&
                                          formatDate(
                                                date: state.$2!,
                                                minute: false,
                                              ) ==
                                              formatDate(
                                                date: DateTime.now(),
                                                minute: false,
                                              )
                                  ? "Hari ini"
                                  : "${formatDate(date: state.$1!, minute: false)} - ${formatDate(date: state.$2!, minute: false)}",
                              style: lv05TextStyle,
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

                              context.read<ReportBloc>().add(
                                ReportGetData(
                                  dateStart: pickedDateStart,
                                  dateEnd: pickedDateEnd,
                                  idBranch: null,
                                ),
                              );
                            },
                          );
                        },
                      ),

                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        width: 150,
                        child: BlocSelector<ReportBloc, ReportState, String>(
                          selector: (state) =>
                              state is ReportLoaded ? state.idBranch ?? "" : "",
                          builder: (context, state) => WidgetDropdownBranch(
                            idBranch: state,
                            selectedIdBranch: (selectedIdBranch) =>
                                context.read<ReportBloc>().add(
                                  ReportGetData(
                                    dateStart: null,
                                    dateEnd: null,
                                    idBranch: selectedIdBranch,
                                  ),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  rowContent("Modal Awal", report.getopeningBalance),
                  rowContent("Penjualan Kotor", report.getgrossSales),
                  rowContent("Diskon", report.getdiscountAmount),
                  rowContent("PPN", report.getppnAmount),
                  rowContent("Charge", report.getchargeAmount),
                  rowContent("Penjualan Bersih", report.getnetSales),
                  rowContent("Qris", report.getsummary.getqris),
                  rowContent("Debit", report.getsummary.getdebit),
                  rowContent("Tunai", report.getsummary.getcash),
                  rowContent("Pemasukan", report.getincome),
                  rowContent("Pengeluaran", report.getexpense),
                  rowContent("Total Kas", report.getcashInDrawer),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: customButtonIcon(
                      backgroundColor: AppPropertyColor.primary,
                      icon: Icon(
                        Icons.print_rounded,
                        color: AppPropertyColor.white,
                      ),
                      label: Text("Cetak", style: lv05TextStyleWhite),
                      onPressed: () => context.read<PrinterBloc>().add(
                        PrintData(data: state, type: PrintFormatType.report),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
