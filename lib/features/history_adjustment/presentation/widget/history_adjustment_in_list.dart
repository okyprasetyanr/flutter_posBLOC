import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/history_adjustment/logic/history_adjustment_bloc.dart';
import 'package:flutter_pos/features/history_adjustment/logic/history_adjustment_event.dart';
import 'package:flutter_pos/features/history_adjustment/logic/history_adjustment_state.dart';
import 'package:flutter_pos/features/history_adjustment/presentation/widget/history_adjustment_card_layout.dart';
import 'package:flutter_pos/features/history_adjustment/model/model_transaction_adjustment_in.dart';

class HistoryAdjustmentInList extends StatelessWidget {
  const HistoryAdjustmentInList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      HistoryAdjustmentBloc,
      HistoryAdjustmentState,
      List<ModelTransactionAdjustmentIn>
    >(
      selector: (state) {
        if (state is HistoryAdjustmentLoaded) {
          return state.filteredDataAdjustmentIn;
        }
        return const [];
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            final dataTransaction = state[index];
            return HistoryAdjustmentCardLayout(
              name: dataTransaction.getitemName,
              invoice: dataTransaction.getinvoice,
              date: dataTransaction.getdate,
              note: dataTransaction.getnote,
              onTap: () {
                context.read<HistoryAdjustmentBloc>().add(
                  HistoryAdjustmentSelectedData<ModelTransactionAdjustmentIn>(
                    selectedData: dataTransaction,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
