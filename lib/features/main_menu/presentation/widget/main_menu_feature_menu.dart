import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_custom_snack_bar_access.dart';
import 'package:flutter_pos/shared/helper/enum_and_string/enum.dart';
import 'package:flutter_pos/features/main_menu/logic/main_menu_bloc.dart';
import 'package:flutter_pos/features/main_menu/logic/main_menu_state.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/shared/style_and_transition_text/transition_navigator/transition_up_down.dart';

class MainMenuFeatureMenu extends StatelessWidget {
  final PageController currentPage;
  const MainMenuFeatureMenu({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child:
          BlocSelector<DataReportBloc, DataReportState, Map<Permission, bool>>(
            selector: (state) => state is DataReportLoaded
                ? state.dataAccount!.getPermissionsUser
                : {
                    for (final permission in Permission.values)
                      permission: false,
                  },
            builder: (context, state) => PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: currentPage,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: gridViewMenu(
                          () {
                            state[Permission.Inventory]!
                                ? navUpDownTransition(
                                    context,
                                    '/inventory',
                                    false,
                                  )
                                : state[Permission.Stok]!
                                ? navUpDownTransition(context, '/batch', false)
                                : customSnackBarAccess(context: context);
                          },
                          const Icon(
                            Icons.inventory,
                            color: AppPropertyColor.black,
                          ),
                          "Inventori",
                        ),
                      ),
                      Expanded(
                        child: gridViewMenu(
                          () {
                            state[Permission.Penjualan]! ||
                                    state[Permission.Pembelian]!
                                ? navUpDownTransition(context, '/sell', false)
                                : state[Permission.Pendapatan]! ||
                                      state[Permission.Pengeluaran]!
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
                      ),
                      Expanded(
                        child: gridViewMenu(
                          () {
                            state[Permission.Laporan]!
                                ? navUpDownTransition(context, '/report', false)
                                : customSnackBarAccess(context: context);
                          },
                          const Icon(
                            Icons.assignment_outlined,
                            color: AppPropertyColor.black,
                          ),
                          "Laporan",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: gridViewMenu(
                          () {
                            state[Permission.Data_Pelanggan]! ||
                                    state[Permission.Data_Pemasok]!
                                ? navUpDownTransition(
                                    context,
                                    '/partner',
                                    false,
                                    arguments: true,
                                  )
                                : customSnackBarAccess(context: context);
                          },
                          const Icon(
                            Icons.contact_phone,
                            color: AppPropertyColor.black,
                          ),
                          "Kontak",
                        ),
                      ),
                      Expanded(
                        child: gridViewMenu(
                          () {
                            state[Permission.Data_Pemasukan]! ||
                                    state[Permission.Data_Pengeluaran]!
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
                          "Alur Kas",
                        ),
                      ),
                      Expanded(
                        child: gridViewMenu(
                          () {
                            state[Permission.Data_Operator]!
                                ? navUpDownTransition(
                                    context,
                                    '/operator',
                                    false,
                                  )
                                : customSnackBarAccess(context: context);
                          },
                          const Icon(
                            Icons.person,
                            color: AppPropertyColor.black,
                          ),
                          "Operator",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: gridViewMenu(
                          () {
                            state[Permission.Riwayat_Penjualan]! ||
                                    state[Permission.Riwayat_Pembelian]!
                                ? navUpDownTransition(
                                    context,
                                    '/historytransaction',
                                    false,
                                  )
                                : customSnackBarAccess(context: context);
                          },
                          const Icon(
                            Icons.history,
                            color: AppPropertyColor.black,
                          ),
                          "Riwayat Treansaksi",
                        ),
                      ),
                      Expanded(
                        child: gridViewMenu(
                          () {
                            state[Permission.Riwayat_Pendapatan]! ||
                                    state[Permission.Riwayat_Pengeluaran]!
                                ? navUpDownTransition(
                                    context,
                                    '/historyfinancial',
                                    false,
                                  )
                                : customSnackBarAccess(context: context);
                          },
                          const Icon(
                            Icons.history,
                            color: AppPropertyColor.black,
                          ),
                          "Riwayat Kas",
                        ),
                      ),
                      Expanded(
                        child: gridViewMenu(
                          () {
                            state[Permission.Riwayat_Penyesuaian]! ||
                                    state[Permission.Riwayat_Pengeluaran]!
                                ? navUpDownTransition(
                                    context,
                                    '/historyadjustment',
                                    false,
                                  )
                                : customSnackBarAccess(context: context);
                          },
                          const Icon(
                            Icons.history,
                            color: AppPropertyColor.black,
                          ),
                          "Riwayat Penyesuaian",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
          Text(
            text,
            style: lv05TextStyle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
