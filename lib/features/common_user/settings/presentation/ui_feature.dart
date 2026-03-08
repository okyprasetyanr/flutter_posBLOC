import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_event.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UiFeature extends StatelessWidget {
  final ScrollController controller;
  const UiFeature({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPropertyColor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          controller: controller,
          children: [
            SizedBox(
              width: double.infinity,
              child: customTextBorder("Fitur", lv2TextStyleWhite),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("FIFO", style: lv1TextStyleBold),
                    BlocSelector<SettingsBloc, SettingsState, bool>(
                      selector: (state) {
                        if (state is SettingsFeatureLoaded) {
                          return state.isFifo;
                        }
                        return false;
                      },
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            context.read<SettingsBloc>().add(
                              SettingsFeatureFIFO(),
                            );
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            width: 100,
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: state
                                  ? AppPropertyColor.primary
                                  : AppPropertyColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      (state
                                              ? AppPropertyColor.black
                                              : AppPropertyColor.green)
                                          .withValues(alpha: 0.4),
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  curve: Curves.easeInOut,
                                  left: state ? -50 : 5,
                                  top: 1,
                                  duration: Duration(milliseconds: 500),
                                  child: Icon(
                                    Icons.check_circle_outline_rounded,
                                    size: lv2IconSize,
                                  ),
                                ),
                                AnimatedPositioned(
                                  curve: Curves.easeInOut,
                                  left: state ? 75 : 150,
                                  top: 1,
                                  duration: Duration(milliseconds: 500),
                                  child: Icon(
                                    Icons.check_circle_outline_rounded,
                                    size: lv2IconSize,
                                    color: AppPropertyColor.white,
                                  ),
                                ),
                                AnimatedPositioned(
                                  curve: Curves.easeInOut,
                                  top: 3,
                                  left: state ? -100 : 33,
                                  duration: Duration(milliseconds: 500),
                                  child: Text("Nonaktif", style: lv05TextStyle),
                                ),
                                AnimatedPositioned(
                                  curve: Curves.easeInOut,
                                  left: state ? 10 : 150,
                                  top: 3,
                                  duration: Duration(milliseconds: 500),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Aktif",
                                      style: lv05TextStyleWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: BlocSelector<SettingsBloc, SettingsState, (bool, StockMode)>(
                    selector: (state) => state is SettingsFeatureLoaded
                        ? (state.isFifo, state.selectedMode)
                        : (false, StockMode.FIFO),
                    builder: (context, state) => state.$1
                        ? DropdownButtonFormField<StockMode>(
                            initialValue: state.$2,
                            itemHeight: null,
                            isDense: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5),
                              labelText: "Metode Pengeluaran Stok",
                              labelStyle: lv1TextStyle,
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              context.read<SettingsBloc>().add(
                                SettingsFeatureSelectedStockMode(
                                  stockMode: value!,
                                ),
                              );
                            },
                            items: [
                              DropdownMenuItem(
                                value: StockMode.FIFO,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("FIFO", style: lv1TextStyleBold),
                                    Text(
                                      "Barang yang dibeli lebih dulu keluar lebih dulu",
                                      style: lv05TextStyleItalic,
                                    ),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: StockMode.FEFO,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("FEFO", style: lv1TextStyleBold),
                                    Text(
                                      "Barang dengan tanggal expired terdekat keluar dulu",
                                      style: lv05TextStyleItalic,
                                    ),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: StockMode.FIFOFEFO,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "FIFO + Expired",
                                      style: lv1TextStyleBold,
                                    ),
                                    Text(
                                      "FIFO, tapi jika tanggal beli sama cek Kadaluarsa",
                                      style: lv05TextStyleItalic,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
