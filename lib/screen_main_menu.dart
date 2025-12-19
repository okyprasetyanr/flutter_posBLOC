import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar_access.dart';
import 'package:flutter_pos/connection/firestore_worker.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition_text/transition_navigator/transition_up_down.dart';
import 'package:flutter_pos/template/layout_top_bottom_main_menu.dart';

class ScreenMainMenu extends StatefulWidget {
  const ScreenMainMenu({super.key});
  @override
  State<ScreenMainMenu> createState() => _ScreenMainMenuState();
}

class _ScreenMainMenuState extends State<ScreenMainMenu> {
  final currentPage = PageController();
  bool loading = true;
  final nameCompany = ValueNotifier<String?>(null);
  final selectedMenu = ValueNotifier<String>("Main");
  Map<Permission, bool> getPermission = {};
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      initUserSession();
      _listenConnection();
    });

    getPermission = context
        .read<DataUserRepositoryCache>()
        .dataAccount!
        .getPermissionsUser;
  }

  void _listenConnection() {
    if (kIsWeb) return;

    Connectivity().onConnectivityChanged.listen((result) async {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        await FirestoreWorker.processQueueHive();
      }
    });
  }

  Future<void> initUserSession() async {
    final repo = context.read<DataUserRepositoryCache>();
    await UserSession.init(repo);
    nameCompany.value = repo.dataCompany!.getnameCompany;
    getNameCompany();
  }

  Future<void> getNameCompany() async {
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection("companies")
        .doc(UserSession.getUidOwner())
        .get();
    if (data.exists) {}
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
        nameCompany: nameCompany,
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
                getPermission[Permission.Inventory]!
                    ? navUpDownTransition(context, '/inventory', false)
                    : getPermission[Permission.Stok]!
                    ? navUpDownTransition(context, '/batch', false)
                    : customSnackBarAccess(context: context);
              },
              Icon(Icons.inventory),
              "Inventori",
            ),
            gridViewMenu(
              () {
                getPermission[Permission.Penjualan]! ||
                        getPermission[Permission.Pembelian]!
                    ? navUpDownTransition(context, '/sell', false)
                    : getPermission[Permission.Pendapatan]! ||
                          getPermission[Permission.Pengeluaran]!
                    ? navUpDownTransition(context, '/transfinancial', false)
                    : customSnackBarAccess(context: context);
              },
              Icon(Icons.shopping_cart),
              "Transaksi",
            ),
            gridViewMenu(
              () {
                getPermission[Permission.Laporan]!
                    ? navUpDownTransition(context, '/report', false)
                    : customSnackBarAccess(context: context);
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
                getPermission[Permission.Data_Pelanggan]! ||
                        getPermission[Permission.Data_Pemasok]!
                    ? navUpDownTransition(context, '/partner', false)
                    : customSnackBarAccess(context: context);
              },
              Icon(Icons.inventory),
              "Data Kontak",
            ),
            gridViewMenu(
              () {
                getPermission[Permission.Data_Pemasukan]! ||
                        getPermission[Permission.Data_Pengeluaran]!
                    ? navUpDownTransition(context, '/financial', false)
                    : customSnackBarAccess(context: context);
              },
              Icon(Icons.shopping_cart),
              "Data Alur Kas",
            ),
            gridViewMenu(
              () {
                getPermission[Permission.Data_Operator]!
                    ? navUpDownTransition(context, '/operator', false)
                    : customSnackBarAccess(context: context);
              },
              Icon(Icons.shopping_cart),
              "Data Operator",
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
                getPermission[Permission.Riwayat_Penjualan]! ||
                        getPermission[Permission.Riwayat_Pembelian]!
                    ? navUpDownTransition(context, '/historytransaction', false)
                    : customSnackBarAccess(context: context);
              },
              Icon(Icons.inventory),
              "Riwayat Treansaksi",
            ),
            gridViewMenu(
              () {
                getPermission[Permission.Riwayat_Pendapatan]! ||
                        getPermission[Permission.Riwayat_Pengeluaran]!
                    ? navUpDownTransition(context, '/historyfinancial', false)
                    : customSnackBarAccess(context: context);
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
          icon ?? const SizedBox(width: 10),
          const SizedBox(height: 5),
          Text(text, style: lv05TextStyle, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
