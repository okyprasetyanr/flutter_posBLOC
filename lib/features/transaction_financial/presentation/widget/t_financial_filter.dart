import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/features/transaction_financial/logic/transaction_financial_bloc.dart';
import 'package:flutter_pos/features/transaction_financial/logic/transaction_financial_event.dart';
import 'package:flutter_pos/features/transaction_financial/logic/transaction_financial_state.dart';

class TFinancialFilter extends StatefulWidget {
  const TFinancialFilter({super.key});

  @override
  State<TFinancialFilter> createState() => _TFinancialFilterState();
}

class _TFinancialFilterState extends State<TFinancialFilter> {
  final searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: customTextField(
            controller: searchController,
            inputType: TextInputType.text,
            label: "Cari",
            enable: true,
            onChanged: (value) => context.read<TransFinancialBloc>().add(
              TransFinancialSearch(search: value),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: BlocSelector<TransFinancialBloc, TransFinancialState, String>(
            selector: (state) =>
                state is TransFinancialLoaded ? state.idBranch ?? "" : "",
            builder: (context, state) {
              return WidgetDropdownBranch(
                idBranch: state,
                selectedIdBranch: (selectedIdBranch) {
                  context.read<TransFinancialBloc>().add(
                    TransFinancialGetData(idBranch: selectedIdBranch),
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
