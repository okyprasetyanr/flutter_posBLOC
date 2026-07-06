import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_navigation_gesture.dart';
import 'package:flutter_pos/features/transaction_adjustment/logic/transaction_adjustment_bloc.dart';
import 'package:flutter_pos/features/transaction_adjustment/logic/transaction_adjustment_event.dart';
import 'package:flutter_pos/features/transaction_adjustment/logic/transaction_adjustment_state.dart';
import 'package:flutter_pos/features/transaction_adjustment/presentation/widget/t_adjustment_grid_view_item.dart';
import 'package:flutter_pos/features/transaction_adjustment/presentation/widget/t_adjustment_header.dart';
import 'package:flutter_pos/features/transaction_adjustment/presentation/widget/t_adjustment_list_batch.dart';
import 'package:flutter_pos/features/transaction_adjustment/presentation/widget/t_adjustment_list_view_category.dart';
import 'package:flutter_pos/features/transaction_adjustment/presentation/widget/t_adjustment_search_batch.dart';
import 'package:flutter_pos/core/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/shared/widget/template/dynamic_layout_top_bottom.dart';

class PageTransactionAdjustment extends StatefulWidget {
  const PageTransactionAdjustment({super.key});

  @override
  State<PageTransactionAdjustment> createState() =>
      _PageTransactionAdjustmentState();
}

class _PageTransactionAdjustmentState extends State<PageTransactionAdjustment> {
  final searchItemController = TextEditingController();
  final isOpen = ValueNotifier<bool>(false);

  @override
  void dispose() {
    searchItemController.dispose();
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
      children: [
        TAdjustmentHeader(
          searchItemController: searchItemController,
          onPress: () => isOpen.value = !isOpen.value,
        ),

        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 5),
            Expanded(
              flex: 6,
              child: SizedBox(height: 27, child: TAdjustmentListViewCategory()),
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: 140,
              child: BlocSelector<AdjustmentBloc, AdjustmentState, String>(
                selector: (state) =>
                    state is AdjustmentLoaded ? state.idBranch ?? "" : "",
                builder: (context, state) {
                  return WidgetDropdownBranch(
                    idBranch: state,
                    selectedIdBranch: (selectedIdBranch) {
                      context.read<AdjustmentBloc>().add(
                        AdjustmentGetData(idBranch: selectedIdBranch),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        Expanded(child: const TAdjustmentGridViewItem()),
      ],
    );
  }

  Widget layoutBottom() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TAdjustmentSearchBatch(),
          const SizedBox(height: 10),
          Expanded(child: TAdjustmentListBatch()),
        ],
      ),
    );
  }

  Future<void> refreshIndicator() async {
    await Future.wait([
      context.read<DataUserRepositoryCache>().initBatch(),
      context.read<DataUserRepositoryCache>().initItem(),
    ]);
    context.read<AdjustmentBloc>().add(AdjustmentGetData());
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
      currentPage: "adjustment",
      attContent: contentNavGesture,
      isOpen: isOpen,
      close: () {
        isOpen.value = false;
      },
    );
  }
}
