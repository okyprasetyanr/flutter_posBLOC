import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UiSell extends StatefulWidget {
  const UiSell({super.key});

  @override
  State<UiSell> createState() => _UiSellState();
}

class _UiSellState extends State<UiSell> {
  TextEditingController searchController = TextEditingController();
  List<ModelKategori> filterkategori = [
    ModelKategori(namaKategori: "All", idkategori: "0", idCabang: "0"),
  ];
  String? selectedIdKategori;
  @override
  void initState() {
    super.initState();
    selectedIdKategori = filterkategori.first.getidKategori;
    initData();
  }

  Future<void> initData() async {
    final bloc = context.read<SellBloc>();
    bloc.add(
      AmbilDataSellBloc(filterIDKategori: selectedIdKategori!, idCabang: null),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      widgetTop: layoutTop(),
      widgetBottom: layoutBottom(),
      widgetNavigation: navigationGesture(),
      refreshIndicator: _onRefresh,
    );
  }

  Widget layoutTop() {
    return Column(
      children: [
        Text("Penjualan", style: labelTextStyle),
        const SizedBox(height: 10),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                setState(() {});
              },
              label: Text("Menu", style: lv1TextStyle),
              icon: Icon(Icons.menu_rounded, color: Colors.white),
            ),
            const SizedBox(width: 10),
            TextField(
              style: lv05TextStyle,
              controller: searchController,
              decoration: InputDecoration(
                hint: Text("Search...", style: lv05TextStyle),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {});
              },
              label: Text("QR", style: lv1TextStyle),
              icon: Icon(Icons.qr_code_2_rounded, color: Colors.white),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {});
              },
              label: Text("Bag", style: lv1TextStyle),
              icon: Icon(Icons.shopping_bag_rounded, color: Colors.white),
            ),
          ],
        ),
        BlocSelector<SellBloc, SellState, (List<ModelItem>, String? idCabang)>(
          selector: (state) {
            if (state is SellLoaded) {
              return (state.filteredItem, state.idCabang);
            }
            return ([], null);
          },
          builder: (context, state) {
            List<ModelItem> listItem = state.$1
                .where((element) => element.getidCabang == state.$2)
                .toList();
            if (listItem.isEmpty) {
              return const SpinKitThreeBounce(color: Colors.blue, size: 30.0);
            }
            return GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: listItem.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10,
                childAspectRatio: 8 / 12,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  elevation: 4,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      context.read<SellBloc>().add(
                        SellSelectedItem(
                          selectedItem: ModelItem(
                            qtyItem: listItem[index].getqtyitem,
                            uidUser: listItem[index].getuidUser,
                            namaItem: listItem[index].getnamaItem,
                            idItem: listItem[index].getidItem,
                            hargaItem: listItem[index].gethargaItem,
                            idKategoriItem: listItem[index].getidKategoriItem,
                            statusCondiment: listItem[index].getstatusCondiment,
                            urlGambar: "",
                            idCabang: listItem[index].getidCabang,
                            barcode: listItem[index].getBarcode,
                            statusItem: true,
                            tanggalItem: listItem[index].getTanggalItem,
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
                            listItem[index].getnamaItem,
                            style: lv05TextStyle,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              formatUang(listItem[index].gethargaItem),
                              style: textStyleHarga,
                              textAlign: TextAlign.left,
                            ),
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Text(
                                formatQty(listItem[index].getqtyitem),
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
                                color: listItem[index].getstatusCondiment
                                    ? AppColor.primary
                                    : Colors.grey.shade600,
                              ),
                              child: Text(
                                listItem[index].getstatusCondiment
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
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return Column(children: [
      
    ],);
  }

  Widget navigationGesture() {
    return Column(children: [
      
    ],);
  }

  Future<void> _onRefresh() async {}
}
