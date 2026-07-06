import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/features/history_transaction/presentation/widget/history_transaction_detail.dart';
import 'package:flutter_pos/features/history_transaction/presentation/widget/history_transaction_filter.dart';
import 'package:flutter_pos/features/history_transaction/presentation/widget/history_transaction_header.dart';
import 'package:flutter_pos/features/history_transaction/presentation/widget/history_transaction_list.dart';
import 'package:flutter_pos/core/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/history_transaction/logic/history_transaction_bloc.dart';
import 'package:flutter_pos/features/history_transaction/logic/history_transaction_event.dart';
import 'package:flutter_pos/features/history_transaction/logic/history_transaction_state.dart';
import 'package:flutter_pos/core/service/service_printer.dart';
import 'package:flutter_pos/shared/widget/template/dynamic_layout_top_bottom.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_animatePage.dart';

class PageHistoryTransaction extends StatefulWidget {
  const PageHistoryTransaction({super.key});

  @override
  State<PageHistoryTransaction> createState() => _PageHistoryTransactionState();
}

class _PageHistoryTransactionState extends State<PageHistoryTransaction> {
  final searchController = TextEditingController();
  final printerService = ServicePrinter();
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
      contentAppBar: SizedBox(
        width: 123,
        height: 25,
        child:
            BlocSelector<HistoryTransactionBloc, HistoryTransactionState, bool>(
              selector: (state) {
                if (state is HistoryTransactionLoaded) {
                  return state.isSell;
                }
                return true;
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    context.read<HistoryTransactionBloc>().add(
                      HistoryTransactionGetData(isSell: !state),
                    );
                  },
                  child: WidgetAnimatePage(
                    change: state,
                    text1: "Penjualan",
                    text2: "Pembelian",
                    showAt1: 5,
                    showAt2: 0,
                  ),
                );
              },
            ),
      ),
      title: "Riwayat Transaksi",
      color: context.colorHist,
    );
  }

  Future<void> refreshIndicator() async {
    await context.read<DataUserRepositoryCache>().initTransaction();
    context.read<HistoryTransactionBloc>().add(HistoryTransactionGetData());
  }

  Widget layoutTop() {
    return Column(
      children: [
        HistoryTransactionHeader(searchController: searchController),
        const SizedBox(height: 5),
        HistoryTransactionFilter(searchController: searchController),
        Expanded(child: HistoryTransactionList()),
      ],
    );
  }

  Widget layoutBottom() {
    return HistoryTransactionDetail();
  }
}
