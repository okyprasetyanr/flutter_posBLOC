import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/adjustment/logic/adjustment_bloc.dart';
import 'package:flutter_pos/features/common_user/adjustment/logic/adjustment_event.dart';
import 'package:flutter_pos/features/common_user/adjustment/logic/adjustment_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UIAdjustmentGridViewItem extends StatelessWidget {
  const UIAdjustmentGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      AdjustmentBloc,
      AdjustmentState,
      (List<ModelItem>, bool)
    >(
      selector: (state) {
        if (state is AdjustmentLoaded) {
          return (state.filteredItem, state.isAdjustIn);
        }
        return ([], false);
      },
      builder: (context, state) {
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: state.$1.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: 110,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = state.$1[index];
            return Material(
              color: AppPropertyColor.white,
              borderRadius: BorderRadius.circular(15),
              elevation: 4,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      context.read<AdjustmentBloc>().add(
                        AdjustmentSelectedItem(selectedData: item),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsetsGeometry.all(3),
                      child: Column(
                        children: [
                          Image.asset("assets/logo.png", height: 50),
                          const SizedBox(height: 5),
                          Text(
                            item.getnameItem,
                            style: lv05TextStyle,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              formatPriceRp(
                                state.$2
                                    ? UserSession.getStatusFifo()
                                          ? item.getpriceItembyBatch == 0
                                                ? item.getpriceItem
                                                : item.getpriceItembyBatch
                                          : item.getpriceItem
                                    : item.getpriceItemBuybyBatch,
                              ),
                              style: lv05textStylePrice,
                              textAlign: TextAlign.left,
                            ),
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                formatQtyOrPrice(item.getqtyItem),
                                style: lv0TextStyleRED,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (item.getstatusCondiment == StatusData.Aktif)
                    Positioned(
                      top: -5,
                      right: -15,
                      child: Transform.rotate(
                        angle: 0.8,
                        child: Container(
                          width: 40,
                          height: 20,
                          color: AppPropertyColor.primary,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
