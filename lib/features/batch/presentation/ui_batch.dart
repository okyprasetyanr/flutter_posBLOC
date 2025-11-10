import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/batch/logic/batch_bloc.dart';
import 'package:flutter_pos/features/batch/logic/batch_event.dart';
import 'package:flutter_pos/features/batch/logic/batch_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/common_widget/widget_navigation_gesture.dart';
import 'package:flutter_pos/widget/common_widget/row_content.dart';

class UiBatch extends StatefulWidget {
  const UiBatch({super.key});

  @override
  State<UiBatch> createState() => _UiBatchState();
}

class _UiBatchState extends State<UiBatch> {
  final isOpen = ValueNotifier<bool>(false);

  @override
  void dispose() {
    isOpen.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    context.read<BatchBloc>().add(BatchGetData(idBranch: null));
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
    return BlocSelector<BatchBloc, BatchState, List<ModelItem>?>(
      selector: (state) {
        if (state is BatchLoaded) {
          return state.dataItem;
        }
        return null;
      },
      builder: (context, state) {
        debugPrint("Log UIBatch: itemBatch: $state");
        return state == null || state.isEmpty
            ? Center(
                child: Text(
                  "Belum ada item yang diRe-Stock",
                  style: lv05TextStyle,
                ),
              )
            : BlocSelector<BatchBloc, BatchState, List<ModelItemBatch>?>(
                selector: (state) {
                  if (state is BatchLoaded) {
                    return state.dataItemByIdItem;
                  }
                  return null;
                },
                builder: (context, itemById) {
                  return itemById == null || itemById.isEmpty
                      ? GridView.builder(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 10,
                          ),
                          itemCount: state.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisExtent: 110,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1,
                              ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                context.read<BatchBloc>().add(
                                  BatchSelectedIdItem(
                                    selectedIdItem: state[index].getidItem,
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Column(
                                  children: [
                                    Image.asset("assets/logo.png", height: 50),
                                    const SizedBox(height: 5),
                                    Text(
                                      state[index].getnameItem,
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
                                          formatQtyOrPrice(
                                            state[index].getqtyItem,
                                          ),
                                          style: lv0TextStyleRED,
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: itemById.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Text("Nota: ${itemById[index].getinvoice}"),
                                rowContent(
                                  "Stock Masuk",
                                  formatQtyOrPrice(
                                    itemById[index].getqtyItem_in,
                                  ),
                                ),
                                rowContent(
                                  "Stock Keluar",
                                  formatQtyOrPrice(
                                    itemById[index].getqtyItem_out,
                                  ),
                                ),
                                rowContent(
                                  "Stock Sisa",
                                  formatQtyOrPrice(
                                    itemById[index].getqtyItem_in -
                                        itemById[index].getqtyItem_out,
                                  ),
                                ),
                                rowContent(
                                  "Tanggal",
                                  itemById[index].getdateBuy,
                                ),
                                rowContent(
                                  "Kadaluarsa",
                                  itemById[index].getexpiredDate ?? "-",
                                ),
                              ],
                            );
                          },
                        );
                },
              );
      },
    );
  }

  Widget layoutBottom() {
    return BlocSelector<BatchBloc, BatchState, ModelItemBatch?>(
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
            : Column(
                children: [
                  Image.asset("assets/logo.png", height: 100),
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
                  rowContent("Batch Terbaru", state.getdateBuy),
                ],
              );
      },
    );
  }

  Widget? widgetNavigation() {
    final contentNavGesture = [
      {
        "id": "inventory",
        "toContext": "/inventory",
        "text_menu": "Inventori",
        "onTap": () {},
      },
      {
        "id": "batch",
        "toContext": "/batch",
        "text_menu": "Batch",
        "onTap": () {},
      },
    ];

    return NavigationGesture(
      currentPage: "inventory",
      attContent: contentNavGesture,
      isOpen: isOpen,
      close: () {
        isOpen.value = false;
      },
    );
  }
}
