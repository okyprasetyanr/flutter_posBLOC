import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/features/main_menu/logic/main_menu_bloc.dart';
import 'package:flutter_pos/features/main_menu/logic/main_menu_state.dart';
import 'package:flutter_pos/shared/helper/common_helper/function.dart';
import 'package:flutter_pos/shared/style_and_transition_text/style/style_font_size.dart';

class MainMenuFlowCart extends StatelessWidget {
  const MainMenuFlowCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            child: Text("Grafik Penjualan 1 Minggu", style: lv05TextStyle),
          ),
        ),
        SizedBox(
          height: 100,
          child:
              BlocSelector<
                DataReportBloc,
                DataReportState,
                (List<String>, double, double, List<FlSpot>)
              >(
                selector: (state) {
                  if (state is DataReportLoaded) {
                    return (
                      state.labels,
                      state.maxY,
                      state.smartInterval,
                      state.spot,
                    );
                  }
                  return ([], 4, 1, []);
                },
                builder: (context, state) => Card(
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
                        maxY: state.$2 * 1.2,
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
                              interval: state.$3,
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
                                if (index < 0 || index >= state.$1.length) {
                                  return const SizedBox.shrink();
                                }
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    state.$1[index],
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
                            spots: state.$4,
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
        ),
      ],
    );
  }
}
