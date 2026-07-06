import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_list_gradient.dart';
import 'package:flutter_pos/features/transaction_financial/logic/transaction_financial_bloc.dart';
import 'package:flutter_pos/features/transaction_financial/logic/transaction_financial_event.dart';
import 'package:flutter_pos/features/transaction_financial/logic/transaction_financial_state.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/financial/model/model_financial.dart';
import 'package:flutter_pos/features/history_financial/model/model_transaction_financial.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class TFinancialList extends StatelessWidget {
  const TFinancialList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      TransFinancialBloc,
      TransFinancialState,
      List<ModelFinancial>?
    >(
      selector: (state) {
        if (state is TransFinancialLoaded) {
          return state.filteredData;
        }
        return null;
      },
      builder: (context, state) {
        return state != null
            ? customListGradient(
                selectedData: (selectedData) {
                  final data = ModelTransactionFinancial(
                    idFinancial: selectedData.getidFinancial,
                    nameFinancial: selectedData.getnameFinancial,
                    idBranch: selectedData.getidBranch,
                    invoice: "",
                    date: parseDate(date: DateTime.now()),
                    note: "",
                    amount: 0,
                  );
                  context.read<TransFinancialBloc>().add(
                    TransFinancialSelectedFinancial(selectedFinancial: data),
                  );
                  devLog("Log UITransactionFinancial: selectedData");
                },
                data: state,
                getId: (data) => data.getidFinancial,
                getName: (data) => data.getnameFinancial,
              )
            : Text("Data Kosong...", style: lv05TextStyle);
      },
    );
  }
}
