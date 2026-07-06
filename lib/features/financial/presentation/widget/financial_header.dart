import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/features/financial/logic/financial_bloc.dart';
import 'package:flutter_pos/features/financial/logic/financial_event.dart';
import 'package:flutter_pos/features/financial/logic/financial_state.dart';

class FinancialHeader extends StatefulWidget {
  const FinancialHeader({super.key});

  @override
  State<FinancialHeader> createState() => _FinancialHeaderState();
}

class _FinancialHeaderState extends State<FinancialHeader> {
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
            enable: true,
            inputType: TextInputType.text,
            label: "Cari",
            onChanged: (value) => context.read<FinancialBloc>().add(
              FinancialSearch(search: value),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: BlocSelector<FinancialBloc, FinancialState, String>(
            selector: (state) =>
                state is FinancialLoaded ? state.idBranch ?? "" : "",
            builder: (context, state) {
              return WidgetDropdownBranch(
                idBranch: state,
                selectedIdBranch: (selectedIdBranch) {
                  context.read<FinancialBloc>().add(
                    FinancialGetData(idBranch: selectedIdBranch),
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
