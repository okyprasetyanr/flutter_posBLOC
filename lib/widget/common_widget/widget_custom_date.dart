import 'package:flutter/material.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

class WidgetCustomDate extends StatelessWidget {
  final void Function(String, String, String) onSelected;
  const WidgetCustomDate({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    List<String> days = List.generate(31, (index) => '${index + 1}');
    List<String> months = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "12",
    ];
    List<String> years = List.generate(10, (index) => '${2025 + index}');

    String? selectedDay;
    String? selectedMonth;
    String? selectedYear;

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: DropdownButtonFormField<String>(
            style: lv05TextStyle,
            isDense: true,
            initialValue: selectedDay,
            hint: Text("...", style: lv05TextStyle),
            items: days
                .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                .toList(),
            onChanged: (value) {
              selectedDay = value;
              onSelected(
                selectedDay ?? '',
                selectedMonth ?? '',
                selectedYear ?? '',
              );
            },
            decoration: InputDecoration(
              labelText: "Tanggal",
              labelStyle: lv05TextStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 4),
            ),
          ),
        ),
        const SizedBox(width: 6),

        // Bulan
        Expanded(
          flex: 3,
          child: DropdownButtonFormField<String>(
            style: lv05TextStyle,
            isDense: true,
            initialValue: selectedMonth,
            hint: Text("...", style: lv05TextStyle),
            items: months
                .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                .toList(),
            onChanged: (value) {
              selectedMonth = value;
              onSelected(
                selectedDay ?? '',
                selectedMonth ?? '',
                selectedYear ?? '',
              );
            },
            decoration: InputDecoration(
              labelText: "Bulan",
              labelStyle: lv05TextStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 4),
            ),
          ),
        ),
        const SizedBox(width: 6),

        // Tahun
        Expanded(
          flex: 4,
          child: DropdownButtonFormField<String>(
            style: lv05TextStyle,
            initialValue: selectedYear,
            hint: Text("...", style: lv05TextStyle),
            items: years
                .map((y) => DropdownMenuItem(value: y, child: Text(y)))
                .toList(),
            onChanged: (value) {
              selectedYear = value;
              onSelected(
                selectedDay ?? '',
                selectedMonth ?? '',
                selectedYear ?? '',
              );
            },
            decoration: InputDecoration(
              labelText: "Tahun",
              labelStyle: lv05TextStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 4),
            ),
          ),
        ),
      ],
    );
  }
}
