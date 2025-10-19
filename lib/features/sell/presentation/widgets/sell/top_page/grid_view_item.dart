import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_ordered.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:uuid/uuid.dart';

class UISellGridViewItem extends StatelessWidget {
  const UISellGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    String idPesananNota = Uuid().v1();
    return BlocSelector<SellBloc, SellState, List<ModelItem>>(
      selector: (state) {
        if (state is SellLoaded) {
          return state.filteredItem!
              .where((element) => !element.getstatusCondiment)
              .toList();
        }
        return [];
      },
      builder: (context, items) {
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: 110,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  ModelItemOrdered selectedItem = ModelItemOrdered(
                    idCustomer: null,
                    nameCustomer: null,
                    priceItemCustom: items[index].getpriceItem,
                    subTotal: items[index].getpriceItem,
                    idBranch: items[index].getidBranch,
                    nameItem: items[index].getnameItem,
                    idItem: items[index].getidItem,
                    idOrdered: idPesananNota,
                    qtyItem: 1,
                    priceItem: items[index].getpriceItem,
                    discountItem: 0,
                    idCategoryItem: items[index].getidCategoryiItem,
                    idCondiment: Uuid().v4(),
                    note: "",
                    urlImage: items[index].geturlImage,
                    condiment: [],
                  );

                  context.read<SellBloc>().add(
                    SellSelectedItem(selectedItem: selectedItem, edit: false),
                  );
                },
                child: Padding(
                  padding: const EdgeInsetsGeometry.all(3),
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
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            formatQty(items[index].getqtyitem),
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
        );
      },
    );
  }
}
