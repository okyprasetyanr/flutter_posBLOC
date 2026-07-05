import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_bottom_sheet.dart';
import 'package:flutter_pos/features/common_user/transaction_adjustment/logic/transaction_adjustment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction_adjustment/logic/transaction_adjustment_event.dart';
import 'package:flutter_pos/features/common_user/transaction_adjustment/logic/transaction_adjustment_state.dart';
import 'package:flutter_pos/features/common_user/transaction_adjustment/presentation/widget/t_adjustment_botshet_content.dart';
import 'package:flutter_pos/features/common_user/transaction_adjustment/presentation/widget/t_adjustment_list_batch_content.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_date.dart';
import 'package:flutter_pos/model_data/model_item_batch.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/template/dynamic_stl_for_color_wrapper.dart';

class TAdjustmentListBatch extends StatefulWidget {
  const TAdjustmentListBatch({super.key});

  @override
  State<TAdjustmentListBatch> createState() => _TAdjustmentListBatchState();
}

class _TAdjustmentListBatchState extends State<TAdjustmentListBatch> {
  final searchItemBatchController = TextEditingController();
  final sellPriceController = TextEditingController();
  final buyPriceController = TextEditingController();
  final noteController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  ModelDateExpired? dateExpired;
  @override
  void dispose() {
    searchItemBatchController.dispose();
    sellPriceController.dispose();
    buyPriceController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdjustmentBloc, AdjustmentState>(
      listener: (context, state) {
        if (state is AdjustmentLoaded) {
          if (state.editedItemBatch != null) {
            final itemBatch = state.editedItemBatch!;
            sellPriceController.text = formatQtyOrPrice(
              itemBatch.getpriceItemFinal,
            );
            buyPriceController.text = formatQtyOrPrice(
              itemBatch.getpriceItemBuy,
            );
            dateExpired = ModelDateExpired(
              dayExpired: itemBatch.getexpiredDate?.day.toString(),
              monthExpired: itemBatch.getexpiredDate?.month.toString(),
              yearExpired: itemBatch.getexpiredDate?.year.toString(),
            );

            devLog("Log UIAdjustment: data: $itemBatch ");
          }
        }
      },
      child:
          BlocSelector<AdjustmentBloc, AdjustmentState, List<ModelItemBatch>>(
            selector: (state) =>
                state is AdjustmentLoaded ? state.filteredItemBatch : [],
            builder: (context, state) => state.isNotEmpty
                ? DynamicColorWrapper(
                    colorSelector: (context) => context.colorAdjustment,
                    builder: (context, color) => ListView.builder(
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        final item = state[index];
                        return InkWell(
                          child: TAdjustmentListBatchContent(
                            color: color,
                            item: item,
                          ),
                          onTap: () {
                            final bloc = context.read<AdjustmentBloc>();
                            bloc.add(
                              AdjustmentSelectedItemBatch(
                                selectedItemBatch: item,
                              ),
                            );

                            customBottomSheet(
                              context: context,
                              resetItemForm: () {
                                devLog("Log UIAdjustment: check Reset: true");
                                noteController.clear();
                                dateExpired = null;
                                bloc.add(AdjustmentResetSelectedData());
                                devLog(
                                  "Log UIAdjustment: resetDate: $dateExpired",
                                );
                              },
                              content: (scrollController) => BlocProvider.value(
                                value: bloc,
                                child: TAdjustmentBotshetContent(
                                  color: color,
                                  invoice: item.getinvoice,
                                  sellPriceController: sellPriceController,
                                  buyPriceController: buyPriceController,
                                  noteController: noteController,
                                  keyForm: _keyForm,
                                  dateExpired: dateExpired,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                : Center(
                    child: Text("Batch Kosong!", style: lv05TextStyleBold),
                  ),
          ),
    );
  }
}
