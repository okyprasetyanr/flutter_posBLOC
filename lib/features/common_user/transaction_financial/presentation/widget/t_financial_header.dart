import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/features/common_user/transaction_financial/logic/transaction_financial_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction_financial/logic/transaction_financial_event.dart';
import 'package:flutter_pos/features/common_user/transaction_financial/logic/transaction_financial_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class TFinancialHeader extends StatelessWidget {
  final VoidCallback onPressed;
  const TFinancialHeader({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            customButtonIcon(
              backgroundColor: context.colorTransFinance,
              icon: const Icon(
                Icons.menu_rounded,
                color: AppPropertyColor.white,
                size: lv2IconSize,
              ),
              label: Text("Menu", style: lv05TextStyleWhite),
              onPressed: () {
                onPressed();
              },
            ),
            const SizedBox(width: 10),
            Text("Kas", style: titleTextStyle),
          ],
        ),
        Spacer(),
        BlocSelector<TransFinancialBloc, TransFinancialState, bool>(
          selector: (state) {
            if (state is TransFinancialLoaded) {
              return state.isIncome;
            }
            return false;
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () => context.read<TransFinancialBloc>().add(
                TransFinancialStatusFinancial(),
              ),
              child: AnimatedContainer(
                width: 145,
                height: 30,
                duration: Duration(microseconds: 500),
                child: WidgetAnimatePage(
                  change: state,
                  text1: "Pendapatan",
                  text2: "Pengeluaran",
                  showAt1: 5,
                  showAt2: 0,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
