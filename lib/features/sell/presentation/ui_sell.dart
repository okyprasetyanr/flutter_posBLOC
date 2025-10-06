import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_cabang.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/widget/widget_navigation_gesture.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UiSell extends StatefulWidget {
  const UiSell({super.key});

  @override
  State<UiSell> createState() => _UiSellState();
}

class _UiSellState extends State<UiSell> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    final bloc = context.read<SellBloc>();
    bloc.add(AmbilDataSellBloc(idCabang: null));
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
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                setState(() {});
              },
              label: Text("Menu", style: lv1TextStyleWhite),
              icon: Icon(Icons.menu_rounded, color: Colors.white),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColor.primary),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: TextField(
                style: lv05TextStyle,
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: lv05TextStyle,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.all(0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (value) =>
                    context.read<SellBloc>().add(SellSearchItem(text: value)),
              ),
            ),

            const SizedBox(width: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text("Penjualan", style: titleTextStyle),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: BlocSelector<SellBloc, SellState, List<ModelKategori>?>(
                  selector: (state) {
                    if (state is SellLoaded) {
                      return state.dataKategori;
                    }
                    return null;
                  },
                  builder: (context, state) {
                    if (state == null) {
                      return const SpinKitThreeBounce(
                        color: Colors.blue,
                        size: 30.0,
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        final kategori = state[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.read<SellBloc>().add(
                                    SellSelectedKategoriItem(
                                      selectedKategori: kategori,
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        (context.read<SellBloc>().state
                                                    as SellLoaded)
                                                .selectedIDKategori ==
                                            kategori.getidKategori
                                        ? AppColor.primary
                                        : Colors.grey.shade300,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    kategori.getnamaKategori,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: BlocSelector<SellBloc, SellState, List<ModelCabang>?>(
                selector: (state) {
                  if (state is SellLoaded) {
                    return state.dataCabang;
                  }
                  return [];
                },
                builder: (context, state) {
                  if (state == null && state!.isEmpty) {
                    return const SpinKitThreeBounce(
                      color: Colors.blue,
                      size: 30.0,
                    );
                  }
                  return DropdownButtonFormField<ModelCabang>(
                    style: lv05TextStyle,
                    initialValue: state.first,
                    items: state
                        .map(
                          (map) => DropdownMenuItem(
                            value: map,
                            child: Text(
                              map.getdaerahCabang,
                              style: lv05TextStyle,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      context.read<SellBloc>().add(
                        AmbilDataSellBloc(idCabang: value!.getidCabang),
                      );
                    },
                  );
                },
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    backgroundColor: WidgetStatePropertyAll(AppColor.primary),
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.shopping_bag_rounded,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  right: 14,
                  top: 4,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: BlocSelector<SellBloc, SellState, List<ModelItem>>(
            selector: (state) {
              if (state is SellLoaded) {
                return state.filteredItem!;
              }
              return [];
            },
            builder: (context, items) {
              return GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: items!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 4,
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
          ),
        ),
        Expanded(
          child: BlocSelector<SellBloc, SellState, (List<ModelItem>, String?)>(
            selector: (state) {
              if (state is SellLoaded) {
                return (state.filteredItem!, state.selectedIDCabang!);
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
                              statusCondiment:
                                  listItem[index].getstatusCondiment,
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
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return Column(children: [
      
    ],);
  }

  Widget navigationGesture() {
    final contentNavGesture = [
      {
        "id": "sell",
        "toContext": const UiSell(),
        "text_menu": "Sell",
        "onTap": () {},
      },
    ];

    return NavigationGesture(
      currentPage: "inventory",
      attContent: contentNavGesture,
      isOpen: false,
      close: () {
        setState(() {
          false;
        });
      },
    );
  }

  Future<void> _onRefresh() async {}
}
