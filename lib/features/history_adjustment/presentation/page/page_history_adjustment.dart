import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/features/history_adjustment/logic/history_adjustment_bloc.dart';
import 'package:flutter_pos/features/history_adjustment/logic/history_adjustment_event.dart';
import 'package:flutter_pos/features/history_adjustment/logic/history_adjustment_state.dart';
import 'package:flutter_pos/features/history_adjustment/presentation/widget/history_adjustment_header.dart';
import 'package:flutter_pos/features/history_adjustment/presentation/widget/history_adjustment_in_detail.dart';
import 'package:flutter_pos/features/history_adjustment/presentation/widget/history_adjustment_in_list.dart';
import 'package:flutter_pos/features/history_adjustment/presentation/widget/history_adjustment_out_detail.dart';
import 'package:flutter_pos/features/history_adjustment/presentation/widget/history_adjustment_out_list.dart';
import 'package:flutter_pos/core/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/shared/widget/template/dynamic_layout_top_bottom.dart';

class PageHistoryAdjustment extends StatefulWidget {
  const PageHistoryAdjustment({super.key});

  @override
  State<PageHistoryAdjustment> createState() => _PageHistoryAdjustmentState();
}

class _PageHistoryAdjustmentState extends State<PageHistoryAdjustment> {
  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: null,
      refreshIndicator: refreshIndicator,
      title: "Riwayat Penyesuaian",
      color: context.colorHistAdjustment,
      contentAppBar: SizedBox(
        width: 95,
        height: 28,
        child:
            BlocSelector<HistoryAdjustmentBloc, HistoryAdjustmentState, bool>(
              selector: (state) {
                if (state is HistoryAdjustmentLoaded) {
                  return state.isAdjustmentIn;
                }
                return true;
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    context.read<HistoryAdjustmentBloc>().add(
                      HistoryAdjustmentChangeMode(isAdjustmentIn: !state),
                    );
                  },
                  child: WidgetAnimatePage(
                    change: state,
                    text1: "Masuk",
                    text2: "Keluar",
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
        HistoryAdjustmentHeader(),
        Expanded(
          child:
              BlocSelector<HistoryAdjustmentBloc, HistoryAdjustmentState, bool>(
                selector: (state) => state is HistoryAdjustmentLoaded
                    ? state.isAdjustmentIn
                    : true,
                builder: (context, state) => state
                    ? HistoryAdjustmentInList()
                    : HistoryAdjustmentOutList(),
              ),
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return BlocSelector<HistoryAdjustmentBloc, HistoryAdjustmentState, bool>(
      selector: (state) =>
          state is HistoryAdjustmentLoaded ? state.isAdjustmentIn : true,
      builder: (context, state) =>
          state ? HistoryAdjustmentInDetail() : HistoryAdjustmentOutDetail(),
    );
  }

  Future<void> refreshIndicator() async {
    await context.read<DataUserRepositoryCache>().initTransaction();
    context.read<HistoryAdjustmentBloc>().add(HistoryAdjustmentGetData());
  }
}
