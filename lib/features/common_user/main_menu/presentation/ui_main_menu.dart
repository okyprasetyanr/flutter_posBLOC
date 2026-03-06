import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/row_content.dart';
import 'package:flutter_pos/common_widget/widget_custom_bottom_sheet.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar_access.dart';
import 'package:flutter_pos/common_widget/widget_dropdown_branch.dart';
import 'package:flutter_pos/connection/firestore_worker.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_bloc.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_event.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_state.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/function/function.dart';
import 'package:flutter_pos/function/report_algoritm.dart';
import 'package:flutter_pos/model_data/model_expired_item_batch.dart';
import 'package:flutter_pos/model_data/model_item.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition_text/transition_navigator/transition_up_down.dart';
import 'package:flutter_pos/style_and_transition_text/wave_animation.dart';
import 'package:flutter_pos/template/background.dart';

class UIMainMenu extends StatefulWidget {
  const UIMainMenu({super.key});

  @override
  State<UIMainMenu> createState() => _UIMainMenuState();
}

class _UIMainMenuState extends State<UIMainMenu> {
  final currentPage = PageController();
  final selectedMenu = ValueNotifier<String>("Dashboard");
  Map<Permission, bool> getPermission = {};

  @override
  void initState() {
    super.initState();
    context.read<DataReportBloc>().add(DataReportGetData());
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
      backgroundColor: AppPropertyColor.white,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset("assets/RingkasPosLogo.png", scale: 7),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppPropertyColor.primary,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            offset: Offset(0, 4),
                            color: AppPropertyColor.blackLight,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          context
                                  .read<DataUserRepositoryCache>()
                                  .dataCompany
                                  ?.getnameCompany ??
                              "Mohon Tunggu...",
                          overflow: TextOverflow.ellipsis,
                          style: titleTextStyleWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Expanded(
                child: OrientationBuilder(
                  builder: (context, orientation) {
                    if (orientation == Orientation.portrait) {
                      return Column(
                        children: [
                          Expanded(flex: 3, child: widgetTop()),
                          const SizedBox(height: 10),
                          Expanded(flex: 5, child: widgetBottom(false)),
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          Expanded(child: widgetTop()),
                          const SizedBox(width: 10),
                          Expanded(child: widgetBottom(true)),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetTop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppPropertyColor.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                offset: Offset(0, 4),
                color: AppPropertyColor.blackLight,
              ),
            ],
          ),
          child: Center(
            child: Text(
              "Halo ${context.read<DataUserRepositoryCache>().dataAccount!.getNameUser}, jualan lagi kita!",
              style: lv05TextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    listTileText(
                      () {
                        _pageView(0);
                        selectedMenu.value = "Dashboard";
                      },
                      Icons.dashboard_customize_sharp,
                      "Dashboard",
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
              const SizedBox(width: 5),
              Expanded(
                flex: 5,
                child:
                    BlocSelector<
                      DataReportBloc,
                      DataReportState,
                      (double, int, int, double, double)
                    >(
                      selector: (state) {
                        if (state is DataReportLoaded) {
                          return (
                            state.totalSell,
                            state.totalTransaction,
                            state.totalItemTranasction,
                            state.totalIncome,
                            state.totalExpense,
                          );
                        }
                        return (0.0, 0, 0, 0.0, 0.0);
                      },
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              width: 150,
                              child:
                                  BlocSelector<
                                    DataReportBloc,
                                    DataReportState,
                                    String
                                  >(
                                    selector: (state) {
                                      if (state is DataReportLoaded) {
                                        return state.idBranch!;
                                      }
                                      return "";
                                    },
                                    builder: (context, state) {
                                      return WidgetDropdownBranch(
                                        idBranch: state,
                                        selectedIdBranch: (selectedIdBranch) =>
                                            context.read<DataReportBloc>().add(
                                              DataReportGetData(
                                                idBranch: selectedIdBranch,
                                              ),
                                            ),
                                      );
                                    },
                                  ),
                            ),
                            DoubleWave(mirror: false),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 5,
                                bottom: 5,
                              ),
                              decoration: const BoxDecoration(
                                color: AppPropertyColor.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                boxShadow: [
                                  const BoxShadow(
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                    color: AppPropertyColor.blackLight,
                                  ),
                                ],
                              ),
                              child: Wrap(
                                children: [
                                  Center(
                                    child: Text(
                                      "Laporan Singkat",
                                      style: lv05TextStyleBold,
                                    ),
                                  ),
                                  rowContent(
                                    "Total Penjualan",
                                    formatPriceRp(state.$1),
                                  ),
                                  rowContent(
                                    "Jumlah Transaksi",
                                    formatQtyOrPrice(state.$2.toDouble()),
                                  ),
                                  rowContent(
                                    "Jumlah Item Terjual",
                                    formatQtyOrPrice(state.$3.toDouble()),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),

                            Flexible(
                              fit: FlexFit.loose,
                              child: Container(
                                margin: EdgeInsets.only(right: 5),
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: AppPropertyColor.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                      color: AppPropertyColor.blackLight,
                                    ),
                                  ],
                                ),
                                child: Wrap(
                                  children: [
                                    rowContent(
                                      "Total Pendapatan",
                                      formatPriceRp(state.$4),
                                    ),
                                    rowContent(
                                      "Total Pengeluaran",
                                      formatPriceRp(state.$5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DoubleWave(mirror: true),
                          ],
                        );
                      },
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget contentExpiredItem(
    List<ModelExpiredItemBatch> expiredItem,
    ScrollController controller,
  ) {
    return Column(
      children: [
        Text("Item Kadaluarsa", style: lv05TextStyleBold),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: expiredItem.length,
            controller: controller,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset("assets/Logo.png", height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(expiredItem[index].getNameItem),
                      Text("$expiredItem[index].gettotalExpired"),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: expiredItem[index].getInvoiceList.length,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                            color: AppPropertyColor.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          expiredItem[index].getInvoiceList[index],
                          style: lv05TextStyleItalic,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget widgetBottom(bool hideContent) {
    final dataSell = context
        .read<DataUserRepositoryCache>()
        .dataTransSell
        .where(
          (element) =>
              element.getstatusTransaction != ListStatusTransaction.Batal,
        )
        .toList();
    final spots = (dataSell.isEmpty)
        ? [const FlSpot(0, 0)]
        : buildWeeklyTransactionSpots(dataSell);

    final labels = buildWeeklyLabels();
    double rawMaxY = spots.isEmpty
        ? 0
        : spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    final maxY = rawMaxY == 0 ? 1000.0 : rawMaxY;
    double smartInterval = calculateSmartInterval(rawMaxY);
    double adjustedMaxY = (rawMaxY / smartInterval).ceil() * smartInterval;
    if (adjustedMaxY == 0) adjustedMaxY = smartInterval * 4;

    return Stack(
      children: [
        Positioned(
          top: 30,
          bottom: 0,
          left: 0,
          right: 0,
          child: ClipPath(
            clipper: WaveClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppPropertyColor.primary,
                    AppPropertyColor.primary.withValues(alpha: 0.2),
                  ],
                ),
              ),
              height: 250,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          top: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              SizedBox(
                height: 75,
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: currentPage,
                  children: [
                    GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: [
                        gridViewMenu(
                          () {
                            getPermission[Permission.Inventory]!
                                ? navUpDownTransition(
                                    context,
                                    '/inventory',
                                    false,
                                  )
                                : getPermission[Permission.Stok]!
                                ? navUpDownTransition(context, '/batch', false)
                                : customSnackBarAccess(context: context);
                          },
                          const Icon(
                            Icons.inventory,
                            color: AppPropertyColor.black,
                          ),
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
                          const Icon(
                            Icons.shopping_cart,
                            color: AppPropertyColor.black,
                          ),
                          "Transaksi",
                        ),
                        gridViewMenu(
                          () {
                            getPermission[Permission.Laporan]!
                                ? navUpDownTransition(context, '/report', false)
                                : customSnackBarAccess(context: context);
                          },
                          const Icon(
                            Icons.assignment_outlined,
                            color: AppPropertyColor.black,
                          ),
                          "Laporan",
                        ),
                      ],
                    ),
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,

                      children: [
                        gridViewMenu(
                          () {
                            getPermission[Permission.Data_Pelanggan]! ||
                                    getPermission[Permission.Data_Pemasok]!
                                ? navUpDownTransition(
                                    context,
                                    '/partner',
                                    false,
                                  )
                                : customSnackBarAccess(context: context);
                          },
                          const Icon(
                            Icons.inventory,
                            color: AppPropertyColor.black,
                          ),
                          "Data Kontak",
                        ),
                        gridViewMenu(
                          () {
                            getPermission[Permission.Data_Pemasukan]! ||
                                    getPermission[Permission.Data_Pengeluaran]!
                                ? navUpDownTransition(
                                    context,
                                    '/financial',
                                    false,
                                  )
                                : customSnackBarAccess(context: context);
                          },
                          const Icon(
                            Icons.shopping_cart,
                            color: AppPropertyColor.black,
                          ),
                          "Data Alur Kas",
                        ),
                        gridViewMenu(
                          () {
                            getPermission[Permission.Data_Operator]!
                                ? navUpDownTransition(
                                    context,
                                    '/operator',
                                    false,
                                  )
                                : customSnackBarAccess(context: context);
                          },
                          const Icon(
                            Icons.shopping_cart,
                            color: AppPropertyColor.black,
                          ),
                          "Data Operator",
                        ),
                      ],
                    ),
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      childAspectRatio: 1.5,
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
                          const Icon(
                            Icons.inventory,
                            color: AppPropertyColor.black,
                          ),
                          "Riwayat Treansaksi",
                        ),
                        gridViewMenu(
                          () {
                            getPermission[Permission.Riwayat_Pendapatan]! ||
                                    getPermission[Permission
                                        .Riwayat_Pengeluaran]!
                                ? navUpDownTransition(
                                    context,
                                    '/historyfinancial',
                                    false,
                                  )
                                : customSnackBarAccess(context: context);
                          },
                          const Icon(
                            Icons.assignment_outlined,
                            color: AppPropertyColor.black,
                          ),
                          "Riwayat Kas",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (!hideContent)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child:
                        BlocSelector<
                          DataReportBloc,
                          DataReportState,
                          (
                            ModelItem?,
                            ModelItem?,
                            ModelItem?,
                            List<ModelExpiredItemBatch>,
                            List<ModelExpiredItemBatch>,
                          )
                        >(
                          selector: (state) => state is DataReportLoaded
                              ? (
                                  state.bestSeller,
                                  state.worstSeller,
                                  state.lowStock,
                                  state.almostExpiredItem,
                                  state.expiredItem,
                                )
                              : (null, null, null, [], []),
                          builder: (context, state) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: summaryLayout(
                                        item: state.$1,
                                        label: "Terlaris",
                                        getName: (data) => data.getnameItem,
                                        getDetailData: (data) =>
                                            data.getqtyItem,
                                      ),
                                    ),
                                    Expanded(
                                      child: summaryLayout(
                                        item: state.$2,
                                        label: "Tidak laris",
                                        getName: (data) => data.getnameItem,
                                        getDetailData: (data) =>
                                            data.getqtyItem,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: summaryLayout(
                                        item: state.$3,
                                        label: "Stok menipis",
                                        getName: (data) => data.getnameItem,
                                        getDetailData: (data) =>
                                            data.getqtyItem,
                                        labelAfterName: "Sisa Stok",
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: summaryLayoutList(
                                              labelColor: AppPropertyColor
                                                  .secondPrimary,
                                              item: state.$4,
                                              label: "Hampir Kadaluarsa",
                                              getCount: (data) => data.length,
                                              onPressed: () {
                                                customBottomSheet(
                                                  context: context,
                                                  resetItemForm: null,
                                                  content: (scrollController) =>
                                                      contentExpiredItem(
                                                        state.$5,
                                                        scrollController,
                                                      ),
                                                );
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: summaryLayoutList(
                                              item: state.$5,
                                              label: "Sudah Kadaluarsa",
                                              getCount: (data) => data.length,
                                              onPressed: () {
                                                customBottomSheet(
                                                  context: context,
                                                  resetItemForm: null,
                                                  content: (scrollController) =>
                                                      contentExpiredItem(
                                                        state.$5,
                                                        scrollController,
                                                      ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                  ),
                ),

              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppPropertyColor.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Grafik Penjualan 1 Minggu",
                    style: lv05TextStyle,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: Card(
                  color: AppPropertyColor.white,
                  margin: EdgeInsets.zero,
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 2,
                      left: 8,
                      top: 8,
                      right: 20,
                    ),
                    child: LineChart(
                      LineChartData(
                        backgroundColor: AppPropertyColor.white,
                        minX: 0,
                        maxX: 6,
                        minY: 0,
                        maxY: maxY * 1.2,
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,
                        ),

                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: AppPropertyColor.greyLight),
                        ),

                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              reservedSize: 30,
                              showTitles: true,
                              interval: smartInterval,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                String text;
                                if (value >= 1000000) {
                                  text =
                                      '${(value / 1000000).toStringAsFixed(1)}jt';
                                } else if (value >= 1000) {
                                  text = '${(value / 1000).toInt()}k';
                                } else {
                                  text = value.toInt().toString();
                                }

                                return SideTitleWidget(
                                  meta: meta,
                                  space: 8,
                                  child: Text(
                                    text,
                                    style: lv05TextStyle,
                                    maxLines: 1,
                                  ),
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
                                  child: Text(
                                    labels[index],
                                    style: lv05TextStyle,
                                  ),
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
                            getTooltipItems: (touchedSpots) {
                              return touchedSpots.map((spot) {
                                return LineTooltipItem(
                                  formatPriceRp(spot.y),
                                  lv05TextStyleWhite,
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
                            color: AppPropertyColor.primary,
                            dotData: FlDotData(show: true),
                            belowBarData: BarAreaData(
                              show: true,
                              color: AppPropertyColor.primary.withValues(
                                alpha: 0.15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

double calculateSmartInterval(double maxVal) {
  if (maxVal <= 0) return 10000;
  double rawInterval = maxVal / 4;

  List<double> anchors = [
    1000,
    2000,
    5000,
    10000,
    20000,
    50000,
    100000,
    250000,
    500000,
    1000000,
  ];

  return anchors.firstWhere(
    (a) => a >= rawInterval,
    orElse: () => (rawInterval / 100000).ceil() * 100000.0,
  );
}

Widget listTileText(
  VoidCallback onTap,
  IconData leading,
  String text,
  ValueNotifier selectedMenu,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: ValueListenableBuilder(
      valueListenable: selectedMenu,
      builder: (context, value, child) {
        return customButton(
          backgroundColor: text == value
              ? AppPropertyColor.primary
              : AppPropertyColor.white,
          child: Column(
            children: [
              Icon(
                leading,
                color: text != value
                    ? AppPropertyColor.black
                    : AppPropertyColor.white,
              ),
              Text(
                text,
                style: text != value ? lv05TextStyle : lv05TextStyleWhite,
                maxLines: 1,
              ),
            ],
          ),
          onPressed: onTap,
        );
      },
    ),
  );
}

Widget gridViewMenu(VoidCallback onPressed, Icon? icon, String text) {
  return customButton(
    moreRadius: true,
    backgroundColor: AppPropertyColor.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon ?? const SizedBox(width: 10),
        const SizedBox(height: 5),
        Text(text, style: lv05TextStyle, textAlign: TextAlign.center),
      ],
    ),
    onPressed: onPressed,
  );
}

Widget summaryLayout<T>({
  required T? item,
  required String label,
  required Function(T data) getName,
  required Function(T data) getDetailData,
  String? labelAfterName,
}) {
  return Card(
    color: AppPropertyColor.white,
    elevation: 4,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppPropertyColor.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Text(
            label,
            style: lv05TextStyleWhite,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
          child: item != null
              ? Row(
                  children: [
                    Card(
                      elevation: 4,
                      child: Image.asset(
                        "assets/logo.png",
                        width: 25,
                        height: 25,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(getName(item), style: lv05TextStyle),
                          Text(
                            "${labelAfterName ?? "Terjual"}: ${formatQtyOrPrice(getDetailData(item))}",
                            style: lv05TextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(child: Text("-", style: lv2TextStyle)),
        ),
      ],
    ),
  );
}

Widget summaryLayoutList<T>({
  required T? item,
  required String label,
  required Function(T data) getCount,
  required Function() onPressed,
  Color? labelColor,
}) {
  return customButton(
    padding: false,
    backgroundColor: AppPropertyColor.white,
    child: Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: labelColor ?? AppPropertyColor.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Text(
            label,
            style: lv05TextStyleWhite,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: item != null
              ? Text("${getCount(item)}", style: lv3TextStyle)
              : Center(child: Text("-", style: lv4TextStyle)),
        ),
      ],
    ),

    onPressed: onPressed,
  );
}
