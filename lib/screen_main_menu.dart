import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition/transition_navigator/transition_up_down.dart';
import 'package:flutter_pos/template/layout_top_bottom_main_menu.dart';

class ScreenMainMenu extends StatefulWidget {
  const ScreenMainMenu({super.key});

  @override
  State<ScreenMainMenu> createState() => _ScreenMainMenuState();
}

class _ScreenMainMenuState extends State<ScreenMainMenu> {
  final currentPage = PageController();
  bool loading = true;
  String? nameCompany;
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

    getNameCompany();
  }

  Future<void> getNameCompany() async {
    UserSession.getUidUser();
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection("users")
        .doc(UserSession.getUidUser())
        .get();
    if (data.exists) {
      setState(() {
        nameCompany = data['name_company'];
      });
    }
  }

  _pageView(int page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (currentPage.hasClients) {
        currentPage.animateToPage(
          page,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutTopBottomMainMenu(
        pageview: (page) => _pageView(page),
        widgetTop: layoutTop(context),
        widgetBottom: layoutBottom(),
        nameCompany: nameCompany ?? "Mohon Tunggu",
      ),
    );
  }

  Widget layoutTop(BuildContext context) {
    return PageView(
      controller: currentPage,
      children: [
        GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,

          children: [
            gridViewMenu(
              () {
                navUpDownTransition(context, '/inventory', false);
              },
              Icon(Icons.inventory),
              "Inventori",
            ),
            gridViewMenu(
              () {
                navUpDownTransition(context, '/sell', false);
              },
              Icon(Icons.shopping_cart),
              "Transaksi",
            ),
            gridViewMenu(
              () {
                navUpDownTransition(context, '/report', false);
              },
              Icon(Icons.assignment_outlined),
              "Laporan",
            ),
          ],
        ),
        GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,

          children: [
            gridViewMenu(
              () {
                navUpDownTransition(context, '/partner', false);
              },
              Icon(Icons.inventory),
              "Data Kontak",
            ),
            gridViewMenu(
              () {
                navUpDownTransition(context, '/financial', false);
              },
              Icon(Icons.shopping_cart),
              "Data Alur Kas",
            ),
          ],
        ),
        GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,

          children: [
            gridViewMenu(
              () {
                navUpDownTransition(context, '/historytransaction', false);
              },
              Icon(Icons.inventory),
              "Riwayat Treansaksi",
            ),
            gridViewMenu(
              () {
                // navUpDownTransition(context, '/partner', false);
              },
              Icon(Icons.assignment_outlined),
              "Riwayat Kas",
            ),
          ],
        ),
      ],
    );
  }

  Widget layoutBottom() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(10),
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

  Widget gridViewMenu(VoidCallback onPressed, Icon? icon, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0, 0),
        padding: EdgeInsets.symmetric(horizontal: 8),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? SizedBox(width: 10),
          const SizedBox(height: 5),
          Text(text, style: lv05TextStyle, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
