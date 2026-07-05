// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_pos/common_widget/widget_custom_dropdown_filter.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/enum_and_string/enum.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_bloc.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_event.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_state.dart';
import 'package:flutter_pos/function/function.dart';

class HistoryFinancialFilter extends StatelessWidget {
  final TextEditingController searchController;
  const HistoryFinancialFilter({Key? key, required this.searchController})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          child: WidgetDropDownFilter(
            initialValue: context
                .select<HistoryFinancialBloc, ListStatusTransaction>((bloc) {
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
              BlocSelector<HistoryFinancialBloc, HistoryFinancialState, String>(
                selector: (state) =>
                    state is HistoryFinancialLoaded ? state.idBranch ?? "" : "",
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
    );
  }
}
