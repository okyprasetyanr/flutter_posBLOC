import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/colors.dart';
import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar_access.dart';
import 'package:flutter_pos/connection/firestore_worker.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/function/report_algoritm.dart';
import 'package:flutter_pos/model_data/model_user.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition_text/transition_navigator/transition_up_down.dart';

class UIMainMenu extends StatefulWidget {
  const UIMainMenu({super.key});

  @override
  State<UIMainMenu> createState() => _UIMainMenuState();
}

class _UIMainMenuState extends State<UIMainMenu> {
  final currentPage = PageController();
  final selectedMenu = ValueNotifier<String>("Main");
  Map<Permission, bool> getPermission = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _listenConnection();
    });

    getPermission = context
        .read<DataUserRepositoryCache>()
        .dataAccount!
        .getPermissionsUser;
  }

  Future<void> _listenConnection() async {
    if (kIsWeb) return;

    final conn = await Connectivity().checkConnectivity();
    if (conn != ConnectivityResult.none) {
      await FirestoreWorker.processQueueHive();
    } else {
      customSnackBar(context, "Koneksi tidak tersedia!");
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
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    AppPropertyText.AppName,
                    style: subTitleTextStyle,
                  ),
                ),
                Expanded(
                  child: Text(
                    context
                            .read<DataUserRepositoryCache>()
                            .dataCompany
                            ?.getnameCompany ??
                        "Mohon Tunggu...",
                    style: titleTextStyle,
                  ),
                ),
                Expanded(child: Image.asset("assets/logo.png", height: 50)),
              ],
            ),

            Expanded(
              child: OrientationBuilder(
                builder: (context, orientation) {
                  if (orientation == Orientation.portrait) {
                    return Column(
                      children: [
                        Flexible(fit: FlexFit.loose, child: widgetTop()),
                        const SizedBox(height: 10),
                        Flexible(fit: FlexFit.loose, child: widgetBottom()),
                      ],
                    );
                  } else {
                    return Row(
                      children: [
                        Expanded(child: widgetTop()),
                        const SizedBox(width: 10),
                        Expanded(child: widgetBottom()),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget widgetTop() {
    return Row(
      children: [
        Expanded(
          child: ListView(
            children: [
              listTileText(
                () {
                  _pageView(0);
                  selectedMenu.value = "Main";
                },
                Icons.dashboard_customize_sharp,
                "Main",
                selectedMenu,
              ),
              listTileText(
                () {
                  _pageView(1);
                  selectedMenu.value = "Data";
                },
                Icons.table_chart_rounded,
                "Data",
                selectedMenu,
              ),
              listTileText(
                () {
                  _pageView(2);
                  selectedMenu.value = "Riwayat";
                },
                Icons.work_history_rounded,
                "Riwayat",
                selectedMenu,
              ),
              listTileText(
                () {
                  navUpDownTransition(context, '/settings', false);
                },
                Icons.settings,
                "Pengaturan",
                selectedMenu,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        offset: Offset(0, 4),
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text("Laporan Singkat", style: lv1TextStyleBold),
                      rowContent("Total Penjualan", "0"),
                      rowContent("Total Keuntungan", "0"),
                      rowContent("Jumlah Transaksi", "0"),
                      rowContent("Jumlah Item Terjual", "0"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        offset: Offset(0, 4),
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      rowContent("Total Pendapatan", "0"),
                      rowContent("Total Pengeluaran", "0"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget widgetBottom() {
    final spots = buildWeeklyTransactionSpots(
      context.read<DataUserRepositoryCache>().dataTransSell,
    );
    final labels = buildWeeklyLabels();
    final maxY = spots
        .map((element) => element.y)
        .fold<double>(
          0,
          (previous, current) => current > previous ? current : previous,
        );

    return Column(
      children: [
        Expanded(
          child: PageView(
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
                          ? navUpDownTransition(
                              context,
                              '/transfinancial',
                              false,
                            )
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
                          ? navUpDownTransition(
                              context,
                              '/historytransaction',
                              false,
                            )
                          : customSnackBarAccess(context: context);
                    },
                    Icon(Icons.inventory),
                    "Riwayat Treansaksi",
                  ),
                  gridViewMenu(
                    () {
                      getPermission[Permission.Riwayat_Pendapatan]! ||
                              getPermission[Permission.Riwayat_Pengeluaran]!
                          ? navUpDownTransition(
                              context,
                              '/historyfinancial',
                              false,
                            )
                          : customSnackBarAccess(context: context);
                    },
                    Icon(Icons.assignment_outlined),
                    "Riwayat Kas",
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: 6,
              minY: 0,
              maxY: maxY == 0 ? 100000 : maxY * 1.2,

              gridData: FlGridData(show: true, drawVerticalLine: false),

              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.grey.shade300),
              ),

              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: maxY / 4,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        formatQtyOrPrice((value / 1000)),
                        style: const TextStyle(fontSize: 10),
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index < 0 || index >= labels.length) {
                        return const SizedBox.shrink();
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(labels[index]),
                      );
                    },
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),

              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  // tooltipBgColor: Colors.black87,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      return LineTooltipItem(
                        formatQtyOrPrice(spot.y),
                        const TextStyle(color: Colors.white),
                      );
                    }).toList();
                  },
                ),
              ),

              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  barWidth: 3,
                  color: Colors.blue,
                  dotData: FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.blue.withValues(alpha: 0.15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget listTileText(
  VoidCallback onTap,
  IconData leading,
  String text,
  ValueNotifier selectedMenu,
) {
  return ListTile(
    onTap: onTap,
    title: ValueListenableBuilder(
      valueListenable: selectedMenu,
      builder: (context, value, child) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: text == value
                ? AppPropertyColor.primary
                : Colors.transparent,
          ),
          child: Column(
            children: [
              Icon(leading, color: text == value ? Colors.black : Colors.white),
              Text(
                text,
                style: text == value ? lv05TextStyle : lv05TextStyleWhite,
                maxLines: 1,
              ),
            ],
          ),
        );
      },
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
