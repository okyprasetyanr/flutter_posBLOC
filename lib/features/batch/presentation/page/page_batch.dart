import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/batch/logic/batch_bloc.dart';
import 'package:flutter_pos/features/batch/logic/batch_event.dart';
import 'package:flutter_pos/features/batch/logic/batch_state.dart';
import 'package:flutter_pos/features/batch/presentation/widget/batch_detail_item.dart';
import 'package:flutter_pos/features/batch/presentation/widget/batch_header.dart';
import 'package:flutter_pos/features/batch/presentation/widget/batch_list_batch.dart';
import 'package:flutter_pos/features/batch/presentation/widget/batch_list_item.dart';
import 'package:flutter_pos/core/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/inventory/model/model_item.dart';
import 'package:flutter_pos/features/batch/model/model_item_batch.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/shared/widget/template/dynamic_layout_top_bottom.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_navigation_gesture.dart';

class PageBatch extends StatefulWidget {
  const PageBatch({super.key});

  @override
  State<PageBatch> createState() => _PageBatchState();
}

class _PageBatchState extends State<PageBatch> {
  final isOpen = ValueNotifier<bool>(false);
  final searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    isOpen.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: widgetNavigation(),
      refreshIndicator: _onRefresh,
    );
  }

  Future<void> _onRefresh() async {
    await Future.wait([
      context.read<DataUserRepositoryCache>().initItem(),
      context.read<DataUserRepositoryCache>().initBatch(),
    ]);
    context.read<BatchBloc>().add(BatchGetData());
  }

  Widget layoutTop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BatchHeader(
          searchController: searchController,
          isOpen: () => isOpen.value = !isOpen.value,
        ),
        const SizedBox(height: 10),
        Expanded(
          child:
              BlocSelector<
                BatchBloc,
                BatchState,
                (List<ModelItem>, List<ModelItemBatch>, bool)
              >(
                selector: (state) {
                  if (state is BatchLoaded) {
                    return (
                      state.filteredItem,
                      state.dataItemBatchByIdItem ?? [],
                      state.selectedIdItem == null,
                    );
                  }
                  return ([], [], false);
                },
                builder: (context, state) {
                  devLog("Log UIBatch: itemBatch: $state");
                  return state.$1.isEmpty
                      ? Center(
                          child: Text(
                            "Belum ada item yang diRe-Stock",
                            style: lv05TextStyle,
                          ),
                        )
                      : state.$3
                      ? BatchListItem(
                          listItem: state.$1,
                          searchController: searchController,
                        )
                      : BatchListBatch(listBatch: state.$2);
                },
              ),
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return BatchDetailItem(searchController: searchController);
  }

  Widget? widgetNavigation() {
    final contentNavGesture = [
      {
        "id": "inventory",
        "toContext": '/inventory',
        "text_menu": "Inventori",
        "onTap": () {},
      },
      {
        "id": "batch",
        "toContext": '/batch',
        "text_menu": "Stok/Batch",
        "onTap": () {},
      },
    ];

    return NavigationGesture(
      currentPage: "batch",
      attContent: contentNavGesture,
      isOpen: isOpen,
      close: () {
        isOpen.value = false;
      },
    );
  }
}
