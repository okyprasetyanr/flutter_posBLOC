import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_bottom_sheet.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_bloc.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_state.dart';
import 'package:flutter_pos/features/common_user/main_menu/presentation/widget/main_menu_content_expired.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_expired_item_batch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class MainMenuQuickReportDetail extends StatelessWidget {
  const MainMenuQuickReportDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child:
          BlocSelector<
            DataReportBloc,
            DataReportState,
            (
              ModelItem?,
              ModelItem?,
              ModelItem?,
              List<ModelExpiredItemBatch>,
              List<ModelExpiredItemBatch>,
            )
          >(
            selector: (state) => state is DataReportLoaded
                ? (
                    state.bestSeller,
                    state.worstSeller,
                    state.lowStock,
                    state.almostExpiredItem,
                    state.expiredItem,
                  )
                : (null, null, null, [], []),
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: summaryLayout(
                          item: state.$1,
                          label: "Terlaris",
                          getName: (data) => data.getnameItem,
                          getDetailData: (data) => data.getqtyItem,
                        ),
                      ),
                      Expanded(
                        child: summaryLayout(
                          item: state.$2,
                          label: "Tidak laris",
                          getName: (data) => data.getnameItem,
                          getDetailData: (data) => data.getqtyItem,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: summaryLayout(
                          item: state.$3,
                          label: "Stok menipis",
                          getName: (data) => data.getnameItem,
                          getDetailData: (data) => data.getqtyItem,
                          labelAfterName: "Sisa Stok",
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: summaryLayoutList(
                                labelColor: AppPropertyColor.secondPrimary,
                                item: state.$4,
                                label: "Hampir Kadaluarsa",
                                getCount: (data) => data.length,
                                onPressed: () {
                                  customBottomSheet(
                                    context: context,
                                    resetItemForm: null,
                                    content: (scrollController) =>
                                        MainMenuContentExpired(
                                          expiredItem: state.$5,
                                          controller: scrollController,
                                        ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: summaryLayoutList(
                                item: state.$5,
                                label: "Sudah Kadaluarsa",
                                getCount: (data) => data.length,
                                onPressed: () {
                                  customBottomSheet(
                                    context: context,
                                    resetItemForm: null,
                                    content: (scrollController) =>
                                        MainMenuContentExpired(
                                          expiredItem: state.$5,
                                          controller: scrollController,
                                        ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
    );
  }

  Widget summaryLayout<T>({
    required T? item,
    required String label,
    required Function(T data) getName,
    required Function(T data) getDetailData,
    String? labelAfterName,
  }) {
    return Card(
      color: AppPropertyColor.white,
      elevation: 4,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppPropertyColor.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Text(
              label,
              style: lv05TextStyleWhite,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
            child: item != null
                ? Row(
                    children: [
                      Card(
                        elevation: 4,
                        child: Image.asset(
                          "assets/logo.png",
                          width: 25,
                          height: 25,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(getName(item), style: lv05TextStyle),
                            Text(
                              "${labelAfterName ?? "Terjual"}: ${formatQtyOrPrice(getDetailData(item))}",
                              style: lv05TextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Center(child: Text("-", style: lv2TextStyle)),
          ),
        ],
      ),
    );
  }

  Widget summaryLayoutList<T>({
    required T? item,
    required String label,
    required Function(T data) getCount,
    required Function() onPressed,
    Color? labelColor,
  }) {
    return customButton(
      padding: false,
      backgroundColor: AppPropertyColor.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: labelColor ?? AppPropertyColor.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Text(
              label,
              style: lv05TextStyleWhite,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: item != null
                ? Text("${getCount(item)}", style: lv2TextStyle)
                : Center(child: Text("-", style: lv4TextStyle)),
          ),
        ],
      ),

      onPressed: onPressed,
    );
  }
}
