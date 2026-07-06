import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button_reset.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/transaction_adjustment/logic/transaction_adjustment_bloc.dart';
import 'package:flutter_pos/features/transaction_adjustment/logic/transaction_adjustment_event.dart';

class TAdjustmentSearchBatch extends StatefulWidget {
  const TAdjustmentSearchBatch({super.key});

  @override
  State<TAdjustmentSearchBatch> createState() => _TAdjustmentSearchBatchState();
}

class _TAdjustmentSearchBatchState extends State<TAdjustmentSearchBatch> {
  final searchItemBatchController = TextEditingController();
  @override
  void dispose() {
    searchItemBatchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: customTextField(
            moreRadius: true,
            controller: searchItemBatchController,
            label: "Cari...",
            onChanged: (value) => context.read<AdjustmentBloc>().add(
              AdjustmentSearchItemBatch(text: value),
            ),
          ),
        ),
        const SizedBox(width: 10),
        customButtonIconReset(
          color: context.colorAdjustment,
          onPressed: () {
            context.read<AdjustmentBloc>().add(AdjustmentResetAllData());
            searchItemBatchController.clear();
          },
        ),
      ],
    );
  }
}
