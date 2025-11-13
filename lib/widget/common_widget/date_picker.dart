import 'package:flutter/material.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';

Future<void> customDatePicker(
  String text,
  BuildContext context,
  DateTime? selectedDate,
  Function(DateTime) picked,
) async {
  DateTime? pick = await showDatePicker(
    context: context,
    initialDate: selectedDate ?? DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    helpText: text,
    cancelText: "Batal",
    confirmText: "Selesai",
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          datePickerTheme: DatePickerThemeData(headerHelpStyle: lv4TextStyle),
        ),
        child: child!,
      );
    },
  );
  if (pick != null) {
    picked(pick);
  }
}
