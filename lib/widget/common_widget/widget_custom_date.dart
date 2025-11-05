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
    List<String> years = List.generate(100, (index) => '${2025 - index}');

    String? selectedDay;
    String? selectedMonth;
    String? selectedYear;

    return Row(
      children: [
        Expanded(
          child: Material(
            shadowColor: Colors.black,
            elevation: 4,
            borderRadius: BorderRadius.circular(15),
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              initialValue: selectedDay,
              hint: Text("Tanggal", style: hintTextStyle),
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
                labelStyle: labelTextStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Bulan
        Expanded(
          child: Material(
            shadowColor: Colors.black,
            elevation: 4,
            borderRadius: BorderRadius.circular(15),
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              initialValue: selectedMonth,
              hint: Text("Bulan", style: hintTextStyle),
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
                labelStyle: labelTextStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),

        // Tahun
        Expanded(
          child: Material(
            shadowColor: Colors.black,
            elevation: 4,
            borderRadius: BorderRadius.circular(15),
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              initialValue: selectedYear,
              hint: Text("Tahun", style: hintTextStyle),
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
                labelStyle: labelTextStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
