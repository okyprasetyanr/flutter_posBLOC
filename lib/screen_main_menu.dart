import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/inventory/presentation/page/ui_inventory.dart';
import 'package:flutter_pos/features/sell/presentation/page/ui_sell.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition/transition_navigator/transition_UpDown.dart';
import 'package:flutter_pos/template/layout_top_bottom_main_menu.dart';

class ScreenMainMenu extends StatefulWidget {
  const ScreenMainMenu({super.key});

  @override
  State<ScreenMainMenu> createState() => _ScreenMainMenuState();
}

class _ScreenMainMenuState extends State<ScreenMainMenu> {
  bool loading = true;
  String? namaPerusahaan;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initUserSession();
    });
  }

  Future<void> initUserSession() async {
    final repo = context.read<DataUserRepositoryCache>();
    await UserSession.init(repo);

    getNamaPerusahaan();
  }

  Future<void> getNamaPerusahaan() async {
    UserSession.ambilUidUser();
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection("users")
        .doc(UserSession.ambilUidUser())
        .get();
    if (data.exists) {
      setState(() {
        namaPerusahaan = data['nama_perusahaan'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutTopBottomMainMenu(
        widgetTop: layoutTop(context),
        widgetBottom: layoutBottom(),
        namaPerusahaan: namaPerusahaan ?? "Mohon Tunggu",
      ),
    );
  }

  Widget layoutTop(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      childAspectRatio: 1,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,

      children: [
        gridViewMenu(
          () {
            navUpDownTransition(context, UIInventory(), false);
          },
          Icon(Icons.inventory),
          "Inventoryi",
        ),
        gridViewMenu(
          () {
            navUpDownTransition(context, UiSell(), false);
          },
          Icon(Icons.shopping_cart),
          "Transaksi",
        ),
        gridViewMenu(() {}, Icon(Icons.assignment_outlined), "Laporan"),
      ],
    );
  }

  Widget layoutBottom() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withValues(alpha: 0.4),
              offset: Offset(0, 0),
              spreadRadius: 10,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total Penjualan"),
                Text("Total Diskon"),
                Text("Total PPN"),
                Text("Penjualan Bersih"),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Rp.0"),
                Text("Rp.0"),
                Text("Rp.0"),
                Text("Rp.0"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget gridViewMenu(VoidCallback onPressed, Icon icon, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 5),
          Text(text, style: lv1TextStyle),
        ],
      ),
    );
  }
}
