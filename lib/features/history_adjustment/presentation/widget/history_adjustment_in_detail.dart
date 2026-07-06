import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/row_content.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_row_list_item.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/features/history_adjustment/logic/history_adjustment_bloc.dart';
import 'package:flutter_pos/features/history_adjustment/logic/history_adjustment_event.dart';
import 'package:flutter_pos/features/history_adjustment/logic/history_adjustment_state.dart';
import 'package:flutter_pos/features/history_adjustment/presentation/widget/history_adjustment_row_layout.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/history_adjustment/model/model_transaction_adjustment_in.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class HistoryAdjustmentInDetail extends StatelessWidget {
  const HistoryAdjustmentInDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
                        rowContent("Catatan", state.getnote),
                        customRowListItem(
                          row1: "Penyesuaian",
                          flexRow1: 4,
                          style1: lv05TextStylePrimary,
                          row2: "Sebelum",
                          flexRow2: 5,
                          row3: "Sesudah",
                          flexRow3: 5,
                          style2: lv05TextStylePrimary,
                          style3: lv05TextStylePrimary,
                          row4: "Hasil",
                          flexRow4: 5,
                          style4: lv05TextStylePrimary,
                          label: true,
                        ),

                        HistoryAdjustmentRowLayout<double>(
                          adjustment_in: true,
                          title: "Stok masuk",
                          value_before: state.getqty_in_before!,
                          value_after: state.getqty_in_after,
                        ),
                        HistoryAdjustmentRowLayout<double>(
                          price: true,
                          adjustment_in: true,
                          title: "Harga Jual",
                          value_before: state.getsellPriceBefore!,

                          value_after: state.getsellPriceAfter,
                        ),
                        HistoryAdjustmentRowLayout<double>(
                          price: true,
                          adjustment_in: true,
                          title: "Harga Beli",
                          value_before: state.getbuyPriceBefore!,
                          value_after: state.getbuyPriceAfter,
                        ),
                        HistoryAdjustmentRowLayout<String>(
                          adjustment_in: true,
                          date: true,
                          title: "Kadaluarsa",
                          value_before: state.getexpiredDateBefore != null
                              ? formatDate(
                                  date: state.getexpiredDateBefore!,
                                  minute: false,
                                )
                              : null,
                          value_after: state.getexpiredDateAfter != null
                              ? formatDate(
                                  date: state.getexpiredDateAfter!,
                                  minute: false,
                                )
                              : null,
                        ),
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
