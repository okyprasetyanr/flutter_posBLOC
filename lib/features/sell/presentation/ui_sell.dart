import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/logic/sell_state.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/model_data/model_kategori.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template_responsif/layout_top_bottom_standart.dart';
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
            if (state.$1.isEmpty) {
              return const SpinKitThreeBounce(color: Colors.blue, size: 30.0);
            }
            return GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: state.$1.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10,
                childAspectRatio: 8 / 12,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {},
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
