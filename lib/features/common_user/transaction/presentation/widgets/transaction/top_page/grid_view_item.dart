import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_event.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_state.dart';
import 'package:flutter_pos/features/common_user/transaction/presentation/widgets/transaction/pop_item/main_page/popup_item.dart';
import 'package:flutter_pos/function/bottom_sheet.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';
import 'package:uuid/uuid.dart';

class UITransactionGridViewItem extends StatelessWidget {
  const UITransactionGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      TransactionBloc,
      TransactionState,
      (List<ModelItem>, bool)
    >(
      selector: (state) {
        if (state is TransactionLoaded) {
          return (state.filteredItem!.toList(), state.isSell);
        }
        return ([], false);
      },
      builder: (context, items) {
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: items.$1.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: 110,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = items.$1[index];
            return Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              elevation: 4,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      final idOrdered = Uuid().v4();
                      ModelItemOrdered selectedItem = ModelItemOrdered(
                        itemOrderedBatch: [],
                        priceItemFinal: item.getpriceItem,
                        subTotal: item.getpriceItem,
                        idBranch: item.getidBranch,
                        nameItem: item.getnameItem,
                        idItem: item.getidItem,
                        idOrdered: idOrdered,
                        qtyItem: 0,
                        priceItem: item.getpriceItem,
                        discountItem: 0,
                        idCategoryItem: item.getidCategoryiItem,
                        note: "",
                        condiment: [],
                      );

                      debugPrint(
                        "Log UITransaction: idOrdered Item: $idOrdered",
                      );

                      if (UserSession.getStatusFifo() &&
                          item.getqtyItem == 0 &&
                          items.$2) {
                        return customSnackBar(
                          context,
                          "Mode FIFO: Qty 0 tidak dapat dipilih!",
                        );
                      }
                      context.read<TransactionBloc>().add(
                        TransactionSelectedItem(
                          selectedItem: selectedItem,
                          edit: false,
                        ),
                      );
                      final bloc = context.read<TransactionBloc>();
                      final available =
                          checkQTY(
                            (bloc.state as TransactionLoaded).itemOrdered,
                            (bloc.state as TransactionLoaded).dataItem!,
                          ).entries.any(
                            (element) =>
                                element.value.ordered >= element.value.stock,
                          );
                      if (available) {
                        return customSnackBar(
                          context,
                          "FIFO: Stok sudah mencapai batas",
                        );
                      }

                      customBottomSheet(
                        context: context,
                        resetItemForm: () {
                          context.read<TransactionBloc>().add(
                            TransactionResetSelectedItem(),
                          );
                        },
                        content: (scrollController) {
                          return UITransactionPopUpItem();
                        },
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
                              formatPriceRp(item.getpriceItem),
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
