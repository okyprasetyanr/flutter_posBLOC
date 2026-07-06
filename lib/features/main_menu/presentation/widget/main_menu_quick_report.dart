import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/row_content.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/features/main_menu/logic/main_menu_bloc.dart';
import 'package:flutter_pos/features/main_menu/logic/main_menu_event.dart';
import 'package:flutter_pos/features/main_menu/logic/main_menu_state.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/shared/style_and_transition_text/wave_animation.dart';

class MainMenuQuickReport extends StatelessWidget {
  const MainMenuQuickReport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      DataReportBloc,
      DataReportState,
      (double, int, int, double, double)
    >(
      selector: (state) {
        if (state is DataReportLoaded) {
          return (
            state.totalSell,
            state.totalTransaction,
            state.totalItemTranasction,
            state.totalIncome,
            state.totalExpense,
          );
        }
        return (0.0, 0, 0, 0.0, 0.0);
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 5),
              width: 150,
              child: BlocSelector<DataReportBloc, DataReportState, String>(
                selector: (state) {
                  if (state is DataReportLoaded) {
                    return state.idBranch!;
                  }
                  return "";
                },
                builder: (context, state) {
                  return WidgetDropdownBranch(
                    idBranch: state,
                    selectedIdBranch: (selectedIdBranch) => context
                        .read<DataReportBloc>()
                        .add(DataReportGetData(idBranch: selectedIdBranch)),
                  );
                },
              ),
            ),
            DoubleWave(mirror: false),
            Container(
              margin: EdgeInsets.only(right: 5),
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
                bottom: 5,
              ),
              decoration: const BoxDecoration(
                color: AppPropertyColor.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  const BoxShadow(
                    blurRadius: 8,
                    offset: Offset(0, 4),
                    color: AppPropertyColor.blackLight,
                  ),
                ],
              ),
              child: Wrap(
                children: [
                  Center(
                    child: Text("Laporan Singkat", style: lv05TextStyleBold),
                  ),
                  rowContent("Total Penjualan", formatPriceRp(state.$1)),
                  rowContent(
                    "Jumlah Transaksi",
                    formatQtyOrPrice(state.$2.toDouble()),
                  ),
                  rowContent(
                    "Jumlah Item Terjual",
                    formatQtyOrPrice(state.$3.toDouble()),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),

            Flexible(
              fit: FlexFit.loose,
              child: Container(
                margin: EdgeInsets.only(right: 5),
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                decoration: BoxDecoration(
                  color: AppPropertyColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0, 4),
                      color: AppPropertyColor.blackLight,
                    ),
                  ],
                ),
                child: Wrap(
                  children: [
                    rowContent("Total Pendapatan", formatPriceRp(state.$4)),
                    rowContent("Total Pengeluaran", formatPriceRp(state.$5)),
                  ],
                ),
              ),
            ),
            DoubleWave(mirror: true),
          ],
        );
      },
    );
  }
}
