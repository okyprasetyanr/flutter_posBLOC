import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_snack_bar.dart';
import 'package:flutter_pos/connection/firestore_worker.dart';
import 'package:flutter_pos/features/common_user/main_menu/presentation/widget/main_menu_feature_menu.dart';
import 'package:flutter_pos/features/common_user/main_menu/presentation/widget/main_menu_feature_main.dart';
import 'package:flutter_pos/features/common_user/main_menu/presentation/widget/main_menu_flow_cart.dart';
import 'package:flutter_pos/features/common_user/main_menu/presentation/widget/main_menu_header.dart';
import 'package:flutter_pos/features/common_user/main_menu/presentation/widget/main_menu_quick_report.dart';
import 'package:flutter_pos/features/common_user/main_menu/presentation/widget/main_menu_quick_report_detail.dart';
import 'package:flutter_pos/features/data_user/isar/action/get/get_data_isar_all.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/template/static_background.dart';

class PageMainMenu extends StatefulWidget {
  const PageMainMenu({super.key});

  @override
  State<PageMainMenu> createState() => _PageMainMenuState();
}

class _PageMainMenuState extends State<PageMainMenu> {
  final currentPage = PageController();
  final selectedMenu = ValueNotifier<String>("Dashboard");
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _listenConnection();
    });
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
                        child: FutureBuilder(
                          future: getAllCompanyIsar(),
                          builder: (context, snapshot) => Text(
                            snapshot.data?.nameCompany ?? "Mohon Tunggu...",
                            overflow: TextOverflow.ellipsis,
                            style: titleTextStyleWhite,
                          ),
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
        MainMenuHeader(),
        const SizedBox(height: 5),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: MainMenuFeatureMain(
                  currentPage: currentPage,
                  selectedMenu: selectedMenu,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(flex: 5, child: MainMenuQuickReport()),
            ],
          ),
        ),
      ],
    );
  }

  Widget widgetBottom(bool hideContent) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainMenuFeatureMenu(currentPage: currentPage),
              if (!hideContent) Expanded(child: MainMenuQuickReportDetail()),
              const SizedBox(height: 5),
              MainMenuFlowCart(),
            ],
          ),
        ),
      ],
    );
  }
}
