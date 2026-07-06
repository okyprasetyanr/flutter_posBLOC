import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/transaction_financial/logic/transaction_financial_bloc.dart';
import 'package:flutter_pos/features/transaction_financial/logic/transaction_financial_event.dart';
import 'package:flutter_pos/features/transaction_financial/logic/transaction_financial_state.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class TFinancialNominalAndButton extends StatelessWidget {
  final TextEditingController amountController;
  final TextEditingController noteController;
  final List<FocusNode> nodes;
  const TFinancialNominalAndButton({
    super.key,
    required this.amountController,
    required this.noteController,
    required this.nodes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: customTextField(
            suffixText: ",00",
            enable: true,
            nodes: nodes,
            index: 1,
            inputType: TextInputType.number,
            controller: amountController,
            label: "Nominal",
            context: context,
            validator: (value) {
              if (double.tryParse(value.toString()) == 0) {
                return "Nominal tidak boleh 0";
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: customButtonIcon(
            onPressed: () {
              if ((context.read<TransFinancialBloc>().state
                          as TransFinancialLoaded)
                      .selectedFinancial ==
                  null) {
                return customSnackBar(context, "Pilih Kas terlebih dahulu!");
              }
              if (amountController.text.isEmpty) {
                return customSnackBar(context, "Nominal belum terisi!");
              }

              context.read<TransFinancialBloc>().add(
                TransFinancialUploadTrans(
                  amount: amountController.text,
                  note: noteController.text,
                ),
              );
              amountController.clear();
              noteController.clear();
            },
            backgroundColor: context.colorTransFinance,
            icon: const Icon(
              Icons.check_rounded,
              color: AppPropertyColor.white,
            ),
            label: Text("Simpan", style: lv05TextStyleWhite),
          ),
        ),
      ],
    );
  }
}
