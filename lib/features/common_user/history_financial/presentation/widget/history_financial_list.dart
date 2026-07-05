import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/enum_and_string/enum.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_bloc.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_event.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_transaction_financial.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class HistoryFinancialList extends StatelessWidget {
  const HistoryFinancialList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
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
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 6),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          "${dataTransaction.getstatusTransaction!.name}",
                                      style:
                                          dataTransaction
                                                  .getstatusTransaction ==
                                              ListStatusTransaction.Sukses
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
    );
  }
}
