// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_icon_button_min_plus.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_text_field.dart';
import 'package:flutter_pos/features/transaction_adjustment/logic/transaction_adjustment_bloc.dart';
import 'package:flutter_pos/features/transaction_adjustment/logic/transaction_adjustment_event.dart';
import 'package:flutter_pos/features/transaction_adjustment/logic/transaction_adjustment_state.dart';
import 'package:flutter_pos/features/transaction_adjustment/presentation/widget/t_adjustment_botshet_button.dart';
import 'package:flutter_pos/features/transaction_adjustment/presentation/widget/t_adjustment_botshet_for_in.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/batch/model/model_date_expired.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class TAdjustmentBotshetContent extends StatefulWidget {
  final Color color;
  final String invoice;
  final ModelDateExpired? dateExpired;
  final TextEditingController sellPriceController;
  final TextEditingController buyPriceController;
  final TextEditingController noteController;
  final GlobalKey<FormState> keyForm;
  const TAdjustmentBotshetContent({
    super.key,
    required this.color,
    required this.invoice,
    this.dateExpired,
    required this.sellPriceController,
    required this.buyPriceController,
    required this.noteController,
    required this.keyForm,
  });

  @override
  State<TAdjustmentBotshetContent> createState() =>
      _TAdjustmentBotshetContentState();
}

class _TAdjustmentBotshetContentState extends State<TAdjustmentBotshetContent> {
  late bool isAdjustmentIn;

  final dateExp = ValueNotifier<ModelDateExpired?>(null);

  @override
  void dispose() {
    dateExp.dispose();
    super.dispose();
  }

  @override
  void initState() {
    isAdjustmentIn =
        (context.read<AdjustmentBloc>().state as AdjustmentLoaded).isAdjustIn;
    dateExp.value = widget.dateExpired;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
      child: Column(
        children: [
          customTextBorder(
            "Penyesuaian ${isAdjustmentIn ? "Masuk" : "Keluar"}",
            titleTextStyleWhite,
            color: widget.color,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: Row(
                  children: [
                    Text("Nomor Faktur:", style: lv05TextStyle),
                    Spacer(),
                    Text(":", style: lv1TextStyle),
                  ],
                ),
              ),
              Text(widget.invoice, style: lv05TextStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: Row(
                  children: [
                    Text(
                      isAdjustmentIn ? "Stok Masuk" : "Stock Keluar",
                      style: lv05TextStyle,
                    ),
                    Spacer(),
                    Text(":", style: lv1TextStyle),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  SizedBox(
                    width: 18,
                    child:
                        BlocSelector<AdjustmentBloc, AdjustmentState, double>(
                          selector: (state) => state is AdjustmentLoaded
                              ? state.isAdjustIn
                                    ? state.editedItemBatch?.getqtyItem_in ?? 0
                                    : state.editedItemBatch?.getqtyItem_out ?? 0
                              : 0,
                          builder: (context, state) => Text(
                            formatQtyOrPrice(state),
                            style: lv05TextStyleBold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                  ),
                  customIconButtonMinPlus(
                    isIncrement: true,
                    onPressed: () => context.read<AdjustmentBloc>().add(
                      AdjustmentAdjustData(adjustQty: true),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (isAdjustmentIn)
            Expanded(
              child: TAdjustmentBotshetForIn(
                color: widget.color,
                keyForm: widget.keyForm,
                noteController: widget.noteController,
                sellPriceController: widget.sellPriceController,
                buyPriceController: widget.buyPriceController,
                onSelect: ({required date}) => dateExp.value = date,
              ),
            ),
          Form(
            key: widget.keyForm,
            child: customTextField(
              controller: widget.noteController,
              label: "Catatan",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Tidak boleh kosong!";
                }
                return null;
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: dateExp,
            builder: (context, value, child) {
              devLog("Log UIAdjustment: dataExpired: $value");
              return TAdjustmentBotshetButton(
                color: widget.color,
                dateExpired: value,
                keyForm: widget.keyForm,
                noteController: widget.noteController,
              );
            },
          ),
        ],
      ),
    );
  }
}
