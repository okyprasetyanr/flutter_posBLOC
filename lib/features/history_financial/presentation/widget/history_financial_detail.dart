import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/row_content.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/shared/helper/enum_and_string/enum.dart';
import 'package:flutter_pos/features/history_financial/logic/history_financial_bloc.dart';
import 'package:flutter_pos/features/history_financial/logic/history_financial_event.dart';
import 'package:flutter_pos/features/history_financial/logic/history_financial_state.dart';
import 'package:flutter_pos/features/settings/logic/printer/printer_bloc.dart';
import 'package:flutter_pos/features/settings/logic/printer/printer_event.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/history_financial/model/model_transaction_financial.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class HistoryFinancialDetail extends StatelessWidget {
  const HistoryFinancialDetail({super.key});

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
                      color: context.colorHistFinance,
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
                          color: AppPropertyColor.red,
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
                        child: Icon(
                          Icons.print_rounded,
                          color: context.colorHistFinance,
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
                        backgroundColor: context.colorHistFinance,
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
}
