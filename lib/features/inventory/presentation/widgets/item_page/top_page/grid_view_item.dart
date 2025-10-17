import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_event.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class UIInventoryGridViewItem extends StatelessWidget {
  final double ratioGridView;
  const UIInventoryGridViewItem({super.key, required this.ratioGridView});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      InventoryBloc,
      InventoryState,
      (List<ModelItem>, String? idCabang)
    >(
      selector: (state) {
        if (state is InventoryLoaded) {
          return (state.filteredDataItem, state.idCabang);
        }
        return ([], null);
      },
      builder: (contextBloc, state) {
        final items = state.$1
            .where((data) => data.getidBranch == state.$2)
            .toList();
        return GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: ratioGridView,
          ),
          itemBuilder: (context, index) {
            return Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  context.read<InventoryBloc>().add(
                    InvSelectedItem(
                      selectedItem: ModelItem(
                        qtyItem: items[index].getqtyitem,
                        uidUser: items[index].getuidUser,
                        nameItem: items[index].getnameItem,
                        idItem: items[index].getidItem,
                        priceItem: items[index].getpriceItem,
                        idCategoryItem: items[index].getidCategoryiItem,
                        statusCondiment: items[index].getstatusCondiment,
                        urlImage: "",
                        idBranch: items[index].getidBranch,
                        barcode: items[index].getBarcode,
                        statusItem: true,
                        dateItem: items[index].getDateItem,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsetsGeometry.all(3),
                  child: Column(
                    children: [
                      Image.asset("assets/logo.png", height: 50),
                      const SizedBox(height: 5),
                      Text(
                        items[index].getnameItem,
                        style: lv05TextStyle,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          formatUang(items[index].getpriceItem),
                          style: textStyleHarga,
                          textAlign: TextAlign.left,
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            formatQty(items[index].getqtyitem),
                            style: lv0TextStyleRED,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: items[index].getstatusCondiment
                                ? AppColor.primary
                                : Colors.grey.shade600,
                          ),
                          child: Text(
                            items[index].getstatusCondiment
                                ? "Condiment"
                                : "Normal",
                            style: lv05TextStyleWhite,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
