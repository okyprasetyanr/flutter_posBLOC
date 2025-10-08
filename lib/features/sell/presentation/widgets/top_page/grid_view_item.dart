import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class UISellGridViewItem extends StatelessWidget {
  const UISellGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SellBloc, SellState, List<ModelItem>>(
      selector: (state) {
        if (state is SellLoaded) {
          return state.filteredItem!;
        }
        return [];
      },
      builder: (context, items) {
        return GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 9 / 11,
          ),
          itemBuilder: (context, index) {
            return Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  // context.read<SellBloc>().add(
                  //   InvSelectedItem(
                  //     selectedItem: ModelItem(
                  //       qtyItem: items[index].getqtyitem,
                  //       uidUser: items[index].getuidUser,
                  //       namaItem: items[index].getnamaItem,
                  //       idItem: items[index].getidItem,
                  //       hargaItem: items[index].gethargaItem,
                  //       idKategoriItem: items[index].getidKategoriItem,
                  //       statusCondiment:
                  //           items[index].getstatusCondiment,
                  //       urlGambar: "",
                  //       idCabang: items[index].getidCabang,
                  //       barcode: items[index].getBarcode,
                  //       statusItem: true,
                  //       tanggalItem: items[index].getTanggalItem,
                  //     ),
                  //   ),
                  // );
                },
                child: Padding(
                  padding: EdgeInsetsGeometry.all(3),
                  child: Column(
                    children: [
                      Image.asset("assets/logo.png", height: 50),
                      const SizedBox(height: 5),
                      Text(
                        items[index].getnamaItem,
                        style: lv05TextStyle,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          formatUang(items[index].gethargaItem),
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
