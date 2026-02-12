import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_spin_kit.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UIInventoryGridViewItem extends StatelessWidget {
  const UIInventoryGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<InventoryBloc, InventoryState, List<ModelItem>>(
      selector: (state) {
        if (state is InventoryLoaded) {
          return state.filteredDataItem;
        }
        return const [];
      },
      builder: (contextBloc, state) {
        final items = state;
        return GridView.builder(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: 110,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            debugPrint(
              "Log UIInventoryGridViewItem: priceItem: ${item.getpriceItem}, priceItemByBatch: ${item.getpriceItemByBatch}",
            );
            return Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              elevation: 4,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      context.read<InventoryBloc>().add(
                        InventorySelectedItem(
                          selectedItem: ModelItem(
                            priceItemByBatch: item.getpriceItemByBatch,
                            priceItemBuyByBatch: item.getpriceItemBuyByBatch,
                            qtyItem: item.getqtyItem,
                            nameItem: item.getnameItem,
                            idItem: item.getidItem,
                            priceItem: item.getpriceItem,
                            idCategoryItem: item.getidCategoryiItem,
                            statusCondiment: item.getstatusCondiment,
                            urlImage: item.geturlImage,
                            idBranch: item.getidBranch,
                            barcode: item.getBarcode,
                            statusItem: StatusData.Aktif,
                            date: item.getDateItem,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Column(
                        children: [
                          FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('items')
                                .doc(item.getidItem)
                                .get(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(child: customSpinKit());
                              }

                              final data = snapshot.data!.data();

                              return data != null
                                  ? data['imageUrl'] != null
                                        ? Image.network(
                                            data['imageUrl'],
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            "assets/logo.png",
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          )
                                  : Image.asset(
                                      "assets/logo.png",
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    );
                            },
                          ),
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
                                UserSession.getStatusFifo()
                                    ? item.getpriceItemByBatch == 0
                                          ? item.getpriceItem
                                          : item.getpriceItemByBatch
                                    : item.getpriceItem,
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
