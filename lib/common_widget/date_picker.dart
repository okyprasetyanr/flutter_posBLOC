import 'package:flutter/material.dart';
import 'package:flutter_pos/app_property/app_properties.dart';

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
              foregroundColor: WidgetStatePropertyAll(AppPropertyColor.primary),
            ),
            cancelButtonStyle: const ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(
                AppPropertyColor.deleteOrClose,
              ),
            ),
            headerHelpStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
            ),
            dayStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: AppPropertyColor.white,
            ),
            yearStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              color: AppPropertyColor.primary,
            ),
          ),
          dialogTheme: DialogThemeData(backgroundColor: AppPropertyColor.black),
          colorScheme: ColorScheme.light(
            primary: AppPropertyColor.primary,
            onPrimary: AppPropertyColor.white,
            onSurface: AppPropertyColor.black,
            surface: AppPropertyColor.white,
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
