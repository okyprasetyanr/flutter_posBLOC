import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_bloc.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_event.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_report.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/widget/common_widget/date_picker.dart';
import 'package:flutter_pos/widget/common_widget/row_content.dart';
import 'package:flutter_pos/widget/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/widget/common_widget/widget_dropdown_branch.dart';

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: BlocSelector<ReportBloc, ReportState, (ModelReport?, bool)>(
            selector: (state) {
              if (state is ReportLoaded) {
                return (state.report, state.isSell);
              }
              return (null, true);
            },
            builder: (context, state) {
              final report = state.$1;
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
                      Text("Laporan Kasir", style: titleTextStyle),
                      GestureDetector(
                        onTap: () =>
                            context.read<ReportBloc>().add(ReportIsSell()),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: 120,
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          height: 40,
                          child: WidgetAnimatePage(
                            change: state.$2,
                            text1: "Penjualan",
                            text2: "Pembelian",
                          ),
                        ),
                      ),
                    ],
                  ),
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

                              context.read<ReportBloc>().add(
                                ReportGetData(
                                  dateStart: pickedDateStart,
                                  dateEnd: pickedDateEnd,
                                  idBranch: null,
                                ),
                              );
                            },
                            icon: Icon(Icons.date_range_rounded),
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
