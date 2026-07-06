import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/helper/enum_and_string/enum.dart';
import 'package:flutter_pos/features/history_transaction/logic/history_transaction_bloc.dart';
import 'package:flutter_pos/features/history_transaction/logic/history_transaction_event.dart';
import 'package:flutter_pos/features/history_transaction/logic/history_transaction_state.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/transaction/model/model_transaction.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class HistoryTransactionList extends StatelessWidget {
  const HistoryTransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      HistoryTransactionBloc,
      HistoryTransactionState,
      List<ModelTransaction>
    >(
      selector: (state) {
        if (state is HistoryTransactionLoaded) {
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
                    context.read<HistoryTransactionBloc>().add(
                      HistoryTransactionSelectedData(
                        selectedData: dataTransaction,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                "${formatPriceRp(dataTransaction.gettotal)}",
                                style: lv1TextStylePrimaryPrice,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Tipe: ${dataTransaction.getpaymentMethod.name}",
                          style: lv05TextStyle,
                          textAlign: TextAlign.center,
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
