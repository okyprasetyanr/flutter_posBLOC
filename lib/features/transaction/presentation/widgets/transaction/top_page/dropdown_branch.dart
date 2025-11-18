import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/widget/common_widget/widget_dropdown_branch.dart';

class UITransactionDropDownBranch extends StatelessWidget {
  const UITransactionDropDownBranch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TransactionBloc, TransactionState, String>(
      selector: (state) =>
          state is TransactionLoaded ? state.idBranch ?? "" : "",
      builder: (context, state) {
        return WidgetDropdownBranch(
          idBranch: state!,
          selectedIdBranch: (selectedIdBranch) => context
              .read<TransactionBloc>()
              .add(TransactionGetData(idBranch: selectedIdBranch)),
        );
      },
    );
  }
}
