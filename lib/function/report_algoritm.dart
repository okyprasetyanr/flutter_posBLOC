import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_pos/model_data/model_transaction.dart';
import 'package:intl/intl.dart';

List<FlSpot> buildWeeklyTransactionSpots(List<ModelTransaction> transactions) {
  final now = DateTime.now();

  DateTime normalize(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  final Map<DateTime, double> dailyTotal = {};

  for (final trans in transactions) {
    final date = normalize(trans.getdate);
    dailyTotal[date] = (dailyTotal[date] ?? 0) + trans.gettotal;
  }

  return List.generate(7, (index) {
    final day = normalize(now.subtract(Duration(days: 6 - index)));
    final total = dailyTotal[day] ?? 0.0;
    return FlSpot(index.toDouble(), total);
  });
}

List<String> buildWeeklyLabels() {
  final now = DateTime.now();
  final formatter = DateFormat('dd/MM');

  return List.generate(7, (index) {
    final day = now.subtract(Duration(days: 6 - index));
    return formatter.format(day);
  });
}
