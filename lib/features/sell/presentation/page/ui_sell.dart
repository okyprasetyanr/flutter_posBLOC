import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/features/sell/logic/sell_bloc.dart';
import 'package:flutter_pos/features/sell/logic/sell_event.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/top_page/dropdown_cabang.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/top_page/grid_view_item.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/top_page/list_view_kategori.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/top_page/pop_item/main_page/popup_item.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/top_page/saved_cart.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/template/layout_top_bottom_standart.dart';
import 'package:flutter_pos/features/sell/presentation/widgets/bottom_page/list_view_ordered_item.dart.dart';
import 'package:flutter_pos/widget/common_widget/widget_navigation_gesture.dart';

class UiSell extends StatefulWidget {
  const UiSell({super.key});

  @override
  State<UiSell> createState() => _UiSellState();
}

class _UiSellState extends State<UiSell> {
  TextEditingController searchController = TextEditingController();
  double ratioGridView = 0;
  ValueNotifier<int> jumlah = ValueNotifier<int>(0);
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
      refreshIndicator: initData,
    );
  }

  Widget layoutTop() {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {});
                  },
                  label: Text("Menu", style: lv05TextStyleWhite),
                  icon: Icon(Icons.menu_rounded, color: Colors.white, size: 20),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),
                    minimumSize: const WidgetStatePropertyAll(Size(0, 0)),
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
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
                      isDense: true,
                      hintText: "Search...",
                      hintStyle: lv05TextStyle,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onChanged: (value) => context.read<SellBloc>().add(
                      SellSearchItem(text: value),
                    ),
                  ),
                ),

                const SizedBox(width: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("Penjualan", style: titleTextStyle),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 5),
                Expanded(
                  child: SizedBox(height: 27, child: UISellListViewKategori()),
                ),
                const SizedBox(width: 5),
                SizedBox(width: 140, child: UISellDropDownCabang()),

                const SizedBox(width: 5),

                UISellSavedCart(),
                const SizedBox(width: 5),
              ],
            ),
            Expanded(child: UISellGridViewItem()),
          ],
        ),
        UISellPopUpItem(),
      ],
    );
  }

  Widget layoutBottom() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(" Daftar Pesanan", style: titleTextStyle),
        Divider(color: Colors.grey[400], thickness: 1),
        Expanded(child: SellListViewOrderedItem()),
      ],
    );
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
}
