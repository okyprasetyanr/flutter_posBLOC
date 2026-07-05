import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_reset.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/features/common_user/transaction_financial/logic/transaction_financial_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction_financial/logic/transaction_financial_event.dart';
import 'package:flutter_pos/features/common_user/transaction_financial/logic/transaction_financial_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class TFinancialSelected extends StatelessWidget {
  final TextEditingController amountController;
  final TextEditingController noteController;
  const TFinancialSelected({
    super.key,
    required this.amountController,
    required this.noteController,
  });

  @override
  Widget build(BuildContext context) {
    final nullKas = "Belum memilih Kas";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('Kas:', style: lv1TextStyleBold),
            BlocSelector<TransFinancialBloc, TransFinancialState, String>(
              selector: (state) => state is TransFinancialLoaded
                  ? state.selectedFinancial?.getnameFinancial ?? nullKas
                  : nullKas,
              builder: (context, state) {
                final isKas = state != nullKas;
                return customTextBorder(
                  state,
                  isKas ? lv1TextStyleWhite : lv1TextStyle,
                  marginLeft: isKas ? 10 : 0,
                  whiteBackground: !isKas,
                );
              },
            ),
          ],
        ),
        customButtonIconReset(
          onPressed: () {
            context.read<TransFinancialBloc>().add(
              TransFinancialResetSelected(),
            );
            amountController.clear();
            noteController.clear();
          },
          color: context.colorTransFinance,
        ),
      ],
    );
  }
}
