import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_list_gradient.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/features/financial/logic/financial_bloc.dart';
import 'package:flutter_pos/features/financial/logic/financial_event.dart';
import 'package:flutter_pos/features/financial/logic/financial_state.dart';
import 'package:flutter_pos/features/financial/model/model_financial.dart';

class FinancialListFinancial extends StatelessWidget {
  const FinancialListFinancial({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FinancialBloc, FinancialState, List<ModelFinancial>?>(
      selector: (state) {
        if (state is FinancialLoaded) {
          return state.filteredFinancial;
        }
        return null;
      },
      builder: (context, state) {
        if (state == null) {
          return customSpinKit();
        }
        return customListGradient(
          selectedData: (selectedData) => context.read<FinancialBloc>().add(
            FinancialSelectedFinancial(selectedFinancial: selectedData),
          ),
          data: state,
          getId: (data) => data.getidFinancial,
          getName: (data) => data.getnameFinancial,
          deleteData: (deleteData) => context.read<FinancialBloc>().add(
            FinancialDeleteFinancial(data: deleteData),
          ),
        );
      },
    );
  }
}
