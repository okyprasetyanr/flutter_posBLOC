import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/model_data/model_branch.dart';
import 'package:flutter_pos/widget/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UITransactionDropDownBranch extends StatelessWidget {
  const UITransactionDropDownBranch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      TransactionBloc,
      TransactionState,
      (List<ModelBranch>, String?)
    >(
      selector: (state) {
        if (state is TransactionLoaded) {
          return (state.dataBranch, state.idBranch);
        }
        return ([], "");
      },
      builder: (context, state) {
        if (state.$1.isEmpty) {
          return const SpinKitThreeBounce(color: Colors.blue, size: 15.0);
        }

        return WidgetDropdownBranch(
          listBranch: state.$1,
          idBranch: state.$2!,
          selectedIdBranch: (selectedIdBranch) => context
              .read<TransactionBloc>()
              .add(TransactionGetData(idBranch: selectedIdBranch)),
        );
      },
    );
  }
}
