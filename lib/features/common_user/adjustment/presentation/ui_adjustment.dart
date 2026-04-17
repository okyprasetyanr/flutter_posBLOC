import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/common_widget/widget_custom_bottom_sheet.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/features/common_user/adjustment/logic/adjustment_bloc.dart';
import 'package:flutter_pos/features/common_user/adjustment/logic/adjustment_event.dart';
import 'package:flutter_pos/features/common_user/adjustment/logic/adjustment_state.dart';
import 'package:flutter_pos/features/common_user/adjustment/presentation/widget/top_page/grid_view_item.dart';
import 'package:flutter_pos/features/common_user/adjustment/presentation/widget/top_page/list_view_category.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/template/dynamic_layout_top_bottom.dart';
import 'package:flutter_pos/template/dynamic_stl_for_color_wrapper.dart';

class UiAdjustment extends StatefulWidget {
  const UiAdjustment({super.key});

  @override
  State<UiAdjustment> createState() => _UiAdjustmentState();
}

class _UiAdjustmentState extends State<UiAdjustment> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: null,
      refreshIndicator: refreshIndicator,
    );
  }

  Widget layoutTop() {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: customTextField(
                    moreRadius: true,
                    controller: searchController,
                    text: "Cari...",
                    onChanged: (value) => context.read<AdjustmentBloc>().add(
                      AdjustmentSearchData(text: value),
                    ),
                  ),
                ),

                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    context.read<AdjustmentBloc>().add(
                      AdjustmentGetData(changeMode: true),
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 95,
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    height: 40,
                    child: BlocSelector<AdjustmentBloc, AdjustmentState, bool>(
                      selector: (state) {
                        if (state is AdjustmentLoaded) {
                          return state.isAdjustIn;
                        }
                        return true;
                      },
                      builder: (context, state) {
                        return WidgetAnimatePage(
                          change: state,
                          text1: "Masuk",
                          text2: "Keluar",
                          showAt1: 2,
                          showAt2: 0,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 5),
                Expanded(
                  flex: 6,
                  child: SizedBox(
                    height: 27,
                    child: UIAdjustmentListViewCategory(),
                  ),
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
            Expanded(child: const UIAdjustmentGridViewItem()),
          ],
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return BlocSelector<AdjustmentBloc, AdjustmentState, List<ModelItemBatch>>(
      selector: (state) =>
          state is AdjustmentLoaded ? state.dataItemBatchByIdItem : [],
      builder: (context, state) => state.isNotEmpty
          ? DynamicColorWrapper(
              colorSelector: (context) => context.colorAdjustment,
              builder: (context, color) => ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  final item = state[index];
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Material(
                        color: AppPropertyColor.white,
                        borderRadius: BorderRadius.circular(10),
                        elevation: 4,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              width: double.infinity,
                              child: Text(
                                "Nota: ${item.getinvoice}",
                                style: lv1TextStyleWhite,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  rowContent(
                                    "Tanggal",
                                    formatDate(date: item.getdateBuy),
                                  ),
                                  rowContent(
                                    "Stock Masuk",
                                    formatQtyOrPrice(item.getqtyItem_in),
                                  ),
                                  rowContent(
                                    "Stock Keluar",
                                    formatQtyOrPrice(item.getqtyItem_out),
                                  ),
                                  rowContent(
                                    "Stock Sisa",
                                    formatQtyOrPrice(
                                      item.getqtyItem_in - item.getqtyItem_out,
                                    ),
                                  ),
                                  rowContent(
                                    "Harga Jual",
                                    formatPriceRp(item.getpriceItemFinal),
                                  ),
                                  rowContent(
                                    "Harga Beli",
                                    formatPriceRp(item.getpriceItemBuy),
                                  ),
                                  rowContent(
                                    "Kadaluarsa",
                                    item.getexpiredDate?.toString() ?? "-",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      final bloc = context.read<AdjustmentBloc>();
                      customBottomSheet(
                        context: context,
                        resetItemForm: null,
                        content: (scrollController) => ListView(
                          controller: scrollController,
                          children: [],
                        ),
                      );
                    },
                  );
                },
              ),
            )
          : Center(
              child: Text("Belum ada Data Batch!", style: lv05TextStyleBold),
            ),
    );
  }

  Future<void> refreshIndicator() async {
    await context.read<DataUserRepositoryCache>().initTransaction();
    context.read<AdjustmentBloc>().add(AdjustmentGetData());
  }
}
