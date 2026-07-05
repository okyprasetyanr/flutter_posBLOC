import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/common_user/financial/presentation/widget/financial_form.dart';
import 'package:flutter_pos/features/common_user/financial/presentation/widget/financial_header.dart';
import 'package:flutter_pos/features/common_user/financial/presentation/widget/financial_list_financial.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/financial/logic/financial_bloc.dart';
import 'package:flutter_pos/features/common_user/financial/logic/financial_event.dart';
import 'package:flutter_pos/features/common_user/financial/logic/financial_state.dart';
import 'package:flutter_pos/template/dynamic_layout_top_bottom.dart';
import 'package:flutter_pos/common_widget/widget_animatePage.dart';

class PageFinancial extends StatefulWidget {
  const PageFinancial({super.key});

  @override
  State<PageFinancial> createState() => _PageFinancialState();
}

class _PageFinancialState extends State<PageFinancial> {
  @override
  void initState() {
    super.initState();
  }

  void _initData() {
    context.read<FinancialBloc>().add(FinancialGetData());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: null,
      refreshIndicator: refreshIndicator,
      title: "Data Kas",
      color: context.colorFinance,
      contentAppBar: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: 145,
        height: 27,
        child: BlocSelector<FinancialBloc, FinancialState, bool>(
          selector: (state) {
            if (state is FinancialLoaded) {
              return state.isIncome;
            }
            return true;
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<FinancialBloc>().add(FinancialIsIncome());
              },
              child: WidgetAnimatePage(
                change: state,
                text1: "Pendapatan",
                text2: "Pengeluaran",
                showAt1: 6,
                showAt2: 0,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget layoutTop() {
    return Column(
      children: [
        FinancialHeader(),
        const SizedBox(height: 5),
        Expanded(child: FinancialListFinancial()),
      ],
    );
  }

  Widget layoutBottom() {
    return FinancialForm();
  }

  Future<void> refreshIndicator() async {
    await context.read<DataUserRepositoryCache>().initFinancial();
    _initData();
  }
}
