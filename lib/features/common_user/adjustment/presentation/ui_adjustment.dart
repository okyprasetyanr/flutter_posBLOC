import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/common_widget/widget_custom_bottom_sheet.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_date.dart';
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
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
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
  final sellPriceController = TextEditingController();
  final BuyPriceController = TextEditingController();
  double qty = 0;
  String? dayExpired = "";
  String? monthExpired = "";
  String? yearExpired = "";
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
                    label: "Cari...",
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
    return BlocListener<AdjustmentBloc, AdjustmentState>(
      listener: (context, state) {
        if (state is AdjustmentLoaded) {
          if (state.selectedItemBatch != null) {
            final itemBatch = state.selectedItemBatch!;
            sellPriceController.text = itemBatch.getpriceItemFinal.toString();
            BuyPriceController.text = itemBatch.getpriceItemBuy.toString();
            qty = itemBatch.getqtyItem_in;
            dayExpired = itemBatch.getexpiredDate?.day.toString();
            monthExpired = itemBatch.getexpiredDate?.month.toString();
            yearExpired = itemBatch.getexpiredDate?.year.toString();

            devLog("Log UIAdjustment: data: $itemBatch ");
          }
        }
      },
      child: BlocSelector<AdjustmentBloc, AdjustmentState, List<ModelItemBatch>>(
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
                                      "Stok Masuk",
                                      formatQtyOrPrice(item.getqtyItem_in),
                                    ),
                                    rowContent(
                                      "Stok Keluar",
                                      formatQtyOrPrice(item.getqtyItem_out),
                                    ),
                                    rowContent(
                                      "Stok Sisa",
                                      formatQtyOrPrice(
                                        item.getqtyItem_in -
                                            item.getqtyItem_out,
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
                        bloc.add(
                          AdjustmentSelectedItemBatch(selectedItemBatch: item),
                        );
                        customBottomSheet(
                          context: context,
                          resetItemForm: null,
                          content: (scrollController) => BlocProvider.value(
                            value: bloc,
                            child: ListView(
                              controller: scrollController,
                              children: [
                                rowContent(
                                  "Tanggal",
                                  formatDate(date: item.getdateBuy),
                                ),

                                Row(
                                  children: [
                                    Text("Stok Masuk", style: lv05TextStyle),
                                    Text(":", style: lv05TextStyle),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          style: ButtonStyle(
                                            minimumSize: WidgetStatePropertyAll(
                                              Size(0, 0),
                                            ),
                                            padding: WidgetStatePropertyAll(
                                              EdgeInsets.all(5),
                                            ),
                                            shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                                side: BorderSide(
                                                  width: 1,
                                                  color: AppPropertyColor.black,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            bloc.add(
                                              AdjustmentAdjustData(
                                                isIncrement: false,
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.remove,
                                            size: lv2IconSize,
                                            color: AppPropertyColor.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 18,
                                          child: Text(
                                            formatQtyOrPrice(qty),
                                            style: lv1TextStyleBold,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        IconButton(
                                          style: ButtonStyle(
                                            minimumSize: WidgetStatePropertyAll(
                                              Size(0, 0),
                                            ),
                                            padding: WidgetStatePropertyAll(
                                              EdgeInsets.all(5),
                                            ),
                                            shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                                side: BorderSide(
                                                  width: 1,
                                                  color: AppPropertyColor.black,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          padding: const EdgeInsets.only(),
                                          onPressed: () {
                                            bloc.add(
                                              AdjustmentAdjustData(
                                                isIncrement: true,
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            size: lv2IconSize,
                                            color: AppPropertyColor.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                customTextField(
                                  controller: sellPriceController,
                                  label: "Harga Jual",
                                ),
                                customTextField(
                                  controller: sellPriceController,
                                  label: "Harga Beli",
                                ),
                                Row(
                                  children: [
                                    Text("Kadaluarsa", style: lv05TextStyle),
                                    Expanded(
                                      child: WidgetCustomDate(
                                        initDay: dayExpired,
                                        initMonth: monthExpired,
                                        initYear: yearExpired,
                                        onSelected: (day, month, year) {
                                          devLog(
                                            "Log UITransaction: CustomDate: $year-$month-$day",
                                          );
                                          bloc.add(
                                            AdjustmentAdjustData(
                                              day: day,
                                              month: month,
                                              year: year,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                customButtonIcon(
                                  backgroundColor: color,
                                  label: Text(
                                    "Simpan",
                                    style: lv05TextStyleWhite,
                                  ),
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.check_rounded,
                                    color: AppPropertyColor.white,
                                  ),
                                ),
                              ],
                            ),
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
      ),
    );
  }

  Future<void> refreshIndicator() async {
    await context.read<DataUserRepositoryCache>().initTransaction();
    context.read<AdjustmentBloc>().add(AdjustmentGetData());
  }
}
