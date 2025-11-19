import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/financial/transaction_financial_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/financial/transaction_financial_event.dart';
import 'package:flutter_pos/features/transaction/logic/financial/transaction_financial_state.dart';
import 'package:flutter_pos/model_data/model_financial.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/widget/common_widget/widget_custom_list_gradient.dart';

class UITransactionFinancial extends StatefulWidget {
  const UITransactionFinancial({super.key});

  @override
  State<UITransactionFinancial> createState() => _UITransactionFinancialState();
}

class _UITransactionFinancialState extends State<UITransactionFinancial> {
  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() {
    context.read<TransFinancialBloc>().add(TransFinancialGetData());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: widgetNavigation(),
      refreshIndicator: refreshIndicator,
    );
  }

  Widget layoutTop() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Kas", style: titleTextStyle),
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
                    width: 130,
                    height: 40,
                    duration: Duration(microseconds: 500),
                    child: WidgetAnimatePage(
                      change: state,
                      text1: "Pendapatan",
                      text2: "Pengeluaran",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        Expanded(
          child:
              BlocSelector<
                TransFinancialBloc,
                TransFinancialState,
                List<ModelFinancial>?
              >(
                selector: (state) {
                  if (state is TransFinancialLoaded) {
                    return state.dataFinancial;
                  }
                  return null;
                },
                builder: (context, state) {
                  return state != null
                      ? customListGradient(
                          data: state,
                          getId: (data) => data.getidFinancial,
                          getName: (data) => data.getnameFinancial,
                        )
                      : Text("Data Kosong...", style: lv05TextStyle);
                },
              ),
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return Column(children: []);
  }

  Future<void> refreshIndicator() async {}

  Widget? widgetNavigation() {}
}
