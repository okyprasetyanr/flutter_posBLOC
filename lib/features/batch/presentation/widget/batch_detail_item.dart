// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/row_content.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/features/batch/logic/batch_bloc.dart';
import 'package:flutter_pos/features/batch/logic/batch_event.dart';
import 'package:flutter_pos/features/batch/logic/batch_state.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/features/batch/model/model_item_batch.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class BatchDetailItem extends StatelessWidget {
  final TextEditingController searchController;
  const BatchDetailItem({Key? key, required this.searchController})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            context.read<BatchBloc>().add(BatchGetData());
                            searchController.clear();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    rowContent("Nama Item", state.getnameItem),
                    rowContent(
                      "Stok Masuk",
                      formatQtyOrPrice(state.getqtyItem_in),
                    ),
                    rowContent(
                      "Stok Keluar",
                      formatQtyOrPrice(state.getqtyItem_out),
                    ),
                    rowContent(
                      "Stok Sisa",
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
}
