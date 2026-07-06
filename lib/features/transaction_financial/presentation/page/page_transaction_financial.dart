import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/transaction_financial/presentation/widget/t_financial_filter.dart';
import 'package:flutter_pos/features/transaction_financial/presentation/widget/t_financial_nominal_and_button.dart';
import 'package:flutter_pos/features/transaction_financial/presentation/widget/t_financial_selected.dart';
import 'package:flutter_pos/features/transaction_financial/presentation/widget/t_financial_header.dart';
import 'package:flutter_pos/features/transaction_financial/presentation/widget/t_financial_list.dart';
import 'package:flutter_pos/core/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/transaction_financial/logic/transaction_financial_bloc.dart';
import 'package:flutter_pos/features/transaction_financial/logic/transaction_financial_event.dart';
import 'package:flutter_pos/shared/widget/template/dynamic_layout_top_bottom.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_navigation_gesture.dart';

class PageTransactionFinancial extends StatefulWidget {
  const PageTransactionFinancial({super.key});

  @override
  State<PageTransactionFinancial> createState() =>
      _PageTransactionFinancialState();
}

class _PageTransactionFinancialState extends State<PageTransactionFinancial> {
  final isOpen = ValueNotifier<bool>(false);
  final nodes = List.generate(2, (index) => FocusNode());
  final noteController = TextEditingController();
  final amountController = TextEditingController();
  @override
  void dispose() {
    noteController.dispose();
    amountController.dispose();
    isOpen.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: navigationGesture(),
      refreshIndicator: refreshIndicator,
    );
  }

  Widget layoutTop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TFinancialHeader(onPressed: () => isOpen.value = !isOpen.value),
        TFinancialFilter(),
        Expanded(child: TFinancialList()),
      ],
    );
  }

  Widget layoutBottom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TFinancialSelected(
          amountController: amountController,
          noteController: noteController,
        ),
        const SizedBox(height: 10),
        customTextField(
          enable: true,
          nodes: nodes,
          index: 0,
          inputType: TextInputType.text,
          controller: noteController,
          label: "Catatan",
          context: context,
        ),
        TFinancialNominalAndButton(
          amountController: amountController,
          noteController: noteController,
          nodes: nodes,
        ),
      ],
    );
  }

  Future<void> refreshIndicator() async {
    await context.read<DataUserRepositoryCache>().initFinancial();
    context.read<TransFinancialBloc>().add(TransFinancialGetData());
  }

  Widget navigationGesture() {
    final contentNavGesture = [
      {
        "id": "sell",
        "toContext": '/sell',
        "text_menu": "Jual-Beli",
        "onTap": () {},
      },
      {
        "id": "transfinancial",
        "toContext": '/transfinancial',
        "text_menu": "Kas",
        "onTap": () {},
      },
      {
        "id": "adjustment",
        "toContext": '/adjustment',
        "text_menu": "Penyesuaian",
        "onTap": () {},
      },
    ];

    return NavigationGesture(
      currentPage: "transfinancial",
      attContent: contentNavGesture,
      isOpen: isOpen,
      close: () {
        isOpen.value = false;
      },
    );
  }
}
