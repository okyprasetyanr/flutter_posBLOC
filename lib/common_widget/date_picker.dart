import 'package:flutter/material.dart';
import 'package:flutter_pos/colors/colors.dart';

Future<void> customDatePicker(
  bool dateEnd,
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
          datePickerTheme: DatePickerThemeData(
            confirmButtonStyle: const ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(AppColor.primary),
            ),
            cancelButtonStyle: const ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(AppColor.delete),
            ),
            headerHelpStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
            ),
            dayStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Colors.white,
            ),
            yearStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              color: AppColor.primary,
            ),
          ),
          dialogTheme: DialogThemeData(backgroundColor: Colors.black),
          colorScheme: ColorScheme.light(
            primary: AppColor.primary,
            onPrimary: Colors.white,
            onSurface: Colors.black,
            surface: Colors.white,
          ),
        ),
        child: child!,
      );
    },
  );
  if (pick != null) {
    picked(pick);
  }
}
