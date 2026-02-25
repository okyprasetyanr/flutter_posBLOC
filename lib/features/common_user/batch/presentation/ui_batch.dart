import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_bloc.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_event.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/common_widget/widget_navigation_gesture.dart';
import 'package:flutter_pos/common_widget/row_content.dart';

class UiBatch extends StatefulWidget {
  const UiBatch({super.key});

  @override
  State<UiBatch> createState() => _UiBatchState();
}

class _UiBatchState extends State<UiBatch> {
  final isOpen = ValueNotifier<bool>(false);
  final searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    isOpen.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    context.read<BatchBloc>().add(BatchGetData());
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

  Future<void> _onRefresh() async {}

  Widget layoutTop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            customButtonIcon(
              backgroundColor: AppPropertyColor.primary,
              icon: const Icon(
                Icons.menu_rounded,
                color: AppPropertyColor.white,
              ),
              label: Text("Menu", style: lv05TextStyleWhite),
              onPressed: () => isOpen.value = !isOpen.value,
            ),
            Spacer(),
            Text("Stok/Batch", style: titleTextStyle),
            const SizedBox(width: 3),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: customTextField(
                controller: searchController,
                enable: true,
                inputType: TextInputType.text,
                text: "Cari",
                onChanged: (value) {
                  context.read<BatchBloc>().add(BatchSearchItem(search: value));
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: BlocSelector<BatchBloc, BatchState, String>(
                selector: (state) =>
                    state is BatchLoaded ? state.idBranch ?? "" : "",
                builder: (context, state) {
                  return WidgetDropdownBranch(
                    idBranch: state,
                    selectedIdBranch: (selectedIdBranch) {
                      searchController.clear();
                      context.read<BatchBloc>().add(
                        BatchGetData(idBranch: selectedIdBranch),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child:
              BlocSelector<
                BatchBloc,
                BatchState,
                (List<ModelItem>, List<ModelItemBatch>)
              >(
                selector: (state) {
                  if (state is BatchLoaded) {
                    return (state.filteredItem, state.dataItemByIdItem ?? []);
                  }
                  return ([], []);
                },
                builder: (context, state) {
                  debugPrint("Log UIBatch: itemBatch: $state");
                  final itemById = state.$2;
                  return state.$1.isEmpty
                      ? Center(
                          child: Text(
                            "Belum ada item yang diRe-Stock",
                            style: lv05TextStyle,
                          ),
                        )
                      : itemById.isEmpty
                      ? GridView.builder(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 10,
                          ),
                          itemCount: state.$1.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisExtent: 95,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1,
                              ),
                          itemBuilder: (context, index) {
                            final data = state.$1[index];
                            return Material(
                              color: AppPropertyColor.white,
                              borderRadius: BorderRadius.circular(15),
                              elevation: 4,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  context.read<BatchBloc>().add(
                                    BatchSelectedIdItem(
                                      selectedIdItem: state.$1[index].getidItem,
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/logo.png",
                                        height: 50,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        data.getnameItem,
                                        style: lv05TextStyle,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            right: 5,
                                          ),
                                          child: Text(
                                            formatQtyOrPrice(data.getqtyItem),
                                            style: lv0TextStyleRED,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: itemById.length,
                          itemBuilder: (context, index) {
                            final item = itemById[index];
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Material(
                                color: AppPropertyColor.white,
                                borderRadius: BorderRadius.circular(10),
                                elevation: 4,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppPropertyColor.primary,
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
                                            formatQtyOrPrice(
                                              item.getqtyItem_in,
                                            ),
                                          ),
                                          rowContent(
                                            "Stock Keluar",
                                            formatQtyOrPrice(
                                              item.getqtyItem_out,
                                            ),
                                          ),
                                          rowContent(
                                            "Stock Sisa",
                                            formatQtyOrPrice(
                                              item.getqtyItem_in -
                                                  item.getqtyItem_out,
                                            ),
                                          ),
                                          rowContent(
                                            "Harga Jual",
                                            formatPriceRp(
                                              item.getpriceItemFinal,
                                            ),
                                          ),
                                          rowContent(
                                            "Harga Beli",
                                            formatPriceRp(item.getpriceItemBuy),
                                          ),
                                          rowContent(
                                            "Kadaluarsa",
                                            item.getexpiredDate?.toString() ??
                                                "-",
                                          ),
                                        ],
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
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: AppPropertyColor.black.withValues(alpha: 0.5),
            blurRadius: 3,
            spreadRadius: 1,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: BlocSelector<BatchBloc, BatchState, ModelItemBatch?>(
        selector: (state) {
          if (state is BatchLoaded) {
            return state.detailSelectedItem;
          }
          return null;
        },
        builder: (context, state) {
          return state == null
              ? Center(
                  child: Text(
                    "Pilih item untuk menampilkan Rangkuman!",
                    style: lv05TextStyle,
                  ),
                )
              : ListView(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset("assets/logo.png", height: 80),
                        ),
                        customButton(
                          backgroundColor: AppPropertyColor.primary,
                          child: const Icon(
                            Icons.close_rounded,
                            color: AppPropertyColor.white,
                          ),
                          onPressed: () {
                            context.read<BatchBloc>().add(BatchReset());
                            _initData();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    rowContent("Nama Item", state.getnameItem),
                    rowContent(
                      "Stock Masuk",
                      formatQtyOrPrice(state.getqtyItem_in),
                    ),
                    rowContent(
                      "Stock Keluar",
                      formatQtyOrPrice(state.getqtyItem_out),
                    ),
                    rowContent(
                      "Stock Sisa",
                      formatQtyOrPrice(
                        state.getqtyItem_in - state.getqtyItem_out,
                      ),
                    ),
                    rowContent(
                      "Batch Terbaru",
                      formatDate(date: state.getdateBuy),
                    ),
                    rowContent(
                      "Harga Jual Terkini",
                      formatPriceRp(state.getpriceItemFinal),
                    ),
                    rowContent(
                      "Harga Beli Terkini",
                      formatPriceRp(state.getpriceItemBuy),
                    ),
                  ],
                );
        },
      ),
    );
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
