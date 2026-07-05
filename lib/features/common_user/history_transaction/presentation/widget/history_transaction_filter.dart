import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/common_widget/widget_custom_dropdown_filter.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/enum_and_string/enum.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_event.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_state.dart';
import 'package:flutter_pos/function/function.dart';

class HistoryTransactionFilter extends StatelessWidget {
  final TextEditingController searchController;
  const HistoryTransactionFilter({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          child: WidgetDropDownFilter(
            initialValue: context
                .select<HistoryTransactionBloc, ListStatusTransaction>((bloc) {
                  final state = bloc.state;
                  if (state is HistoryTransactionLoaded) {
                    return state.filter;
                  }
                  return ListStatusTransaction.All;
                }),
            filters: listStatusTransaction
                .where((element) => element != ListStatusTransaction.Tersimpan)
                .toList(),
            text: "Pilih Filter",
            selectedValue: (selectedEnum) {
              context.read<HistoryTransactionBloc>().add(
                HistoryTransactionSelectedFilter(filter: selectedEnum),
              );
              searchController.clear();
            },
          ),
        ),
        SizedBox(
          width: 150,
          child:
              BlocSelector<
                HistoryTransactionBloc,
                HistoryTransactionState,
                String
              >(
                selector: (state) => state is HistoryTransactionLoaded
                    ? state.idBranch ?? ""
                    : "",
                builder: (context, state) {
                  return WidgetDropdownBranch(
                    idBranch: state,
                    selectedIdBranch: (selectedIdBranch) {
                      searchController.clear();
                      context.read<HistoryTransactionBloc>().add(
                        HistoryTransactionGetData(idBranch: selectedIdBranch),
                      );
                    },
                  );
                },
              ),
        ),
      ],
    );
  }
}
