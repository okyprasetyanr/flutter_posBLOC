import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/features/common_user/history_financial/presentation/widget/history_financial_detail.dart';
import 'package:flutter_pos/features/common_user/history_financial/presentation/widget/history_financial_filter.dart';
import 'package:flutter_pos/features/common_user/history_financial/presentation/widget/history_financial_header.dart';
import 'package:flutter_pos/features/common_user/history_financial/presentation/widget/history_financial_list.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_bloc.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_event.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_state.dart';
import 'package:flutter_pos/template/dynamic_layout_top_bottom.dart';
import 'package:flutter_pos/common_widget/widget_animatePage.dart';

class UIHistoryFinancial extends StatefulWidget {
  const UIHistoryFinancial({super.key});

  @override
  State<UIHistoryFinancial> createState() => _UIHistoryFinancialState();
}

class _UIHistoryFinancialState extends State<UIHistoryFinancial> {
  final searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: null,
      refreshIndicator: refreshIndicator,
      title: "Riwayat Kas",
      color: context.colorHistFinance,
      contentAppBar: SizedBox(
        width: 143,
        height: 28,
        child: BlocSelector<HistoryFinancialBloc, HistoryFinancialState, bool>(
          selector: (state) {
            if (state is HistoryFinancialLoaded) {
              return state.isIncome;
            }
            return true;
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<HistoryFinancialBloc>().add(
                  HistoryFinancialGetData(isIncome: !state),
                );
              },
              child: WidgetAnimatePage(
                change: state,
                text1: "Pendapatan",
                text2: "Pengeluaran",
                showAt1: 5,
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
        HistoryFinancialHeader(searchController: searchController),
        const SizedBox(height: 5),
        HistoryFinancialFilter(searchController: searchController),
        Expanded(child: HistoryFinancialList()),
      ],
    );
  }

  Widget layoutBottom() {
    return HistoryFinancialDetail();
  }

  Future<void> refreshIndicator() async {
    await context.read<DataUserRepositoryCache>().initTransaction();
    context.read<HistoryFinancialBloc>().add(HistoryFinancialGetData());
  }
}
