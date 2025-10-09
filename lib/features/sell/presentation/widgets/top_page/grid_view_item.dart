import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_item_pesanan.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:uuid/uuid.dart';

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
                  ModelItemPesanan selectedItem = ModelItemPesanan(
                    idCabang: items[index].getidCabang,
                    namaItem: items[index].getnamaItem,
                    idItem: items[index].getidItem,
                    idPesanan: Uuid().v4(),
                    qtyItem: 1,
                    hargaItem: items[index].gethargaItem,
                    diskonItem: "0",
                    idKategoriItem: items[index].getidKategoriItem,
                    idCondimen: "0",
                    catatan: "",
                    urlGambar: items[index].geturlGambar,
                    condiment: [],
                  );

                  context.read<SellBloc>().add(
                    SellSelectedItem(selectedItem: selectedItem),
                  );
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
