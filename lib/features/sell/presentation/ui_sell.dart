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
import 'package:flutter_pos/widget/common_widget/widget_navigation_gesture.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UiSell extends StatefulWidget {
  const UiSell({super.key});

  @override
  State<UiSell> createState() => _UiSellState();
}

class _UiSellState extends State<UiSell> {
  TextEditingController searchController = TextEditingController();
  double ratioGridView = 0;
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
                child:
                    BlocSelector<
                      SellBloc,
                      SellState,
                      (List<ModelKategori>?, ModelKategori?)
                    >(
                      selector: (state) {
                        if (state is SellLoaded) {
                          return (state.dataKategori, state.selectedKategori);
                        }
                        return (null, null);
                      },
                      builder: (context, state) {
                        if (state.$1 == null) {
                          return const SpinKitThreeBounce(
                            color: Colors.blue,
                            size: 30.0,
                          );
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.$1!.length,
                          itemBuilder: (context, index) {
                            final kategori = state.$1![index];

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
                                    child: Material(
                                      borderRadius: BorderRadius.circular(15),
                                      color:
                                          kategori.getidKategori ==
                                              state.$2!.getidKategori
                                          ? AppColor.primary
                                          : Colors.grey.shade300,
                                      child: Padding(
                                        padding: EdgeInsetsGeometry.all(5),
                                        child: Text(
                                          kategori.getnamaKategori,
                                          style: TextStyle(fontSize: 12),
                                        ),
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
            SizedBox(
              width: 140,
              child:
                  BlocSelector<
                    SellBloc,
                    SellState,
                    (List<ModelCabang>?, String?)
                  >(
                    selector: (state) {
                      if (state is SellLoaded) {
                        return (state.dataCabang, state.selectedIDCabang);
                      }
                      return ([], "");
                    },
                    builder: (context, state) {
                      if (state.$1!.isEmpty) {
                        return const SpinKitThreeBounce(
                          color: Colors.blue,
                          size: 30.0,
                        );
                      }

                      return DropdownButtonFormField<ModelCabang>(
                        padding: EdgeInsets.all(5),
                        style: lv05TextStyle,
                        initialValue: state.$1!.firstWhere(
                          (data) => data.getidCabang == state.$2,
                        ),
                        items: state.$1!
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
